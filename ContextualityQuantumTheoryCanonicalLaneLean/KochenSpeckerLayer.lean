import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContextualityQuantumTheoryCanonicalLaneLean

structure KochenSpeckerModel where
  dimension : ℕ
  observables : List (Matrix (Fin dimension) (Fin dimension) ℂ)
  assignments : List (ℕ → ℂ)  -- function assigning values to observables
  contextDependency : Prop

def ksTheorem (dim : ℕ) (h : dim ≥ 3) : KochenSpeckerModel := by
  sorry

end ContextualityQuantumTheoryCanonicalLaneLean
end HautevilleHouse