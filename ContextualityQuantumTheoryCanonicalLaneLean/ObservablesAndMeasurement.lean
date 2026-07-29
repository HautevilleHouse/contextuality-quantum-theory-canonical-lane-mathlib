import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContextualityQuantumTheoryCanonicalLaneLean.QuantumStateSpaces

namespace HautevilleHouse
namespace ContextualityQuantumTheoryCanonicalLaneLean

-- Observable as a Hermitian operator
structure Observable (n : ℕ) where
  operator : ℂ → ℂ → ℂ
  hermitian : ∀ x y, operator x y = conj (operator y x)

-- Projection-valued measure (PVM) for a finite outcome set
structure ProjectionValuedMeasure (n : ℕ) (Ω : Type) [Fintype Ω] where
  projectors : Ω → (ℂ → ℂ → ℂ)
  projectorHermitian : ∀ ω, ∀ x y, projectors ω x y = conj (projectors ω y x)
  projectorIdempotent : ∀ ω, ∀ x, projectors ω (projectors ω x) = projectors ω x
  sumIdentity : ∑ ω, projectors ω = λ x y => if x = y then 1 else 0
  orthogonalProjectors : ∀ ω1 ω2, ω1 ≠ ω2 → ∀ x, projectors ω1 (projectors ω2 x) = 0

-- Positive operator-valued measure (POVM)
structure PositiveOperatorValuedMeasure (n : ℕ) (Ω : Type) [Fintype Ω] where
  effects : Ω → (ℂ → ℂ → ℂ)
  effectPositive : ∀ ω, ∀ v, (effects ω) v v ≥ 0
  sumIdentity : ∑ ω, effects ω = λ x y => if x = y then 1 else 0

-- Born rule: probability of outcome ω given state ρ
noncomputable def bornProbability {n : ℕ} {Ω : Type} [Fintype Ω] (ρ : DensityOperator n) (M : PositiveOperatorValuedMeasure n Ω) (ω : Ω) : ℝ :=
  trace (M.effects ω * ρ.matrix)

-- Context: a set of jointly measurable observables
structure Context (n : ℕ) where
  label : String
  observables : List (Observable n)
  commuting : ∀ A B ∈ observables, A.operator * B.operator = B.operator * A.operator

end ContextualityQuantumTheoryCanonicalLaneLean
end HautevilleHouse