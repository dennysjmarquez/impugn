#!/bin/bash

# query.sh — Ejecuta opencode con un modelo específico y devuelve solo la respuesta
# Uso: ./query.sh <modelo_primario> <modelo_fallback> <system_prompt> <user_prompt>
#
# Seguridad:
# - timeout 45s por llamada a opencode run
# - Tag único (timestamp+random) en --title para localizar y borrar la sesión
# - Nunca borra sesiones sin tag
# - Solo imprime la respuesta de texto (sin JSON noise en el contexto)

PRIMARY_MODEL="$1"
FALLBACK_MODEL="$2"
SYSTEM_PROMPT="$3"
USER_PROMPT="$4"

# Validar argumentos
if [ -z "$PRIMARY_MODEL" ] || [ -z "$SYSTEM_PROMPT" ]; then
    echo "ERROR: Uso: query.sh <modelo> <fallback> <system_prompt> <user_prompt>"
    exit 1
fi

# Verificar dependencias
if ! command -v jq &>/dev/null; then
    echo "ERROR: 'jq' no está instalado. Instalar con: sudo apt install jq" >&2
    exit 1
fi

# Si no hay fallback, usar el primario
if [ -z "$FALLBACK_MODEL" ]; then
    FALLBACK_MODEL="$PRIMARY_MODEL"
fi

# Construir prompt completo
FULL_PROMPT="${SYSTEM_PROMPT}"
if [ -n "$USER_PROMPT" ]; then
    FULL_PROMPT="${SYSTEM_PROMPT}

${USER_PROMPT}"
fi

# Generar tag único para la sesión (permite limpiar incluso si timeout)
TAG="council-$(date +%s)-$$"

# Trap EXIT: garantiza limpiar la sesión sin importar cómo termine el script
cleanup_session_by_tag() {
    local tag="$1"
    local sid
    sid=$(opencode session list 2>/dev/null | grep "$tag" | awk '{print $1}')
    if [ -n "$sid" ]; then
        opencode session delete "$sid" >/dev/null 2>&1
    fi
}
trap "cleanup_session_by_tag '$TAG'" EXIT

execute_query() {
    local model="$1"
    local prompt="$2"

    # Ejecutar opencode con timeout de 45s.
    # --title con tag único para poder limpiar incluso si timeout mata el proceso.
    # stderr a /dev/null (logs internos de opencode).
    local json_output
    json_output=$(timeout 45 opencode run -m "$model" --format json --title "$TAG" "$prompt" 2>/dev/null)
    local exit_code=$?

    if [ $exit_code -eq 124 ]; then
        echo ""
        return 1
    fi

    # Extraer texto de respuesta (concatenar TODOS los eventos text)
    local response
    response=$(echo "$json_output" | jq -r '[select(.type=="text") | .part.text] | join("")' 2>/dev/null)

    echo "$response"
    return 0
}

# Intentar con modelo primario
RESULT=$(execute_query "$PRIMARY_MODEL" "$FULL_PROMPT")

if [ -n "$RESULT" ] && [ "$RESULT" != "null" ]; then
    echo "$RESULT"
    exit 0
fi

# Si falló y hay fallback diferente, intentar
if [ "$FALLBACK_MODEL" != "$PRIMARY_MODEL" ]; then
    RESULT=$(execute_query "$FALLBACK_MODEL" "$FULL_PROMPT")
    if [ -n "$RESULT" ] && [ "$RESULT" != "null" ]; then
        echo "$RESULT"
        exit 0
    fi
fi

exit 1
