test_that("reorder_desc returns levels of factors in descending alphabetical order", {

  x <- factor(c("a","b","c","d"))
  y <- factor(c("a","b","a","c"))
  z <- factor(c("hello","you","are","so","nice"))
  m <- factor(c("1","2","3","4"))

  tmp1 <- c("d","c","b","a")
  tmp2 <- c("c","b","a")
  tmp3 <- c("you","so","nice","hello","are")
  tmp4 <- c("4","3","2","1")

  x_desc <- reorder_desc(x)
  y_desc <- reorder_desc(y)
  z_desc <- reorder_desc(z)
  m_desc <- reorder_desc(m)

  expect_equal(levels(x_desc),tmp1)
  expect_equal(levels(y_desc),tmp2)
  expect_equal(levels(z_desc),tmp3)
  expect_equal(levels(m_desc),tmp4)
})

test_that("reorder_desc handles invalid input", {
  x <- 1
  y <- c("hello")

  expect_error(reorder_desc(x), "Input value should belong to class factor")
  expect_error(reorder_desc(y), "Input value should belong to class factor")
})
