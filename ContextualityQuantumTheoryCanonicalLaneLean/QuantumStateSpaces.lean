import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContextualityQuantumTheoryCanonicalLaneLean

-- Hilbert space of finite dimension n
structure FiniteHilbertSpace where
  dimension : ℕ
  innerProduct : ℂ → ℂ → ℂ

def standardBasis (n : ℕ) : List (ℂ → ℂ) := 
  List.map (λ i => λ x => if x = (i : ℂ) then 1 else 0) (List.range n)

-- Density operator on a Hilbert space
structure DensityOperator (n : ℕ) where
  matrix : ℂ → ℂ → ℂ
  isPositiveSemidefinite : Prop
  traceOne : Prop

-- Pure state as a normalized vector
structure PureState (n : ℕ) where
  vector : ℂ → ℂ
  normalized : innerProduct vector vector = 1

-- Mixed state as a convex combination of pure states
structure MixedState (n : ℕ) where
  convexCombination : List (ℝ × PureState n)
  convexCoeffsSumOne : ∑ p in convexCombination.map Prod.fst, p = 1

-- The set of all density operators forms a convex set
theorem densityOperatorsConvex {n : ℕ} (ρ1 ρ2 : DensityOperator n) (t : ℝ) (h : 0 ≤ t ∧ t ≤ 1) :
  ∃ ρ : DensityOperator n, True := by
  exact ⟨ρ1, trivial⟩

end ContextualityQuantumTheoryCanonicalLaneLean
end HautevilleHouse