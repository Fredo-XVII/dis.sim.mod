#' @title Quadratic Roots
#'
#' @description Derive the quadratic roots for a quadratic function.
#'
#' @details Delivers roots conditioned on the sign of the discriminant =
#' (b^2) - (4*a*c)
#'
#' @param a number, coefficient of x^2
#' @param b number, coefficient of x
#' @param c number, constanct C
#'
#' @return A solution points, if exists, for a quadratic function.
#' 
#' @examples {
#'  roots <- quad_x_roots(1,7,5)
#' }
#'
#' @export

quad_x_roots <- function(a,b,c) {

  discriminant <- (b^2) - (4*a*c)
  
  if(discriminant < 0) {
    message("This quadratic equation has no real numbered roots.")
  }
  else if(discriminant > 0) {
    x_pos <- (-b + sqrt(discriminant)/(2*a))
    x_neg <- (-b - sqrt(discriminant)/(2*a))
    
    message("The two x-intercepts for the quadratic equation are ",
                  format(round(x_pos, 5), nsmall = 5), " and ",
                  format(round(x_neg, 5), nsmall = 5), ".")
    return(list(root1 = x_pos, root2 = x_neg))
  }
  else { # discriminant = 0
    x_int <- (-b) / (2*a)
    message("The quadratic equation has only one root. This root is ", x_int)
    return(list(root1 = x_int))
  }
}
