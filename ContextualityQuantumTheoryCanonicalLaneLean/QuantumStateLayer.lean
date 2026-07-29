import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContextualityQuantumTheoryCanonicalLaneLean

structure QuantumState where
  dim : Nat
  vector : Vector ℂ dim
  densityMatrix : Matrix (Fin dim) (Fin dim) ℂ
  traceOne : trace densityMatrix = 1
  positiveSemidefinite : PositiveSemidefinite densityMatrix

def pureState (dim : Nat) : QuantumState where
  dim := dim
  vector := fun i => if i = 0 then 1 else 0
  densityMatrix := fun i j => if i = j ∧ i = 0 then 1 else 0
  traceOne := by
    simp
  positiveSemidefinite := by
    apply PositiveSemidefinite.mk
    intro v
    have : 0 ≤ ‖v 0‖ ^ 2 := by positivity
    have : 0 ≤ ∑ i, ‖(densityMatrix (i := 0) (j := 0))‖ ^ 2 := by
      positivity
    sorry

structure QuantumMeasurement where
  dim : Nat
  effects : List (Matrix (Fin dim) (Fin dim) ℂ)
  completeness : ∑ E in effects, E = 1
  positivity : ∀ E ∈ effects, PositiveSemidefinite E

end ContextualityQuantumTheoryCanonicalLaneLean
end HautevilleHouse