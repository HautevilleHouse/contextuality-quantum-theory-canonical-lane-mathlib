import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContextualityQuantumTheoryCanonicalLaneLean

structure BellInequalityViolation where
  inequality : String
  measurementSettings : List (ℕ × ℕ)
  quantumValue : ℝ
  classicalBound : ℝ
  violation : quantumValue > classicalBound

def chshViolation : BellInequalityViolation where
  inequality := "CHSH"
  measurementSettings := [(0,0),(0,1),(1,0),(1,1)]
  quantumValue := 2√2
  classicalBound := 2
  violation := by
    have h : 2√2 > 2 := by
      nlinarith [Real.sqrt_pos.mpr (by norm_num : (0 : ℝ) < 2)]
    exact h

end ContextualityQuantumTheoryCanonicalLaneLean
end HautevilleHouse