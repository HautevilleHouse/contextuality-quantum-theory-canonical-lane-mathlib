import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContextualityQuantumTheoryCanonicalLaneLean

abbrev HilbertSpace := ℕ → ℂ
abbrev Observable := HilbertSpace → ℂ
abbrev QuantumState := HilbertSpace → ℂ

structure QuantumState where
  stateVector : HilbertSpace
  normalized : ‖stateVector‖ = 1

def expectation (O : Observable) (ψ : QuantumState) : ℂ :=
  ∑' i, conj (ψ.stateVector i) * O (ψ.stateVector i)

def commutator (A B : Observable) : Observable := λ ψ => A (B ψ) - B (A ψ)

def zeroObservable : Observable := λ _ => 0

structure ContextualityOperator where
  A : Observable
  B : Observable
  AB : Observable
  compatible : 𝔼[A·B] = 𝔼[B·A]
  contextual : 𝔼[A] * 𝔼[B] ≠ 𝔼[A·B]

def trivialContextualityOperator : ContextualityOperator where
  A := zeroObservable
  B := zeroObservable
  AB := zeroObservable
  compatible := by
    simp [expectation, commutator]
  contextual := by
    simp [expectation]

structure ContextualityOperatorPair where
  X : Observable
  Z : Observable
  commutationRelation : commutator X Z = zeroObservable

def ContextualClosure (C : ContextualityOperatorPair) : Prop :=
  (commutator C.X C.Z = zeroObservable) ∧
  (expectation C.X * expectation C.Z ≠ expectation (C.X * C.Z))

theorem trivial_contextual_closure :
    ContextualClosure trivialContextualityOperator := by
  refine And.intro ?_ (by
    intro h; apply trivialContextualityOperator.contextual; exact h)
  exact rfl

end HautevilleHouse
end ContextualityQuantumTheoryCanonicalLaneLean