#' @title Dynamic System at An(t=1)
#'
#' @description Derive the limit at point a.
#'
#' @details Builds a recursive solution with A(t=1) = A(0), or the initial condition.
#' Can be used to test the fixed points of a system by building the cobweb from this 
#' data.
#'
#' @param Ao number, f(x) value, or A(n) value, of the initial condition at time 0. 
#' @param steps integer, the number of times steps into the future.
#' @param .fun function, a mathematical function defined by function().
#'
#' @return A dataframe with time steps (t), Ao recursive value of An(t), and
#' An_t_1 the value based on the lagged An(t), previous result.
#' 
#' @note No imports
#' 
#' @examples {
#'  fx2 <- function(x) {x^2}
#'  An1 <- An_t_1(Ao = 0, steps = 100, .fun = fx2)
#' }
#'
#' @export


An_t_1 <- function(Ao,steps,.fun){
  
  #t_vector <- dis.sim.mod::f_a_h(a = Ao, h = steps, step_size = 10)
  #a_results <- data.frame(t=t_vector)
  
  a_results <- data.frame(t=0)
  
  for (t in 1:steps){

    if (t == 1) {
      a_results[t,'t'] <- t - 1
      a_results$Ao <- Ao
      a_results$An_t_1 <- .fun(Ao)
      
    } else { 
      a_results[t,'t'] <- t - 1
      a_results[t,'Ao'] <- a_results[t-1,'An_t_1']
      a_results[t,'An_t_1'] <- .fun(a_results[t-1,'An_t_1'])    
    }
    
  }
  a_results
}