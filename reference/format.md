# Formato de Salida del Consejo

## Estructura del Resultado Final

```
## CONSEJO — [PREGUNTA]

### FASE 1: PERSPECTIVAS INDEPENDIENTES

#### [Modelo A]
POSITION: AGREE / DISAGREE / PARTIALLY AGREE
CONFIDENCE: HIGH / MEDIUM / LOW (X%)
REASONING: <2-3 oraciones>
EVIDENCE: <fuentes o rationale>
WHAT WOULD CHANGE MY MIND: <evidencia especifica>
RECOMMENDATION: <accion concreta>

#### [Modelo B]
[mismo formato]

#### [Modelo C ...]

### FASE 1b: LATERAL THINKER (solo THOROUGH+)

ASSUMPTION CHALLENGED: <supuesto roto>
ALTERNATIVE FRAMING: <reencuadre>
INSIGHT: <ángulo no obvio>
CONFIDENCE IN INSIGHT: LOW / MEDIUM / HIGH

### FASE 2: SINTESIS DEL PM

CONSENSUS CLAIMS:
- <afirmaciones donde todos coinciden>

SPLIT DECISIONS:
- <puntos donde los modelos divergen>

UNSUPPORTED CLAIMS:
- <afirmaciones que solo un modelo respalda>
- <marcadas para revision humana>

CONFIDENCE SUMMARY:
- <nivel de confianza general>

RECOMMENDATION:
- <accion recomendada>

### FASE 3: FRESH EYES (VALIDACION)

OVERALL ASSESSMENT: X/10
WHAT'S MISSING: <consideraciones omitidas>
WHAT YOU'D IMPROVE: <cambios especificos>
CONCERNS: <riesgos, supuestos, gaps>
VALIDATION CONFIDENCE: X/10

### MINORITY REPORT

<disidencia preservada — voces que discrepan de la recomendacion>
```

## Categorias de Consenso

| Score | Significado | Accion |
|-------|------------|--------|
| 80-100% | Consenso fuerte | Accion inmediata viable |
| 60-79% | Consenso moderado | Ajustar detalles antes de ejecutar |
| 40-59% | Division significativa | Reconsiderar; el problema puede estar mal planteado |
| 0-39% | Sin consenso | Replantear desde cero; los supuestos base probablemente son incorrectos |

## Notas

- Los UNSUPPORTED CLAIMS no son errores — son banderas para revision humana
- El Minority Report se preserva incluso si la recomendacion es unanime
- Fresh Eyes evalua SIN conocer el debate — su perspectiva es independiente por diseño
- El Lateral Thinker no produce POSITION/CONFIDENCE/REASONING — solo rompe supuestos
