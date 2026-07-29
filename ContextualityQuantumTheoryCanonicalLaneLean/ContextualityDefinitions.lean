import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContextualityQuantumTheoryCanonicalLaneLean.QuantumStateSpaces
import HautevilleHouse.ContextualityQuantumTheoryCanonicalLaneLean.ObservablesAndMeasurement

namespace HautevilleHouse
namespace ContextualityQuantumTheoryCanonicalLaneLean

-- Measurement scenario: set of contexts covering all observables
structure MeasurementScenario where
  contexts : List (ℕ)  -- list of dimensions? Placeholder: use ℕ as label
  observablesPerContext : List (List (Observable ℕ))  -- need concrete n

abbrev Outcome := ℕ

-- Behavior: probability distribution over outcomes for each context
structure Behavior (n : ℕ) where
  probabilities : (Context n) → (List Outcome) → ℝ
  nonnegative : ∀ c x, probabilities c x ≥ 0
  sumOne : ∀ c, ∑ x, probabilities c x = 1

-- Noncontextual model: exists a deterministic hidden variable distribution
structure NoncontextualModel (n : ℕ) where
  hiddenVariableSpace : Type
  distribution : hiddenVariableSpace → ℝ
  responseFunction : hiddenVariableSpace → (Observable n) → Outcome
  consistency : ∀ (c : Context n) (λ : hiddenVariableSpace), 
    responseFunction λ respects context c

-- Contextuality witness: a linear inequality violated by quantum behaviors
def contextualityWitness (n : ℕ) : (Behavior n) → ℝ := λ b => 
  ∑ c, ∑ x, b.probabilities c x

-- Admissible definition: a scenario is contextual if no noncontextual model exists
structure ContextualScenario (n : ℕ) where
  scenario : MeasurementScenario
  noNoncontextualModel : ∀ (M : NoncontextualModel n), False

end ContextualityQuantumTheoryCanonicalLaneLean
end HautevilleHouse