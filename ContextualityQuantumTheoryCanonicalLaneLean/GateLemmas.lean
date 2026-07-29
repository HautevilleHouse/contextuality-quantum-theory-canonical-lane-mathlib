import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContextualityQuantumTheoryCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ContextualityQuantumTheoryCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ContextualityQuantumTheoryCanonicalLaneLean
end HautevilleHouse