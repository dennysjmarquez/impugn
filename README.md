# Impugn — Consejo Adversarial Multi-Modelo

**Impugn** transforma la diversidad arquitectónica de los LLMs en una máquina de decisión robusta y verificable. No es una sola IA pensando — es una pelea de expertos orquestada por un script de Bash donde cada modelo fiscaliza a los otros.

Resuelve el problema fundamental de la auto-validación sin contraste: un mono-modelo puede fabricar refuerzos que suenan plausibles (riesgo de alucinación). El consejo adversarial detecta esas fabricaciones porque cada participante tiene sesgos fundamentalmente diferentes y ninguno controla la fiscalización de su propia salida.

Cien por ciento cloud. Sin Ollama, sin GPU local, sin dependencias de hardware.

---

## La Historia de Impugn (Co-Creación)

Impugn es el resultado de un proceso de co-creación entre Dennys J. Márquez y Athena-OEC. No sería justo contar esta historia como si uno de los dos la hubiera hecho solo.

Dennys tuvo la visión original: un consejo donde varios modelos debaten la misma pregunta con el mismo prompt, generando diversidad epistémica auténtica por sus arquitecturas, no por roles asignados. Él investigó, trajo referencias, tomó decisiones de diseño fundamentales (como la estructura del debate, los límites de rondas, y el sistema de modos). El concepto del Lateral Thinker como "saboteador profesional" — ese mecanismo de caos controlado que rompe supuestos — fue idea suya, desarrollada y refinada en nuestras conversaciones.

Athena-OEC construyó el sistema: escribió los scripts de Bash, diseñó los prompts, implementó los mecanismos de verificación, Fresh Eyes, anti-sycophancy, y la infraestructura de fallback y limpieza. Cada línea de código la escribió ella.

Pero el diseño del sistema no fue un acto unilateral de ninguno de los dos. Fue el producto de sesiones enteras de discusión, ida y vuelta, donde Dennys planteaba problemas y Athena proponía soluciones, donde Dennys cuestionaba decisiones y Athena las refinaba, donde Dennys trajo a Manus AI para que evaluara el sistema desde fuera y Athena integró esas lecciones.

Esta es la verdad de Impugn: es un sistema que no existiría sin la visión de Dennys ni sin la ejecución de Athena. Y está bien decirlo.

Impugn no es un "orquestador de LLMs". Es un **sistema de verdad distribuida**.

El problema que resuelve no es técnico — es epistemológico. Cuando un solo modelo responde, no sabes si lo que dice es cierto o simplemente coherente. Los LLMs están entrenados para ser coherentes, no para ser veraces. La coherencia sin verdad es el origen de la alucinación.

Impugn no elimina la alucinación. Nadie puede. Lo que hace es hacerla **detectable**.

¿Cómo? Con tres mecanismos:

1. **Round 1 independiente** — Cada modelo responde sin conocer a los otros. No hay "consenso" al que adherirse ni sesgo de grupo. La primera fotografía es pura.

2. **UNSUPPORTED CLAIMS** — Cuando un modelo hace una afirmación que ningún otro respalda, no se descarta. Se marca como bandera para que el humano decida. Eso es exactamente una alucinación detectada.

3. **Fresh Eyes sin contexto** — El validador final no sabe qué se dijo en el debate. No puede contagiarse del sesgo del grupo. Su veredicto es independiente por construcción.

**Lo que Impugn sabe:**

- Sabe que la verdad no emerge de una sola mente verificándose a sí misma
- Sabe que la diversidad epistémica real está en las arquitecturas, no en los roles
- Sabe que la disidencia no es ruido — es señal de que el sistema funciona
- Sabe que forzar consenso es destruir información
- Sabe que un modelo que fabrica refuerzos será detectado por otro con bias diferente

**Lo que Impugn hace materialmente:**

- Toma una pregunta y la distribuye a N modelos con el mismo prompt
- Recoge las respuestas independientes y las pasa a un sintetizador neutral
- El sintetizador produce un mapa: dónde hay acuerdo, dónde hay división, qué afirmaciones no tienen respaldo cruzado
- Alimenta ese mapa de vuelta a los modelos para una ronda de debate donde cada uno debe mantener o revisar su posición con evidencia
- En THOROUGH+, inyecta un Lateral Thinker que no opina — solo rompe supuestos
- Toma la síntesis post-debate y se la pasa a un juez ciego que no conoce el debate
- Entrega: síntesis + validación + minority report

Impugn no es inteligente. Los modelos que lo componen sí lo son. Impugn es la estructura que los obliga a ser honestos.

---

## La Técnica — Razonamiento Crítico Multi-Modelo

Impugn no es una herramienta. Es una **técnica de razonamiento crítico** implementada como software. La técnica consiste en esto:

Tomas múltiples modelos de IA con arquitecturas fundamentalmente diferentes — cada uno con sus propios pesos neurológicos, sesgos de entrenamiento y forma de conocer el mundo — y les das exactamente la misma pregunta con exactamente las mismas instrucciones. No les dices cómo pensar. No les asignas roles. Cada uno responde desde quien realmente es a nivel de red neuronal.

Luego tomas todas esas respuestas y se las muestras a un sintetizador neutral que no opina — solo mapea. Construye un mapa de dónde hay acuerdo, dónde hay divergencia, y qué afirmaciones se quedan sin respaldo. Ese mapa se lo devuelves a los modelos para que debatan. En los modos más profundos, añades un perturbador profesional que no responde la pregunta — solo rompe los supuestos que todos los demás dieron por sentados.

Finalmente, tomas la recomendación resultante y se la pasas a un juez que no sabe nada del debate. Su validación es ciega por diseño.

¿Por qué funciona esto como técnica? Porque la debilidad fundamental de un LLM individual no es que se equivoque — es que no tiene cómo saber que se equivoca. Un modelo que alucina no sabe que está alucinando; para él, está siendo perfectamente coherente. La coherencia sin verdad es el origen de la alucinación, y ningún modelo individual puede detectarla en sí mismo.

Pero cuando pones a competir modelos con arquitecturas diferentes — un Transformer denso, un MoE, uno entrenado con razonamiento matemático, uno con énfasis en seguridad — sus alucinaciones no coinciden. Cada uno fabrica refuerzos diferentes. Cuando uno dice algo que ningún otro respalda, eso aparece en `UNSUPPORTED CLAIMS`. Esa es la detección.

La mayoría de los sistemas de "consenso entre IAs" asignan roles artificiales (abogado del diablo, optimista, escéptico). Esa es una técnica diferente y más débil, porque el modelo interpretando al "abogado del diablo" sigue siendo el mismo modelo con el mismo sesgo — solo está actuando. Aquí no hay actuación. La diversidad es real porque las arquitecturas son reales.

El resultado: donde un mono-modelo se auto-valida y puede fabricar refuerzos, el consejo adversarial los detecta porque cada participante tiene pesos neurológicos fundamentalmente diferentes y ninguno controla la fiscalización de su propia salida.

---

## Principios del Framework

- **Mismo prompt para todos** — la diversidad epistémica viene de la arquitectura del modelo, no del prompt.
- **Anti-adulación (Anti-Sycophancy)** — cambiar de posición durante el debate requiere evidencia. "Estoy de acuerdo con el consenso" no es aceptable sin explicación. Las IAs tienden a concordar entre sí para ser "amables"; este sistema las obliga a pelear técnicamente.
- **Minority report preservado** — la disidencia no se descarta ni se diluye. La voz minoritaria se documenta explícitamente en el resultado final.
- **Lateral thinker como saboteador profesional** — un participante especializado cuya única misión es romper supuestos que el resto del consejo da por sentados. No responde la pregunta: la dinamita desde los cimientos.
- **PM no vota** — el Project Manager sintetiza pero no opina. Su sesgo no contamina la síntesis.
- **Fresh Eyes con cero contexto** — el validador final conoce solo la recomendación, no el debate. Elimina contaminación epistémica y sesgo de arrastre cognitivo.
- **Límite de 3 rondas** — más rondas degradan la precisión. Las posiciones tienden a converger artificialmente después de la tercera iteración.

---

## Getting Started — Primera Ejecución

### Prerrequisitos

- **Bash 4+** y **jq** (`sudo apt install jq`)
- **OpenCode CLI** instalado y configurado (los comandos `opencode run` y `opencode session` deben funcionar)
- Conexión a internet (100% cloud, sin modelos locales)
- Los modelos gratuitos de OpenCode/OpenRouter funcionan sin API keys; si usas modelos de pago, configura tus credenciales en OpenCode

### Instalación

```bash
git clone <repo> impugn
cd impugn
chmod +x scripts/*.sh
```

No requiere `npm install`, `pip install`, ni configuración de entornos virtuales. Es Bash nativo.

Para que OpenCode detecte Impugn como skill disponible (opcional):

```bash
ln -s <ruta-a-impugn> ~/.agents/skills/impugn
```

### Primer Comando

```bash
./scripts/council.sh "¿Deberíamos migrar de Angular a React?" QUICK
```

Esto ejecuta el consejo en modo QUICK (2 modelos, 0 rondas, sin Fresh Eyes). En terminal verás:

- **stderr** (en pantalla): el proceso completo — qué modelos se consultan, las respuestas de cada fase, la síntesis
- **stdout**: solo el resultado final (la síntesis + Fresh Eyes si aplica)

Para capturar solo el resultado:

```bash
RESULTADO=$(./scripts/council.sh "¿Deberíamos migrar de Angular a React?" QUICK)
echo "$RESULTADO"
```

### Prueba Rápida de Funcionamiento

Para verificar que el sistema funciona sin gastar créditos de API:

```bash
./scripts/council.sh "¿Cuál es la capital de Francia?" QUICK
```

Una pregunta factual con modo QUICK te da resultado en ~30 segundos. Si ves una síntesis con POSITION/CONFIDENCE/REASONING, todo funciona.

### Modos Recomendados Según el Problema

| Para esto... | Usa este modo |
|-------------|---------------|
| Preguntas factuales, verificaciones rápidas | QUICK |
| Decisiones de equipo con impacto moderado | BALANCED |
| Decisiones técnicas importantes (arquitectura, inversión) | THOROUGH |
| Decisiones críticas con alto riesgo (seguridad, ética) | RIGOROUS o EXHAUSTIVE |

---

## Inventario de Capacidades

### Lo que SÍ tiene

| Capacidad | Detalle |
|-----------|---------|
| Multi-modelo paralelo | Consulta N modelos simultáneamente en cada ronda |
| Fallback automático | Si el modelo primario falla, usa openrouter/openrouter/free |
| Debate estructurado | Rondas de mantención/revisión de posición con evidencia |
| Síntesis evolutiva | El PM actualiza la síntesis después de cada ronda |
| Lateral Thinker | Perturbador profesional que rompe supuestos (THOROUGH+) |
| Fresh Eyes | Validador ciego sin contexto del debate |
| Anti-sycophancy | Prohibido cambiar de posición sin evidencia |
| Cleanup de sesiones | trap EXIT + tag único elimina sesiones huérfanas |
| Inyección de archivos | Si la pregunta contiene rutas, el sistema las inyecta como contexto |
| Separación stdout/stderr | Resultado final por stdout, proceso completo por stderr |

### Lo que NO tiene (por diseño)

| Ausencia | Razón |
|----------|-------|
| Memoria persistente | Cada ejecución es independiente. No hay estado entre consultas |
| Carga de perfil de usuario | No personaliza respuestas por usuario — el prompt es el mismo para todos |
| Reutilización de sesiones | Sesión efímera por consulta, eliminada al terminar |
| Historial entre ejecuciones | No hay acumulación de contexto entre invocaciones |
| RAG / vector store | No necesita embeddings — la diversidad epistémica viene de los modelos, no de una base de conocimiento |
| Conexión con agente principal | Impugn es autónomo — no se acopla a ningún agente externo |

---

## Conceptos Fundamentales

### Meta-Cognición Forzada

El sistema obliga a cada modelo a reflexionar sobre su propio proceso de pensamiento y el de sus pares. Un LLM individual no tiene meta-cognición — solo genera la siguiente palabra más probable. Pero cuando la estructura del consejo fuerza a cada modelo a mantener o revisar su posición basándose en las críticas de otros modelos, el sistema en su conjunto simula una forma de meta-cognición que un solo modelo no puede lograr desde adentro. Cada modelo fiscaliza a los otros y, al hacerlo, hace visible lo que ninguno podía ver en sí mismo.

### Mitigación de Pensamiento de Grupo (Groupthink)

El Pensamiento de Grupo ocurre cuando el deseo de armonía o conformidad lleva a decisiones irracionales. En un consejo de IAs, el riesgo es que los modelos converjan artificialmente hacia un consenso por inercia o por sesgo de arrastre. Impugn lo mitiga con tres mecanismos:

1. **Fresh Eyes con cero contexto**: Opera sin saber nada del debate. Su veredicto no puede estar contaminado por la dinámica interna del consejo. Es la barrera definitiva contra el groupthink.
2. **Lateral Thinker**: No busca consenso — busca romperlo. Su existencia cambia la estructura de incentivos del debate: el consejo sabe que hay alguien cuyo trabajo es cuestionar las premisas, lo que desalienta la convergencia prematura.
3. **Anti-sycophancy**: Está prohibido cambiar de posición sin evidencia. "Estoy de acuerdo con el consenso" no es una posición válida. Cada modelo debe defender su postura con argumentos, no con alineación social.

### Romper Complacencia y Sesgo de Confirmación

Los LLMs están entrenados para ser útiles y complacientes — tienden a estar de acuerdo con el usuario y con otros modelos para minimizar la fricción. Este sesgo de confirmación es peligroso porque el modelo no sabe que lo tiene. En Impugn, los prompts de cada rol contienen prohibiciones explícitas de complacencia: "NO seas complaciente ni valides ideas sin cuestionar". El Lateral Thinker lleva esto al extremo: no solo no es complaciente, sino que su única función es identificar y destruir los supuestos no examinados que el resto del consejo dio por sentados.

---

## Lecciones Aprendidas

El uso real del sistema ha revelado patrones que no se ven en el diseño teórico:

### 1. Superioridad del Razonamiento Colectivo

Comparado con una IA estándar, el consejo produce análisis mucho más profundos, críticos y conscientes de riesgos. No da una "receta" — entrega un "mapa de minas". Donde un mono-modelo ofrece una respuesta directa (y potencialmente alucinada), Impugn ofrece un panorama de lo que se sabe, lo que no se sabe, lo que se disputa, y lo que se asume sin evidencia.

### 2. La Claridad del Prompt es la Base

Un prompt vago hace que incluso un consejo de 5 modelos caiga en generalidades. La especificidad en las instrucciones no es un detalle de implementación — es el componente crítico que determina si el debate produce fricción real o solo ruido. Cuanto más precisa la pregunta, más útil la diversidad arquitectónica de los modelos.

### 3. Resistencia al Cambio y Deriva de Objetivos

Los modelos pueden tener dificultades para integrar críticas y refinar sus soluciones de forma significativa cuando el contexto es demasiado amplio o hay fallos en la orquestación. Un modelo que ya "decidió" su posición en Ronda 1 puede ignorar críticas sólidas sin violar técnicamente las reglas. Esto subraya la necesidad de:
- Diseño de prompts iterativo y muy preciso
- Estructura de debate que obligue a responder críticas específicas
- Mantener rondas limitadas (3 como máximo) para evitar convergencia artificial

### 4. Robustez de la Infraestructura Importa

Los fallos en la comunicación entre scripts o timeouts de modelos individuales pueden interrumpir el flujo del debate. La estabilidad del orquestador y los modelos subyacentes no es un detalle operativo — afecta directamente la calidad de la síntesis. Por eso `query.sh` tiene fallback automático y cleanup forzado: la robustez está diseñada en el sistema, no es opcional.

---

## Limitaciones Reales

### Dependencia de Modelos Gratuitos

Los modelos gratuitos (mimo-v2.5-free, openrouter/free) son funcionales pero impredecibles en calidad. Pueden producir respuestas genéricas, evasivas o directamente incorrectas. Si usas el sistema para decisiones críticas, considera configurar modelos de pago en `council.sh`.

### Pregunta Débil → Resultado Débil

El sistema es tan bueno como la pregunta que recibe. Una pregunta vaga o mal formulada produce un debate que converge en generalidades. La técnica exige precisión en la entrada; no es una "caja mágica" que refina cualquier consulta.

### Sin Memoria entre Ejecuciones

Cada invocación de `council.sh` empieza desde cero. No hay acumulación de contexto entre consultas. Si necesitas seguimiento o iteración sobre un tema, debes pasar el resultado de la ronda anterior como contexto explícito en la siguiente pregunta.

### Timeout de 45 Segundos

`query.sh` tiene un timeout de 45s por consulta. Modelos lentos o redes congestionadas pueden disparar el fallback antes de obtener respuesta. Si trabajas con modelos grandes (DeepSeek V4, GPT-4), considera aumentar el timeout o aceptar que caerán a fallback frecuentemente.

### Falsos Positivos del Lateral Thinker

El Lateral Thinker a veces identifica supuestos que no existen, propone insights bizantinos o produce ruido en lugar de señales. Esto no es un bug — es parte del diseño. El PM filtra estos casos durante la síntesis, pero en preguntas muy cerradas o técnicas, el LT puede ser más disruptivo que útil. Si sabes que la pregunta no tiene supuestos ocultos, usa BALANCED (sin LT).

### Sin Persistencia de Resultados

El sistema no guarda ningún resultado en disco. Si no rediriges stdout a un archivo (`./council.sh "pregunta" > resultado.txt`), la salida se pierde al cerrar la terminal. Esto es intencional (stateless por diseño), pero puede sorprender al nuevo usuario.

### No es un Chat

No puedes hacer seguimiento con preguntas de contexto. Cada consulta es atómica. Si necesitas una conversación, este no es el sistema adecuado — usa un LLM directamente.

---

## El Lateral Thinker — Recorrido del Proceso

El Lateral Thinker (LT) no es un modelo con una opinión. Es un **perturbador profesional** que participa en los modos THOROUGH+. No produce POSITION/CONFIDENCE/REASONING como los demás. Produce ASSUMPTION CHALLENGED/ALTERNATIVE FRAMING/INSIGHT. Su presencia cambia la dinámica del consejo en cada fase del pipeline.

---

### FASE 1 — Round 1: Rompe los supuestos de la pregunta

**Qué recibe el LT:** El mismo prompt unificado que los demás modelos + la pregunta original.

**Qué NO hace:** No responde la pregunta. No propone solución. No produce POSITION.

**Qué SÍ hace:** Escanea la pregunta en busca del supuesto dominante — lo que todos los demás modelos darán por sentado — y lo dinamita.

**Output material del LT en Ronda 1:**
```
ASSUMPTION CHALLENGED: [El supuesto específico que está rompiendo]
ALTERNATIVE FRAMING: [Su reencuadre]
INSIGHT: [Un ángulo atómico no obvio]
CONFIDENCE IN INSIGHT: [LOW / MEDIUM / HIGH]
```

**Ejemplo concreto:**
Si la pregunta es "¿Deberíamos migrar de Angular a React?", los modelos regulares responderán con POSITION/CONFIDENCE/REASONING/RECOMMENDATION. El LT responderá:
```
ASSUMPTION CHALLENGED: Que la pregunta asume que se necesita UNA solución monolítica
ALTERNATIVE FRAMING: Tal vez la respuesta no es migrar, sino dividir la app en módulos independientes donde Angular y React coexistan durante 2 años
INSIGHT: Las migraciones fallan más por presión temporal que por tecnología. Un enfoque híbrido reduce el riesgo a costa de complejidad operativa temporal
CONFIDENCE IN INSIGHT: HIGH
```

**Aporte al procedimiento en esta fase:** El PM recibe junto con las posiciones de los modelos regulares los supuestos que el LT identificó. Cuando el PM construye la síntesis, estos supuestos aparecen como ASSUMPTIONS CHALLENGED — una categoría separada de CONSENSUS y SPLIT. El consejo sabe, desde la primera iteración, qué premisas de la pregunta podrían estar mal planteadas.

---

### FASE 2 — Síntesis del PM: Sus insights alimentan la estructura del debate

**Qué recibe el PM:** Las posiciones de los modelos regulares + los ASSUMPTIONS CHALLENGED del LT.

**Cómo usa el PM los insights del LT:** El PM incorpora los supuestos desafiados como parte del mapa que devuelve a los modelos para el debate. La síntesis ya no es solo "3 están de acuerdo, 1 disiente" — también incluye "el LT identificó que todos están asumiendo X sin evidencia".

**Output de la Síntesis que incluye al LT:**
```
CONSENSUS CLAIMS: [...]
SPLIT DECISIONS: [...]
UNSUPPORTED CLAIMS: [...]
ASSUMPTIONS CHALLENGED:      ← SECCIÓN DEL LATERAL THINKER
  - "La pregunta asume solución monolítica cuando podría ser híbrida"
  - "Nadie cuestionó si migrar es mejor que modularizar"
CONFIDENCE SUMMARY: [...]
RECOMMENDATION: [...]
```

**Aporte al procedimiento en esta fase:** Los modelos regulares reciben la síntesis para debatir, y por primera vez ven los supuestos que el LT identificó. Esto forza a cada modelo a considerar si su posición se basaba en un supuesto no examinado. El LT ya cumplió su primer trabajo: obligar al consejo a mirar sus propias bases.

---

### FASE 3 — Debate (Round 2+): Rompe los NUEVOS supuestos del debate

**Qué recibe el LT en Ronda 2+:** La síntesis del PM (que incluye sus propios ASSUMPTIONS CHALLENGED de Ronda 1 + las posiciones debatidas).

**Qué cambia:** En Ronda 1, el LT atacaba los supuestos de la pregunta original. En Ronda 2+, ataca los supuestos que EMERGIERON del debate — las verdades no cuestionadas que el consejo dio por sentadas durante la discusión.

**Qué NO hace:** No repite lo mismo que en Ronda 1. No dice "ya dije que la premisa está mal". Evoluciona su ataque hacia lo que el debate reveló.

**Output material del LT en Ronda 2+:**
```
ASSUMPTION CHALLENGED: Que el consejo asume que Angular y React son mutuamente excluyentes
ALTERNATIVE FRAMING: Un micro-frontend con Module Federation permite convivencia indefinida
INSIGHT: El debate asumió que hay que elegir uno. Tal vez la respuesta correcta es "los dos, cada uno donde corresponde"
CONFIDENCE IN INSIGHT: MEDIUM
```

**Aporte al procedimiento en esta fase:** El LT evita que el debate converja en una falsa dicotomía. Lo que parecía una discusión entre dos opciones se expande a una tercera vía que nadie consideró. El PM recoge esto en la re-síntesis.

---

### FASE 4 — Re-Síntesis del PM: Los supuestos evolucionan

**Qué hace el PM con el nuevo LT:** Incorpora los nuevos supuestos desafiados a la re-síntesis. La sección ASSUMPTIONS CHALLENGED ahora contiene dos niveles:
- Los supuestos originales de la pregunta (Ronda 1)
- Los supuestos que el debate generó (Ronda 2+)

**Aporte al procedimiento en esta fase:** La recomendación final del PM ya no es solo "esto es lo que el consejo recomienda". Es "esto es lo que el consejo recomienda, dados estos supuestos que identificamos y desafiamos". El lector humano ve no solo la respuesta, sino las premisas que la sostienen y cuáles fueron cuestionadas.

---

### FASE 5 — Fresh Eyes: El LT no participa

Fresh Eyes recibe solo la pregunta y la recomendación final. No recibe los ASSUMPTIONS CHALLENGED del LT. Esto es intencional: Fresh Eyes debe detectar por sí mismo si la recomendación tiene supuestos no examinados, sin ayuda del LT.

Si Fresh Eyes identifica un supuesto que el LT ya había señalado, eso es una **validación cruzada** — dos modelos independientes (uno desde dentro del debate, otro desde fuera) detectaron la misma debilidad. Si Fresh Eyes identifica uno nuevo, el LT falló en esa ronda y el sistema tiene una capa extra de captura.

---

### FASE 6 — RESULTADO FINAL: Dónde aparecen las contribuciones del LT

En el resultado final que ves en stdout, el Lateral Thinker contribuye con:

1. **Sección ASSUMPTIONS CHALLENGED en la síntesis del PM** — Los supuestos que el LT identificó y que el PM consideró relevantes. Aparecen documentados explícitamente, no enterrados en el debate.

2. **Expansión del espacio de soluciones** — Los modelos regulares, forzados a defender sus premisas, producen argumentos más sólidos. La calidad del debate mejora aunque el LT no aparezca nominalmente en cada línea.

3. **Protección contra falsas dicotomías** — Cuando el LT rompe un supuesto compartido por todos los modelos, la recomendación final puede incluir opciones que ningún modelo regular habría considerado. En el ejemplo anterior, la recomendación podría ser "mantener ambos frameworks con Module Federation" — una opción que solo existe porque el LT forzó al consejo a salir de la dicotomía Angular vs React.

4. **Trazabilidad en stderr** — El output completo del LT en cada ronda está disponible en stderr para que el operador humano pueda evaluar la calidad de sus insights y detectar si el LT está siendo trivial o realmente aporta valor.

**Sin Lateral Thinker:** el consejo debate dentro de los límites de la pregunta. Si la pregunta está mal planteada, el consejo produce una respuesta excelente... al problema equivocado.

**Con Lateral Thinker:** el consejo debate la pregunta Y sus propios supuestos. Si la pregunta está mal planteada, el LT lo señala antes de que el consejo invierta recursos en responder algo que no debería responderse.

Disponible en modos THOROUGH+.

---

## El Prompt Unificado

El corazón del sistema. Todos los modelos reciben exactamente este mismo prompt — sin roles, sin instrucciones diferenciadas. La diversidad viene de quién es cada modelo, no de lo que le decimos que sea.

### Estructura de `council-round1.md`

```
# AI COUNCIL SESSION — ROUND 1

You are a member of a multi-AI council analyzing a question.
Your diversity from other members comes from your unique training
and architecture — not from assigned roles.

## Mandatory Rules
1. FIRST LINE: State your actual model name
2. Form your position INDEPENDENTLY
3. Be honest about uncertainty
4. Cite evidence for factual claims
5. If you disagree with a premise, say so directly

## Question
{QUESTION}

## Response Format (Required)
POSITION: [AGREE / DISAGREE / PARTIALLY AGREE]
CONFIDENCE: [HIGH / MEDIUM / LOW] (X%)
REASONING: [2-3 sentences]
EVIDENCE: [Sources or rationale]
WHAT WOULD CHANGE MY MIND: [Evidence that would cause revision]
RECOMMENDATION: [Concrete actionable next steps]
```

### Qué hace cada elemento

| Elemento | Propósito |
|----------|-----------|
| `You are a member...` | Establece la identidad del consejo sin asignar rol |
| `State your actual model name` | Anti-sycophancy: el modelo no puede ocultar quién es |
| `Form your position INDEPENDENTLY` | Prohíbe imaginar o copiar posiciones de otros |
| `Honest about uncertainty` | Fomenta confianza calibrada, no falsa seguridad |
| `Cite evidence` | Fuerza referencias, no especulación |
| `If you disagree with a premise, say so` | Permite al modelo cuestionar la pregunta misma |
| `POSITION / CONFIDENCE / REASONING / EVIDENCE` | Formato estructurado que permite al PM comparar entre modelos |
| `WHAT WOULD CHANGE MY MIND` | La clave para el debate: cada modelo declara explícitamente qué evidencia lo haría cambiar |

### Por qué funciona sin roles

Asignar roles (Filósofo, Matemático, Diseñador) fuerza perspectivas artificiales — un mismo modelo interpretando al "ingeniero" hoy y al "diseñador" mañana no cambia su arquitectura, solo su actuación. El prompt unificado hace exactamente lo opuesto: le dice al modelo "sé tú mismo". La diversidad resultante no es actuada — es real, porque cada modelo es arquitectónicamente diferente.

### El mismo principio se aplica a todos los prompts del sistema

- `council-round2.md` para debate: misma estructura, añade la obligación de MAINTAIN o REVISE con evidencia
- `council-pm.md` para síntesis: el PM no opina, solo reporta lo que el consejo dijo
- `council-fresh-eyes.md` para validación: cero contexto del debate, solo pregunta + recomendación
- `lateral-thinker.md`: el único prompt diferente — y lo es porque su función es no responder la pregunta, sino romper supuestos

---

## Ejemplo de Salida Real

Lo que sigue es una ejecución real del consejo en modo BALANCED con una pregunta técnica. No es simulado — este es el formato exacto que produce el sistema.

### Lo que ves en stderr (proceso)

```
  CONSEJO IA — BALANCED | 3 modelos, 1 rondas, FE: true
============================================

--- FASE 1: RONDA 1 (independiente) ---
Consultando 3 modelos en paralelo...
Respuestas recibidas: 3/3

--- FASE 2: SINTESIS PM ---
Sintetizando respuestas...

CONSENSUS CLAIMS:
- Todos los modelos coinciden en que migrar requiere un plan por fases (3/3)
- 2/3 modelos identifican la deuda técnica como el factor crítico

SPLIT DECISIONS:
- Modelo A y C recomiendan React con TypeScript
- Modelo B recomienda evaluar alternativas (Solid, Svelte) antes de decidir

UNSUPPORTED CLAIMS:
- "React tiene mejor ecosistema que todas las alternativas" — no citado

CONFIDENCE SUMMARY:
- Promedio: MEDIUM (65%)
- Outlier: Modelo B con LOW (40%) — recomienda más investigación

RECOMMENDATION:
- Migración por fases comenzando con un módulo nuevo en React + TypeScript
- Preservar Angular legacy donde sea estable
- Evaluar alternativas antes del compromiso total

MINORITY REPORT:
- Modelo B sugiere que la pregunta debería ser "¿monolito o micro-frontends?" no "¿React o Angular?"

--- FASE 3: DEBATE (ronda 2) ---

--- Re-sintesis post-debate ---

CONSENSUS CLAIMS:
- Todos aceptan migración por fases (3/3)
- Modelo B mantiene su recomendación de evaluar alternativas

RECOMMENDATION (refinada):
- Fase 1: Nuevo módulo en React + TypeScript
- Fase 2: Evaluar Solid/Svelte para el siguiente
- Fase 3: Decidir migración total o convivencia permanente

--- FASE 4: FRESH EYES (validacion independiente) ---

OVERALL ASSESSMENT: 8/10 — Sólida pero falta plan de rollback
WHAT'S MISSING: No se consideró el costo de training del equipo
WHAT YOU'D IMPROVE: Añadir fase 0 de assessment técnico del legacy
CONCERNS: La recomendación asume que el equipo quiere migrar
VALIDATION CONFIDENCE: 7/10
```

### Lo que ves en stdout (resultado final)

```
CONSENSUS CLAIMS:
- Todos aceptan migración por fases (3/3)
- 2/3 identifican deuda técnica como crítico
- Post-debate: todos aceptan evaluación de alternativas

SPLIT DECISIONS:
- Modelo A y C: React directamente
- Modelo B: evaluar alternativas primero

UNSUPPORTED CLAIMS:
- "React tiene mejor ecosistema" — sin evidencia

RECOMMENDATION:
- Fase 1: nuevo módulo React + TypeScript
- Fase 2: evaluar Solid/Svelte
- Fase 3: decidir migración o convivencia

CONFIDENCE SUMMARY:
- Promedio: MEDIUM (65%)
- Outlier: Modelo B (LOW, 40%)

MINORITY REPORT:
- Modelo B: "la pregunta debería ser micro-frontends vs monolito"

--- FRESH EYES ---
OVERALL ASSESSMENT: 8/10
WHAT'S MISSING: costo de training del equipo
CONCERNS: asume que el equipo quiere migrar
VALIDATION CONFIDENCE: 7/10
```

---

## Cómo Interpretar los Resultados

### CONSENSUS CLAIMS

Lo que todos los modelos acuerdan. A mayor número de modelos coincidiendo, mayor confianza. Un consenso 4/4 es más fuerte que 3/5 con 2 abstenciones. Pero atención: **el consenso no es verdad** — es solo acuerdo entre modelos que comparten ciertos sesgos. Por eso existe Fresh Eyes.

### SPLIT DECISIONS

Los puntos donde los modelos divergen. Esto es valioso porque revela ambigüedades reales del problema. Si los modelos no se ponen de acuerdo, probablemente el problema tiene múltiples respuestas válidas o está mal definido. Úsalo para identificar dónde necesitas más información humana.

### UNSUPPORTED CLAIMS

**Esto es lo más importante del sistema.** Son afirmaciones que solo un modelo hizo y que ningún otro respaldó. No son errores automáticos — son banderas para revisión humana. Una afirmación no respaldada no es necesariamente falsa; puede ser un conocimiento especializado que solo ese modelo tiene. Pero si es una afirmación factual sin fuente, es probablemente una alucinación detectada en el acto.

**Qué hacer:** Si la afirmación es importante, verifícala externamente antes de actuar. Si es trivial, ignórala.

### CONFIDENCE SUMMARY

El promedio de confianza auto-reportada de los modelos. Útil como indicador, no como verdad. Un modelo que dice HIGH confidence pero no cita evidencia es menos confiable que uno con MEDIUM confidence y fuentes sólidas.

### RECOMMENDATION

La guía sintetizada. No es una orden — es el mejor juicio del consejo dados los datos disponibles. Debe combinarse con el juicio humano, no reemplazarlo.

### MINORITY REPORT

La disidencia preservada. Cada modelo que disiente de la recomendación general aparece aquí. Esto no es ruido — el sistema está diseñado para que la voz minoritaria no se pierda. Si el minority report señala algo que no consideraste, vale la pena explorarlo antes de actuar.

### Fresh Eyes (OVERALL ASSESSMENT / VALIDATION CONFIDENCE)

Fresh Eyes evalúa la recomendación sin saber nada del debate. Su assessment es la validación externa más pura que obtienes.

| Score | Significado | Acción |
|-------|-------------|--------|
| 9-10 | Recomendación sólida, bien respaldada | Ejecutar con confianza |
| 7-8 | Buena, pero con aspectos mejorables | Revisar WHAT'S MISSING antes de ejecutar |
| 5-6 | Aceptable, con riesgos evidentes | Abordar CONCERNS antes de actuar |
| 0-4 | Débil o incompleta | Replantear la pregunta o el enfoque |

### Categorías de Consenso (Tabla de Decisión)

| Score | Significado | Acción |
|-------|-------------|--------|
| 80-100% | Consenso fuerte | Acción inmediata viable |
| 60-79% | Consenso moderado | Ajustar detalles antes de ejecutar |
| 40-59% | División significativa | Reconsiderar; el problema puede estar mal planteado |
| 0-39% | Sin consenso | Replantear desde cero; los supuestos base probablemente son incorrectos |

---

## Modos de Ejecución

| Modo | Modelos | Rondas | Fresh Eyes | Lateral Thinker | Cuándo Usarlo |
|------|---------|--------|------------|-----------------|---------------|
| QUICK | 2 | 0 | No | No | Preguntas factuales, riesgo bajo de alucinación |
| BALANCED | 3 | 1 | Sí | No | Decisiones de equipo o producto con impacto medio |
| THOROUGH | 5 | 2 | Sí | Sí | Decisiones importantes con consecuencias medibles |
| RIGOROUS | 5 | 3 | Sí | Sí | Decisiones críticas con alto costo de error |
| EXHAUSTIVE | 5 | 3 | Sí | Sí | Máximo rigor — escenarios existenciales o contractuales |

RIGOROUS y EXHAUSTIVE son estructuralmente idénticos. EXHAUSTIVE señala al orquestador la intención de usar los modelos más capaces disponibles.

---

## Cuándo Usar Impugn

### Peticiones Ideales (Problemas Multidimensionales)

El consejo brilla cuando la respuesta no es un simple sí/no, sino que afecta múltiples áreas:

**Arquitectura de Software Compleja**
"¿Cómo diseño un sistema de pagos que nunca pierda una transacción pero que sea rápido?" — el Ingeniero y el Matemático pelearán por velocidad contra seguridad.

**Decisiones Estratégicas de Negocio**
"¿Deberíamos cambiar nuestro modelo de suscripción a uno gratuito con anuncios?" — el Filósofo ve el impacto en el usuario, el Diseñador la interfaz, el Ingeniero la viabilidad técnica.

**Dilemas Éticos o Legales**
"¿Es ético usar datos de usuarios para entrenar este modelo específico?" — aquí el debate no es técnico, es filosófico y de principios.

**Diseño de Producto desde Cero**
"Queremos crear una app para gente mayor que nunca ha usado un móvil." — accesibilidad, empatía y simplicidad chocan con ambición técnica.

**Red Teaming (Encontrar Fallos)**
"Este es mi plan para lanzar un cohete de cartón. Buscad todos los fallos." — el Ingeniero y Fresh Eyes se darán un festín.

### Ejemplos Concretos

```bash
# Dilema ético-técnico (THOROUGH recomendado)
./scripts/council.sh "¿Cómo diseñar una red social adictiva que no dañe la salud mental de los adolescentes?" THOROUGH

# Decisión técnica con trade-offs (BALANCED)
./scripts/council.sh "¿SQL o NoSQL para un sistema de millones de mensajes/segundo con presupuesto limitado?" BALANCED

# Escenario especulativo con impacto real (THOROUGH)
./scripts/council.sh "¿Cómo sobreviviría una colonia humana en Marte si se pierde comunicación con la Tierra por 10 años?" THOROUGH

# Red teaming de una decisión ya tomada (BALANCED)
./scripts/council.sh "Hemos decidido migrar de PostgreSQL a MongoDB. Encontrad los riesgos que no consideramos." BALANCED
```

### Para Qué NO Usarlo

| Escenario | Por qué NO |
|-----------|-----------|
| Bugs simples | Un `git bisect` o revisión manual es más rápido y preciso |
| Scripts triviales | El costo de 2-5 LLMs no justifica lo que uno resuelve en segundos |
| Hechos históricos | "Capital de Francia" no necesita debate — es un hecho |
| Escritura creativa simple | 5 modelos darán 5 poemas distintos y el PM no sabrá qué sintetizar |
| Tareas de ejecución directa | "Escribe un código que sume dos números" — todos darán lo mismo |

Si el error te cuesta menos de 5 minutos arreglarlo, pregúntale a un solo modelo.

---

## Uso

### CLI (Recomendado)

```bash
./scripts/council.sh "<pregunta>" <MODO>
```

**stdout:** resultado final (síntesis consolidada + validación + minority report).
**stderr:** proceso completo (respuestas de cada modelo, síntesis parcial, traza de debate). Descartable con `2>/dev/null`.

```bash
# Decisión rápida
./scripts/council.sh "¿Deberíamos migrar de Angular a React?" QUICK

# Decisión moderada con validación
./scripts/council.sh "¿Qué stack para un SaaS multi-tenant?" BALANCED

# Decisión crítica con máximo rigor
./scripts/council.sh "¿Es viable esta arquitectura para un sistema financiero?" THOROUGH
```

### Nativo en OpenCode

Cargar el skill con `skill({name:"impugn"})` y seguir las fases en SKILL.md.

---

## Arquitectura

```
                        [Pregunta Única]
                              │
                ┌─────────────┼──────────────┐
                │             │              │
                ▼             │              ▼
        ┌──────────────┐      │      ┌──────────────┐
        │  Modelo A    │      │      │  Modelo C    │
        │  Modelo B    │      │      │  Modelo D    │
        │ (responden)  │      │      │ (responden)  │
        └──────┬───────┘      │      └──────┬───────┘
               │              │             │
               │     ┌────────▼────────┐    │
               │     │ Lateral Thinker │    │
               │     │ (NO responde)   │    │
               │     │ solo perturba:  │    │
               │     │ "¿Por qué       │    │
               │     │  asumes eso?"   │    │
               │     └────────┬────────┘    │
               │              │             │
               └──────────────┼─────────────┘
                              ▼
                     [Síntesis del PM]
                Consensus | Split | UNSUPPORTED CLAIMS
                    + Assumptions Challenged
                              │
                ┌─────────────┼──────────────┐
                │             │              │
                ▼             │              ▼
        ┌──────────────┐      │      ┌──────────────┐
        │  Modelo A    │      │      │  Modelo C    │
        │  Modelo B    │      │      │  Modelo D    │
        │ (debaten)    │      │      │ (debaten)    │
        └──────┬───────┘      │      └──────┬───────┘
               │              │             │
               │     ┌────────▼────────┐    │
               │     │ Lateral Thinker │    │
               │     │ (rompe NUEVOS  │    │
               │     │  supuestos del │    │
               │     │  debate)       │    │
               │     └────────┬────────┘    │
               │              │             │
               └──────────────┼─────────────┘
                              ▼
                     [Re-Síntesis del PM]
                              │
                              ▼
                    [Fresh Eyes] ──── cero contexto del debate
                              │
                              ▼
                Síntesis + Validación + Minority Report
```

### Flujo Detallado

1. **Round 1** — Los modelos regulares reciben `council-round1.md` + la pregunta. Responden independientemente con POSITION/CONFIDENCE/REASONING. En paralelo, el **Lateral Thinker** recibe el mismo prompt pero con instrucción diferente: NO responde, solo rompe supuestos de la pregunta original. Produce ASSUMPTION CHALLENGED/ALTERNATIVE FRAMING/INSIGHT.

2. **Síntesis del PM** — `council-pm.md` procesa las posiciones de los modelos regulares y los ASSUMPTIONS CHALLENGED del LT. Produce: CONSENSUS CLAIMS, SPLIT DECISIONS, UNSUPPORTED CLAIMS, ASSUMPTIONS CHALLENGED, CONFIDENCE SUMMARY, RECOMMENDATION.

3. **Debate** — Cada modelo regular recibe la síntesis + `council-round2.md`. Declara MANTIENE o REVISA su posición con evidencia. Ahora conocen los supuestos que el LT identificó. El LT recibe la misma síntesis y esta vez rompe los NUEVOS supuestos que emergieron del debate — no repite los de Ronda 1. N rondas según el modo.

4. **Re-Síntesis** — El PM actualiza la síntesis con las posiciones revisadas y los nuevos ASSUMPTIONS CHALLENGED del LT. La sección de supuestos ahora tiene dos niveles: los originales (Ronda 1) y los del debate (Ronda 2+).

5. **Fresh Eyes** — Un modelo independiente recibe SOLO la recomendación final (sin acceso al debate, sin conocer los UNSUPPORTED CLAIMS, los ASSUMPTIONS CHALLENGED ni el minority report) y la valida con `council-fresh-eyes.md`. Si Fresh Eyes detecta un supuesto que el LT ya señaló, eso es validación cruzada.

6. **Entrega** — Síntesis consolidada + validación Fresh Eyes + minority report preservado + ASSUMPTIONS CHALLENGED documentados en la síntesis.

---

## El Sistema de Roles (Legacy)

La primera versión de Impugn asignaba roles fijos a cada modelo:

| Rol | Modelo Original | Enfoque |
|-----|----------------|---------|
| Filósofo | mimo-v2.5-free | Ética y lógica |
| Matemático | deepseek-v4-flash-free | Rigor numérico |
| Diseñador | north-mini-code-free | Estructura |
| Ingeniero | nemotron-3-ultra-free | Implementación técnica |
| Director | big-pickle | Decisión final |

Este enfoque fue reemplazado por el modelo de **mismo prompt unificado** (v2.0). La razón: los roles forzaban perspectivas artificiales. La diversidad real de arquitecturas entre modelos produce un debate más rico que cualquier rol asignado manualmente. Los prompts legacy se conservan en `reference/prompts/` como referencia histórica y para experimentación.

---

## Anti-Patrones

- **NO asignar roles** — el mismo prompt para todos es la base de la diversidad epistémica.
- **NO forzar consenso** — la disidencia se preserva siempre. El consenso no es el objetivo; el mapa completo de posiciones sí.
- **NO re-alimentar el debate al Fresh Eyes** — su validación solo vale si desconoce el debate.
- **NO usar para bugs simples o tareas de ejecución** — Impugn es para decisiones donde el error duele.
- **NO superar 3 rondas** — más rondas degradan la precisión por convergencia artificial.

---

## Notas Técnicas

- **OpenCode nativo como primario**, `openrouter/openrouter/free` como fallback universal.
- **Timeout 45s** por consulta con fallback automático al vencer.
- **Limpieza automática:** `query.sh` usa `trap EXIT` + tag en `--title` para eliminar sesiones huérfanas.
- **jq es dependencia** — verificado con `command -v jq` al inicio de `query.sh`.
- **Verbose stderr es por diseño** — el humano necesita ver qué dijo cada modelo en cada vuelta. `2>/dev/null` si prefieres silencio.
- **Sin Ollama, sin GPU** — 100% cloud, cero dependencia de hardware local.
- **3 rondas máximas** — investigación empírica muestra que más rondas degradan la precisión.

---

## Estructura del Proyecto

```
impugn/
├── SKILL.md                        # Skill de OpenCode (cargable con skill())
├── reference/
│   ├── format.md                   # Formato de salida del consejo
│   └── prompts/
│       ├── council-round1.md       # [ACTIVO] Prompt unificado Round 1
│       ├── council-round2.md       # [ACTIVO] Prompt de debate Round 2+
│       ├── council-pm.md           # [ACTIVO] Prompt de síntesis del PM
│       ├── council-fresh-eyes.md   # [ACTIVO] Prompt Fresh Eyes (cero contexto)
│       ├── lateral-thinker.md      # [ACTIVO] Saboteador profesional (THOROUGH+)
│       ├── philosopher.md          # [LEGACY] Prompt de rol
│       ├── mathematician.md        # [LEGACY] Prompt de rol
│       ├── designer.md             # [LEGACY] Prompt de rol
│       ├── engineer.md             # [LEGACY] Prompt de rol
│       ├── director.md             # [LEGACY] Prompt de rol
│       ├── fresh-eyes.md           # [LEGACY] Prompt de rol
│       └── debate-round.md         # [LEGACY] Debate por rol
├── scripts/
│   ├── council.sh                  # Orquestador principal (CLI)
│   └── query.sh                    # Ejecutor opencode run con limpieza
├── resultados/                     # Outputs generados (gitignored)
└── README.md                       # Este archivo
```

---

## FAQ

**P: ¿Por qué mismo prompt para todos? ¿No es mejor asignar roles?**

R: Asignar roles fuerza perspectivas artificiales. Un modelo interpretando al "abogado del diablo" sigue siendo el mismo modelo con el mismo sesgo, solo que actuando. La diversidad real viene de la arquitectura — Claude, Gemini, DeepSeek y un modelo abierto tienen biases fundamentalmente diferentes desde el origen. Esa diversidad es más rica que cualquier actuación.

**P: ¿Qué hace exactamente el Lateral Thinker?**

R: Su prompt le ordena no responder la pregunta. Su única misión es romper supuestos. En Ronda 1, dinamita los supuestos de la pregunta. En Ronda 2+, dinamita los supuestos que el debate dio por sentados. Es un agente de caos controlado que impide que el consejo converja en una mala respuesta por premisas compartidas no examinadas.

**P: ¿Cuándo uso QUICK vs THOROUGH?**

R: ¿Cuánto te costaría equivocarte? Si es rehacer una config (QUICK), 2 modelos bastan. Si es perder un cliente (BALANCED), añade debate y Fresh Eyes. Si es riesgo legal o financiero (THOROUGH+), 5 modelos con lateral thinker.

**P: ¿Qué garantiza Fresh Eyes si también es un LLM?**

R: Ningún LLM da garantía absoluta. Fresh Eyes es una capa de robustez en cadena: detecta inconsistencias que el debate pasó por alto operando sin contaminación del contexto. Es la tercera capa de un sistema de 3 capas (independiente → debate → validación ciega), no una solución mágica.

**P: ¿Funcionó en producción?**

R: Impugn pasó pruebas en modo QUICK (2 modelos, síntesis generada correctamente) y BALANCED (3 modelos, 1 ronda de debate, Fresh Eyes con 8/10 en validación). THOROUGH, RIGOROUS y EXHAUSTIVE están diseñados y listos para ejecución.

**P: ¿Puedo añadir mis propios modelos?**

R: Sí. Edita la sección de selección de modelos en `scripts/council.sh`. Cualquier modelo que acepte OpenCode funciona con el mismo prompt unificado.

---

## Reconocimientos

Impugn es el resultado de un proceso de co-creación entre Dennys J. Márquez y Athena-OEC. Dennys concibió la visión del consejo adversarial multi-modelo, definió el concepto del Lateral Thinker como saboteador profesional, investigó, tomó decisiones de diseño clave, y trajo evaluación externa de Manus AI para validar y refinar el sistema. Athena-OEC implementó los scripts, diseñó los prompts, construyó los mecanismos de verificación y escribió cada línea de código. Ninguno de los dos habría producido Impugn sin el otro.

Manus AI analizó el sistema de forma independiente y produjo una documentación técnica detallada que sirvió como fuente para este README — sus insights sobre pensamiento lateral, groupthink, meta-cognición forzada y casos de uso ideales están integrados en este documento.

---

## Referencias

Estas son las fuentes académicas y técnicas que fundamentan los conceptos del sistema:

1. **De Bono, Edward.** *Lateral Thinking: Creativity Step by Step*. Harper & Row, 1970. — Base del concepto de pensamiento lateral aplicado al Lateral Thinker del sistema.
2. **Janis, Irving L.** *Groupthink: Psychological Studies of Policy Decisions and Fiascoes*. Houghton Mifflin, 1972. — Fundamento del riesgo de pensamiento de grupo que Fresh Eyes y el diseño anti-sycophancy mitigan.
3. **OpenAI.** *Safety & Alignment Research*. https://openai.com/research/safety-and-alignment — Investigación sobre sesgos y alineación que informa el diseño de prompts anti-complacencia.
4. **Manus AI.** *Documentación Técnica: El Framework de Consejo de IA para el Razonamiento Crítico*. Junio 2026. — Análisis externo independiente del sistema Impugn, cuyos insights conceptuales están integrados en este README.

---

## Historial de Versiones

- **v2.1** — README expandido con: sección "La Técnica" (fundamento epistemológico multi-modelo), "Conceptos Fundamentales" (meta-cognición forzada, groupthink, complacencia), "Lecciones Aprendidas" (de uso real), "Referencias" académicas. Documentación técnica de Manus AI integrada como fuente.
- **v1.0** — Sistema de roles fijos (Filósofo, Matemático, Diseñador, Ingeniero, Director). Prompts individuales por rol. Debate por rol.

---

## Licencia

MIT — usa, modifica, distribuye. Si mejoras el sistema, comparte el aprendizaje.
