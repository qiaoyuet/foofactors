detect_fct <- function(x) {
  if (is.factor(x)) {
    length(x) != length(unique(x))
  } else {
    stop("Input value should be a factor")
  }
}
