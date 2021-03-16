#' @title Derivative of f(x)
#'
#' @description Generate the data derivative of f(x)
#'
#' @details Given a vector of X's and a function, this function will generate 
#' the Y's for dy/dx, or the output of the derivative.
#'
#' @param .fun function, a mathematical function defined by function()
#' @param ... paramaters passed on to the `limit_at_a()` function.  The needed
#' parameters are:
#'   - `a` number, numerical vector of X's
#'   - `h`` number, is the range around an X's used to derive the slope or limit.
#'   - `step_size` number, the step size in deriving the slope or limit.
#'
#' @return Creates a vector of output for dy/dx of function f(x).  Combined with
#' 
#' @importFrom purrr partial pmap_dbl
#'
#' @examples {
#'   fx2 <- function(x) {x^6} # The function
#'   x_vector <- seq(-100,100, by = 10) # The X vector
#'   dy_dx(.fun = fx2, a = x_vector, h = 1, step_size = 0.5) # The Derivative
#' }
#'
#' @export

dy_dx <- function(.fun, ...) {
  limit_at_a_vector <- purrr::partial(.f = limit_at_a, .fun = .fun)
  dy_dx <- purrr::pmap_dbl(.l = list(...), .f = limit_at_a_vector)
  dy_dx
}
