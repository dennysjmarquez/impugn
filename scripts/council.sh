#!/bin/bash

# council.sh — Orquestador del AI Council Framework
# Multi-model consensus with structured debate, anti-sycophancy, and Fresh Eyes.
# Alineado con focuslead/ai-council-framework.
#
# Uso: ./council.sh "<pregunta>" [MODO]
# Modos: QUICK (2 models, 0 rounds)
#        BALANCED (3 models, 1 round, fresh eyes) [default]
#        THOROUGH (5 models + lateral thinker, 2 rounds, fresh eyes)
#        RIGOROUS (5 models + lateral thinker, 3 rounds, fresh eyes)
#        EXHAUSTIVE (5 models + lateral thinker, 3 rounds, fresh eyes)
#
# Output: solo la decision final a stdout. Proceso completo a stderr.
#   Resultado=$(./council.sh "pregunta") captura solo la decision.
#
# Sin Ollama local. OpenCode nativo primario, OpenRouter :free fallback.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
QUERY_SCRIPT="$SCRIPT_DIR/query.sh"
PROMPTS_DIR="$SCRIPT_DIR/../reference/prompts"

# --- Ayuda ---
show_help() {
    cat >&2 <<'EOF'
CONSEJO IA — AI Council Framework

Uso: council.sh "<pregunta>" [MODO]
     council.sh --help

MODOS
  QUICK       2 modelos, 0 rondas debate, sin Fresh Eyes
  BALANCED    3 modelos, 1 ronda debate, Fresh Eyes  [default]
  THOROUGH    5 modelos (+ lateral thinker), 2 rondas debate, Fresh Eyes
  RIGOROUS    5 modelos (+ lateral thinker), 3 rondas debate, Fresh Eyes
  EXHAUSTIVE  5 modelos + lateral thinker, 3 rondas debate, Fresh Eyes

MODELOS POR MODO
  QUICK:      mimo-v2.5-free + openrouter/free
  BALANCED:   + north-mini-code-free
  THOROUGH:   + gpt-oss-120b:free + lateral thinker
  EXHAUSTIVE: + big-pickle
  Fallback universal: openrouter/openrouter/free

LATERAL THINKER
  Presente en THOROUGH+. En Ronda 1 rompe supuestos de la pregunta.
  En Ronda 2+ rompe supuestos que emergieron del debate.
  No responde la pregunta directamente — solo perturba.

SCRIPTS EN ./scripts/
  council.sh       Este orquestador
  council-agent.sh Wrapper legacy por rol
  query.sh         Ejecutor opencode run con parseo y limpieza

EOF
    exit 0
}

QUESTION="$1"
MODE="${2:-BALANCED}"

# --- Help flag ---
if [ "$QUESTION" = "--help" ] || [ "$QUESTION" = "-h" ] || [ "$QUESTION" = "help" ]; then
    show_help
fi

# --- Validacion ---
if [ -z "$QUESTION" ]; then
    show_help
fi

case "$MODE" in
    QUICK|BALANCED|THOROUGH|RIGOROUS|EXHAUSTIVE) ;;
    *) echo "ERROR: Modo invalido: $MODE" >&2; exit 1 ;;
esac

# --- Pre-procesamiento: detectar archivos en la pregunta e inyectar su contenido ---
FILE_PATHS=$(echo "$QUESTION" | grep -oP '/[a-zA-Z0-9_./-]+' | sort -u)
for fp in $FILE_PATHS; do
    if [ -f "$fp" ]; then
        FILESIZE=$(wc -c < "$fp")
        if [ "$FILESIZE" -gt 0 ] && [ "$FILESIZE" -lt 50000 ]; then
            CONTENT=$(cat "$fp")
            QUESTION="$QUESTION

--- CONTENIDO DEL ARCHIVO: $fp ---
$CONTENT"
        fi
    fi
done

# --- Configuracion por modo ---
LATERAL_SLOT=-1
case "$MODE" in
    QUICK)
        N_MODELS=2; ROUNDS=0; FE=false
        PRIMARY_MODELS=("opencode/mimo-v2.5-free" "openrouter/openrouter/free")
        FALLBACK_MODELS=("openrouter/openrouter/free" "opencode/north-mini-code-free")
        ;;
    BALANCED)
        N_MODELS=3; ROUNDS=1; FE=true
        PRIMARY_MODELS=("opencode/mimo-v2.5-free" "opencode/north-mini-code-free" "openrouter/openrouter/free")
        FALLBACK_MODELS=("openrouter/openrouter/free" "openrouter/openrouter/free" "opencode/mimo-v2.5-free")
        ;;
    THOROUGH)
        N_MODELS=5; ROUNDS=2; FE=true
        LATERAL_SLOT=4
        PRIMARY_MODELS=("opencode/mimo-v2.5-free" "opencode/north-mini-code-free" "openrouter/openai/gpt-oss-120b:free" "openrouter/openrouter/free" "openrouter/openrouter/free")
        FALLBACK_MODELS=("openrouter/openrouter/free" "openrouter/openrouter/free" "opencode/mimo-v2.5-free" "opencode/north-mini-code-free" "opencode/mimo-v2.5-free")
        ;;
    RIGOROUS)
        N_MODELS=5; ROUNDS=3; FE=true
        LATERAL_SLOT=4
        PRIMARY_MODELS=("opencode/mimo-v2.5-free" "opencode/north-mini-code-free" "openrouter/openai/gpt-oss-120b:free" "openrouter/openrouter/free" "openrouter/openrouter/free")
        FALLBACK_MODELS=("openrouter/openrouter/free" "openrouter/openrouter/free" "opencode/mimo-v2.5-free" "opencode/north-mini-code-free" "opencode/mimo-v2.5-free")
        ;;
    EXHAUSTIVE)
        N_MODELS=5; ROUNDS=3; FE=true
        LATERAL_SLOT=4
        PRIMARY_MODELS=("opencode/mimo-v2.5-free" "opencode/north-mini-code-free" "openrouter/openai/gpt-oss-120b:free" "openrouter/openrouter/free" "openrouter/openrouter/free")
        FALLBACK_MODELS=("openrouter/openrouter/free" "openrouter/openrouter/free" "opencode/mimo-v2.5-free" "opencode/north-mini-code-free" "opencode/mimo-v2.5-free")
        ;;
esac

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

echo "  CONSEJO IA — $MODE | $N_MODELS modelos, $ROUNDS rondas, FE: $FE" >&2
echo "============================================" >&2
echo "" >&2

# --- Helpers ---

# Extraer nombre corto del modelo
model_short() {
    local m="$1"
    m="${m#opencode/}"
    m="${m#openrouter/}"
    echo "${m%%:*}"
}

# Renderizar template con sustituciones
render() {
    local file="$1"
    shift
    python3 -c "
import sys
content = open(sys.argv[1]).read()
pairs = sys.argv[2:]
for i in range(0, len(pairs), 2):
    content = content.replace('{' + pairs[i] + '}', pairs[i+1])
sys.stdout.write(content)
" "$file" "$@"
}

# Ejecutar un modelo, guardar resultado en archivo
run_one() {
    local idx="$1"
    local prompt_file="$2"
    local phase="$3"
    shift 3
    local primary="${PRIMARY_MODELS[$idx]}"
    local fallback="${FALLBACK_MODELS[$idx]}"
    local prompt

    # Usar lateral-thinker.md para el slot lateral
    if [ "$idx" = "$LATERAL_SLOT" ] && [ "$LATERAL_SLOT" -ge 0 ]; then
        prompt_file="$PROMPTS_DIR/lateral-thinker.md"
    fi

    prompt=$(render "$prompt_file" "$@")
    "$QUERY_SCRIPT" "$primary" "$fallback" "$prompt" "" > "$TMPDIR/r_${idx}_${phase}.txt" 2>/dev/null
    if [ ! -s "$TMPDIR/r_${idx}_${phase}.txt" ]; then
        echo "[SIN RESPUESTA]" > "$TMPDIR/r_${idx}_${phase}.txt"
    fi
}

# Ejecutar todos los modelos en paralelo
run_parallel() {
    local prompt_file="$1"
    local phase="$2"
    shift 2
    local pids=()
    for i in $(seq 0 $((N_MODELS - 1))); do
        run_one "$i" "$prompt_file" "$phase" "$@" &
        pids[$i]=$!
    done
    local ok=0
    for i in $(seq 0 $((N_MODELS - 1))); do
        wait "${pids[$i]}" 2>/dev/null || true
        [ -s "$TMPDIR/r_${i}_${phase}.txt" ] && ok=$((ok + 1))
    done
    echo "$ok"
}

# Colectar respuestas de una fase en un unico string
collect_responses() {
    local phase="$1"
    local responses=""
    for i in $(seq 0 $((N_MODELS - 1))); do
        local f="$TMPDIR/r_${i}_${phase}.txt"
        local sn=$(model_short "${PRIMARY_MODELS[$i]}")
        local content=""
        [ -f "$f" ] && content=$(cat "$f")
        responses+="### Respuesta de $sn"$'\n'"$content"$'\n\n'
    done
    echo "$responses"
}

# Obtener la recomendacion final del PM
extract_recommendation() {
    local text="$1"
    echo "$text" | python3 -c "
import sys
text = sys.stdin.read()
in_section = False
rec_lines = []
for line in text.split('\n'):
    if 'FINAL RECOMMENDATION' in line.upper():
        in_section = True
        continue
    if in_section:
        if line.strip() == '':
            in_section = False if rec_lines else True
            continue
        if any(h in line for h in ['1.', '2.', '3.', '4.', '5.', '6.', 'MINORITY', 'CONSENSUS', 'SPLIT', 'UNSUPPORTED', 'CONFIDENCE']):
            in_section = False
            continue
        rec_lines.append(line.strip())
print(' '.join(rec_lines) if rec_lines else text[:500])
"
}

# --- FASE 1: RONDA 1 (independiente) ---
echo "--- FASE 1: RONDA 1 (independiente) ---" >&2
echo "Consultando $N_MODELS modelos en paralelo..." >&2

ok1=$(run_parallel "$PROMPTS_DIR/council-round1.md" "r1" \
    "QUESTION" "$QUESTION" \
    "PM_SYNTHESIS" "")

echo "Respuestas recibidas: $ok1/$N_MODELS" >&2
echo "" >&2

if [ "$ok1" -eq 0 ]; then
    echo "ERROR: Ningun modelo respondio. Abortando." >&2
    exit 1
fi

if [ "$ok1" -lt "$N_MODELS" ]; then
    fallos=$((N_MODELS - ok1))
    echo "ADVERTENCIA: $fallos modelo(s) fallaron. Continuando con los disponibles." >&2
fi

R1_RESPONSES=$(collect_responses "r1")

# --- FASE 2: SINTESIS PM ---
echo "--- FASE 2: SINTESIS PM ---" >&2
echo "Sintetizando respuestas..." >&2

PM_SYNTHESIS=$(render "$PROMPTS_DIR/council-pm.md" \
    "QUESTION" "$QUESTION" \
    "RESPONSES" "$R1_RESPONSES")

PM_PRIMARY="opencode/big-pickle"
PM_FALLBACK="openrouter/openrouter/free"
FE_PRIMARY="openrouter/openrouter/free"
FE_FALLBACK="opencode/mimo-v2.5-free"

    PM_RESULT=$("$QUERY_SCRIPT" "$PM_PRIMARY" "$PM_FALLBACK" "$PM_SYNTHESIS" "" 2>/dev/null)
    echo "$PM_RESULT" >&2
    echo "" >&2

# --- FASE 3: DEBATE (si ROUNDS > 0) ---
CURRENT_SYNTHESIS="$PM_RESULT"
for round in $(seq 1 "$ROUNDS"); do
    echo "--- FASE 3: RONDA $((round + 1)) (debate) ---" >&2

    ok_debate=$(run_parallel "$PROMPTS_DIR/council-round2.md" "r$((round + 1))" \
        "PM_SYNTHESIS" "$CURRENT_SYNTHESIS" \
        "QUESTION" "$QUESTION")
    echo "Respuestas de debate: $ok_debate/$N_MODELS" >&2
    echo "" >&2

    DEBATE_RESPONSES=$(collect_responses "r$((round + 1))")

    echo "--- Re-sintesis post-debate ---" >&2
    PM_INPUT=$(render "$PROMPTS_DIR/council-pm.md" \
        "QUESTION" "$QUESTION" \
        "RESPONSES" "=== CURRENT SYNTHESIS ===
$CURRENT_SYNTHESIS
=== DEBATE ROUND $round ===
$DEBATE_RESPONSES")

    CURRENT_SYNTHESIS=$("$QUERY_SCRIPT" "$PM_PRIMARY" "$PM_FALLBACK" "$PM_INPUT" "" 2>/dev/null)
    echo "$CURRENT_SYNTHESIS" >&2
    echo "" >&2
done

# --- FASE 4: FRESH EYES (si aplica) ---
FE_RESULT=""
if [ "$FE" = true ]; then
    echo "--- FASE 4: FRESH EYES (validacion independiente) ---" >&2

    RECOMMENDATION=$(extract_recommendation "$CURRENT_SYNTHESIS")

    FE_PROMPT=$(render "$PROMPTS_DIR/council-fresh-eyes.md" \
        "QUESTION" "$QUESTION" \
        "RECOMMENDATION" "$RECOMMENDATION")

    FE_RESULT=$("$QUERY_SCRIPT" "$FE_PRIMARY" "$FE_FALLBACK" "$FE_PROMPT" "" 2>/dev/null)
    echo "$FE_RESULT" >&2
    echo "" >&2
fi

# --- SALIDA FINAL (stdout — esto es lo que captura quien llame al council) ---
echo "$CURRENT_SYNTHESIS"
if [ "$FE" = true ] && [ -n "$FE_RESULT" ]; then
    echo ""
    echo "--- FRESH EYES ---"
    echo "$FE_RESULT"
fi