# Statistical Inference in R: Mortar Bond Strength

Does a modified mortar formulation improve tension bond strength? A classic two-sample comparison with 10 specimens per formulation.

| Step | Result |
|---|---|
| Means | normal 17.04 · modified 16.76 kgf/cm² |
| Std. deviation | normal 0.25 · modified 0.32 |
| Bartlett's test (equal variances) | p = 0.48, no evidence the variances differ |
| Welch t-test, two-sided | t = -2.19, p = 0.043, the means differ |
| Welch t-test, one-sided (modified < normal) | p = 0.022 |

**Conclusion:** at α = 0.05 the modified mortar is significantly *weaker*, so the modification should not be adopted.

Script: [`mortar_bond_strength.R`](mortar_bond_strength.R) (base R, no packages needed).
