#' Sets levels to the order in which they appear in the data
#'
#' Sometimes we want to set levels of a factor to the order which they appear in the data,
#' this function is able to set levels without duplicates.
#'
#' @param x factor
#'
#' @return factor; return unique levels of input in the order which they appear
#' @export
#'
#' @examples
#'
#' We want the levels to be high, low, medium
#'
#' a <- factor(c("high","low","low","high","medium"))
#' factor_asis(a)
factor_asis <- function(x) {
  if (is.factor(x)) {
    base::factor(x,
                 levels = c(as.character(unique(x))),
                 c(as.character(unique(x))))
  } else {
    stop("Input value should belong to class factor, you privided a class of ", class(x)[1])
  }
}
