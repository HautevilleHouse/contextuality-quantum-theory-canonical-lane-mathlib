import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContextualityQuantumTheoryCanonicalLaneLean

abbrev Qubit := Fin 2 → ℂ
abbrev Observable := Qubit → ℂ
abbrev Operator := Qubit → Qubit
abbrev Context := List Observable
abbrev MeasurementOutcome := Fin 2 → ℂ

structure QuantumState where
  vector : Qubit
  normalized : ‖vector‖ = 1

structure MeasurementContext where
  observables : Context
  outcomes : MeasurementOutcome → Prop

structure BellState where
  state : QuantumState
  isMaximallyEntangled : Prop
  bellInequalityViolated : Prop

structure ContextualModel where
  state : QuantumState
  contexts : List Context
  assignmentConsistent : Prop
  localHiddenVariables : Prop
  contextualViolation : Prop

end ContextualityQuantumTheoryCanonicalLaneLean
end HautevilleHouse