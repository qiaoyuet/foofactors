#' Detect whether a factor is truly factor or character
#'
#' If the number of unique values equal to the length of input, we consider the input as factor; otherwise,
#' we consider it as character
#'
#' @param x factor
#'
#' @return boolean; \code{TRUE} if input should be considered as factor,
#'    \code{FALSE} if input should be considered as character
#' @export
#'
#' @examples
#' a <- factor(c("high", "high", "low"))
#' b <- factor(c("high", "low", "medium"))
#'
#' This should be a factor:
#' detect_fct(a)
#'
#' This should be a character:
#' detect_fct(b)
#'
detect_fct <- function(x) {
  if (is.factor(x)) {
    length(x) != length(unique(x))
  } else {
    stop("Input value should belong to class factor")
  }
}
