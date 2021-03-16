#' @title The Limit at a Point
#'
#' @description Find the limit at a point x1 from another point x2 for a function.
#'
#' @details Find the limit at a point x1 from another point x2 for a function.
#'
#' @param x1 numeric, limit number
#' @param x2 numeric, the number near the limit
#' @param .fun function, a function to find the limit
#'
#' @return A number, or limit of x1 at x2.
#'
#' @examples {
#'  fx2 <- function(x) {x^2}
#'  lim_dx1_dx2(x1 = 1, x2 = 4, .fun = fx2)
#' }
#'
#' @export

lim_dx1_dx2 <- function(x1,x2,.fun) {(.fun(x1) - .fun(x2))/(x1-x2)}
