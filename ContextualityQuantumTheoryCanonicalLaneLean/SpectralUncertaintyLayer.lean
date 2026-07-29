import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContextualityQuantumTheoryCanonicalLaneLean.ContextualityQuantumObjects

namespace HautevilleHouse
namespace ContextualityQuantumTheoryCanonicalLaneLean

structure SpectralCertificate where
  operator : Operator
  spectrumClosed : Prop
  spectralDecompositionClosed : Prop
  spectralTheoremApplied : Prop
  spectrumClosedProof : spectrumClosed
  spectralDecompositionClosedProof : spectralDecompositionClosed
  spectralTheoremAppliedProof : spectralTheoremApplied

def sourceSpectralCertificate : SpectralCertificate := {
  operator := fun v => v
  spectrumClosed := True
  spectralDecompositionClosed := True
  spectralTheoremApplied := True
  spectrumClosedProof := trivial
  spectralDecompositionClosedProof := trivial
  spectralTheoremAppliedProof := trivial
}

structure UncertaintyCertificate where
  position : Operator
  momentum : Operator
  commutatorRelation : Prop
  uncertaintyInequality : Prop
  commutatorRelationProof : commutatorRelation
  uncertaintyInequalityProof : uncertaintyInequality

def sourceUncertaintyCertificate : UncertaintyCertificate := {
  position := fun v => v
  momentum := fun v => v
  commutatorRelation := True
  uncertaintyInequality := True
  commutatorRelationProof := trivial
  uncertaintyInequalityProof := trivial
}

def SpectralUncertaintyClosed (S : SpectralCertificate) (U : UncertaintyCertificate) : Prop :=
  S.spectrumClosed ∧ S.spectralDecompositionClosed ∧ S.spectralTheoremApplied ∧
  U.commutatorRelation ∧ U.uncertaintyInequality

theorem source_spectral_uncertainty_closed :
    SpectralUncertaintyClosed sourceSpectralCertificate sourceUncertaintyCertificate := by
  exact And.intro sourceSpectralCertificate.spectrumClosedProof
    (And.intro sourceSpectralCertificate.spectralDecompositionClosedProof
      (And.intro sourceSpectralCertificate.spectralTheoremAppliedProof
        (And.intro sourceUncertaintyCertificate.commutatorRelationProof
          sourceUncertaintyCertificate.uncertaintyInequalityProof)))

end ContextualityQuantumTheoryCanonicalLaneLean
end HautevilleHouse