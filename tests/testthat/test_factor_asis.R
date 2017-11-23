test_that("factor_asis returns levels of factors as appeared in data", {

  a <- factor(c("high","low","low","high","medium"))
  b <- factor(c("1","2","2","4"))

  tmp1 <- c("high","low","medium")
  tmp2 <- c("1","2","4")

  a_asis <- factor_asis(a)
  b_asis <- factor_asis(b)

  expect_equal(levels(a_asis),tmp1)
  expect_equal(levels(b_asis),tmp2)
})

test_that("factor_asis handles invalid input", {
  x <- 1
  y <- c("hello")

  expect_error(factor_asis(x))
  expect_error(factor_asis(y))
})
