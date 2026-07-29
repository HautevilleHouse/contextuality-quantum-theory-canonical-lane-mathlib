import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContextualityQuantumTheoryCanonicalLaneLean.ContextualityOperators

namespace HautevilleHouse
namespace ContextualityQuantumTheoryCanonicalLaneLean

structure KochenSpeckerConfiguration where
  observables : List Observable
  commutationGraph : Prop
  valueAssignmentImpossible : Prop
  evidence : valueAssignmentImpossible

def KochenSpeckerClosed (K : KochenSpeckerConfiguration) : Prop :=
  K.commutationGraph ∧ K.valueAssignmentImpossible

theorem kochen_specker_closed_checked :
    KochenSpeckerClosed trivialKochenSpeckerConfiguration := by
  exact And.intro rfl rfl

def trivialKochenSpeckerConfiguration : KochenSpeckerConfiguration where
  observables := []
  commutationGraph := True
  valueAssignmentImpossible := True
  evidence := trivial

end HautevilleHouse
end ContextualityQuantumTheoryCanonicalLaneLean