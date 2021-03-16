#' @title The Slope (Limit) at a Point
#'
#' @description Find the slope, rise over run, at a point x1 from another point 
#' x2 for a function.
#'
#' @details Find the slope, or rise over run, at a point x1 from another point 
#' x2 for a function.
#'
#' @param x1 numeric, limit number
#' @param x2 numeric, the number near the x1
#' @param .fun function, a function to find the limit, or slope
#'
#' @return A number, or limit of x1 at x2.
#'
#' @examples {
#'  fx2 <- function(x) {x^2}
#'  slope_x1_x2(x1 = 1, x2 = 4, .fun = fx2)
#' }
#'
#' @export

slope_x1_x2 <- function(x1,x2,.fun) {(.fun(x1) - .fun(x2))/(x1-x2)}
