import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContextualityQuantumTheoryCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.ContextualityQuantumTheoryCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ContextualityQuantumTheoryCanonicalLaneLean

def ConstrainedContextualityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_contextuality_endgame (A : AdmissibleClass) :
    ConstrainedContextualityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContextualityQuantumTheoryCanonicalLaneLean
end HautevilleHouse