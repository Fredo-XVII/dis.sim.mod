#' @title Centered Vector
#'
#' @description Create vector centered on `a` and bounded by `h`, by step size `step_size`.
#'
#' @details Creates a vector from a-h to a+h, centered on a, by step size `step_size`.
#'
#' @param a number, that centers the vector
#' @param h number, the point from the center will be is +/- from the center.
#' @param step_size number, size of steps between numbers.
#' @param ... arguments passed to `seq()` function.
#'
#' @return A vector from a-h to a+h, centered on a, by step size `step_size.`
#'
#' @examples {
#'  vector <- f_a_h(a = 0, h = 10, step_size = 1)
#' }
#'
#' @export


f_a_h <- function(a,h, step_size, ...) {seq(a - h, a + h, by = step_size, ...)}
