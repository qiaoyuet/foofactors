context("Detect factor or character")

test_that("detect_fct evaluate factor as TRUE", {
  x <- c("high","high","low")
  x_fact <- factor(x)

  y <- c("1","2","2")
  y_fact <- factor(x)

  expect_identical(detect_fct(x_fact), TRUE)
  expect_identical(detect_fct(y_fact), TRUE)
})


test_that("detect_fct evaluate character as FALSE", {
  x <- c("high","medium","low")
  x_fact <- factor(x)

  y <- c("1","2","3")
  y_fact <- factor(x)

  expect_identical(detect_fct(x_fact), FALSE)
  expect_identical(detect_fct(y_fact), FALSE)
})


test_that("detect_fct handles invalid input", {
  x <- 1
  y <- c("hello")

  expect_error(detect_fct(x))
  expect_error(detect_fct(y))
})
