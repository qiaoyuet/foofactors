#' Reorder a factor using desc from dplyr
#'
#' This function allows you to reorder the levels of a factor in decreasing order. R defines decreasing
#' order as decreasing alphabetical order when the levels of factors are strings.
#'
#' @param x factor
#'
#' @return factor; gives reordered levels in decending alphabetical order
#' @export
#'
#' @examples
#'
#' x <- factor(c("a", "b", "c", "d"))
#' levels(x)
#' levels(reorder_desc(x))

reorder_desc <- function(x) {
  if(is.factor(x)) {
    stats::reorder(x, dplyr::desc(x))
  } else {
    stop("Input value should belong to class factor, you privided a class of ", class(x)[1])
  }
}
