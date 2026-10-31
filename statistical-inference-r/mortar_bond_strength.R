# Does a modified mortar formulation improve tension bond strength?
# Two-sample comparison: descriptive statistics, Bartlett's test for equal
# variances, and Welch t-tests (two-sided and one-sided).
#
# Transcribed from the original R Markdown report (2021). Data: 10 specimens
# per formulation, tension bond strength in kgf/cm².

normal   <- c(16.62, 16.75, 17.37, 17.12, 16.98, 16.87, 17.34, 17.02, 17.08, 17.27)
modified <- c(16.85, 16.40, 17.21, 16.35, 16.52, 17.04, 16.96, 17.15, 16.59, 16.57)

data <- data.frame(
  strength = c(normal, modified),
  mortar   = factor(rep(c("normal", "modified"), each = 10), levels = c("normal", "modified"))
)

# ---- Descriptive statistics -------------------------------------------------
aggregate(strength ~ mortar, data, function(x) c(mean = mean(x), var = var(x), sd = sd(x)))

par(mfrow = c(1, 2))
boxplot(strength ~ mortar, data, col = c("lightblue", "hotpink2"),
        main = "Tension bond strength", ylab = "kgf/cm²")
plot(data$strength, col = ifelse(data$mortar == "normal", "steelblue", "deeppink"), pch = 19,
     main = "Observations", xlab = "Specimen", ylab = "kgf/cm²")
abline(v = 10.5, lty = 2)

# ---- Equal variances? -------------------------------------------------------
# H0: the variances are equal. p ≈ 0.48, so there is no evidence they differ.
bartlett.test(strength ~ mortar, data)

# ---- Do the means differ? ---------------------------------------------------
# H0: equal means. p ≈ 0.043 < 0.05, so they differ.
t.test(modified, normal)

# H1: modified mean < normal mean. p ≈ 0.022, so the modified mortar is
# significantly WEAKER: the modification does not improve bond strength.
t.test(modified, normal, alternative = "less")
