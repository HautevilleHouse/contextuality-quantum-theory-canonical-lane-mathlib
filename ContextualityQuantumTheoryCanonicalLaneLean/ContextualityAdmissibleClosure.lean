import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContextualityQuantumTheoryCanonicalLaneLean.BellKochenSpeckerLayer
import HautevilleHouse.ContextualityQuantumTheoryCanonicalLaneLean.SpectralUncertaintyLayer

namespace HautevilleHouse
namespace ContextualityQuantumTheoryCanonicalLaneLean

def contextualAdmittedObject : AdmittedTheoremObject := {
  object := {
    sourceKey := "contextuality-quantum-theory-canonical-lane",
    theoremObject := "Contextuality Quantum Theory",
    claimBoundary := "Unrestricted classical closure remains outside this carried boundary."
  },
  localWitness := "Contextuality quantum theory with Bell inequality violation, Kochen-Specker contradiction, spectral theorem, and uncertainty principle.",
  bridgeEvidence := "Source-derived Lean certificate fields.",
  sourceKeyChecked := rfl,
  theoremObjectChecked := rfl
}

def contextualAdmissibleClass : AdmissibleClass := {
  object := contextualAdmittedObject,
  endpointSatisfied := BellKochenSpeckerClosed sourceBellInequalityCertificate sourceKochenSpeckerCertificate ∧
                       SpectralUncertaintyClosed sourceSpectralCertificate sourceUncertaintyCertificate,
  remainderRecorded := True,
  gateWitness := Or.inl (by
    exact And.intro source_bell_kochen_specker_closed source_spectral_uncertainty_closed)
}

def ContextualityAdmissibleClosure : Prop :=
  bridgeClosed contextualAdmissibleClass ∧ gateClosed contextualAdmissibleClass

theorem contextuality_admissible_closure :
    ContextualityAdmissibleClosure := by
  exact And.intro (bridge_from_admissible_class contextualAdmissibleClass)
    (gate_from_admissible_class contextualAdmissibleClass)

end ContextualityQuantumTheoryCanonicalLaneLean
end HautevilleHouse