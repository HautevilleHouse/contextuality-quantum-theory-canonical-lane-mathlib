import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Sheaves.Sheaf

namespace HautevilleHouse
namespace ContextualityQuantumTheoryCanonicalLaneLean

structure ContextualitySheaf where
  measurementContexts : Set (Set ℕ)
  distributions : ∀ (C : Set ℕ) (hC : C ∈ measurementContexts), C → ℝ
  consistency : ∀ C D, C ∈ measurementContexts → D ∈ measurementContexts → 
                (∀ x ∈ C ∩ D, distributions C hC x = distributions D hD x)
  globalSection : Bool

def sheafContextuality (S : ContextualitySheaf) : Prop :=
  ¬ S.globalSection

end ContextualityQuantumTheoryCanonicalLaneLean
end HautevilleHouse