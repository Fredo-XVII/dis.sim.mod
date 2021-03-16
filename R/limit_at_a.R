#' @title The Limit at a
#'
#' @description Derive the limit at point a.
#'
#' @details Combines the `f_a_h()` and `limit_dx1_dx2()` to generate a vector 
#' of numbers as the numbers approach a shows the limit to a.
#'
#' @param a number, the number which is being limited.
#' @param h number, the point from the center, or a, that is +/- from the center.
#' @param step_size number, size of steps between numbers, or a and h.
#' @param ... arguments passed to `seq()`
#'
#' @return A vector of points that replicate the limit as they approach a.
#' 
#' @import magrittr %>%
#' @import purrr partial
#' 
#' @examples {
#'  fx2 <- function(x) {x^2}
#'  x_vector <- seq(-2*pi,2*pi, by = (pi/8))
#'  limit_at_a(a = 0, h = 10, step_size = 0.1, .fun = fx2)
#' }
#'
#' @export

limit_at_a <- function(a,h,.fun,step_size,...) {
  delta_range <- f_a_h(a = a, h = h, step_size = step_size) # a +/- h, a vector centered on point a.
  limit_range <- lim_dx1_dx2(x1 = a, x2 = delta_range, .fun = .fun) # associated limits from delta_range
  limit_at_a <- limit_range[(which(is.na(limit_range))-1):(which(is.na(limit_range))+1)] %>% na.omit() %>% mean()
  limit_at_a
}

dy_dx <- function(.fun, ...) {
  limit_at_a_vector <- purrr::partial(.f = limit_at_a, .fun = .fun)
  dy_dx <- purrr::pmap_dbl(.l = list(...), .f = limit_at_a_vector)
  dy_dx
}

dy_dx(.fun = fx2, a = x_vector, h = 10, step_size = 0.1)

