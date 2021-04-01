#' @title Deck of Cards
#'
#' @description Functions related to generating deck of cards data and probabilities 
#' for different spread of hands.
#'
#' @details This is a test.
#' 
#' @name deck_of_cards
#'
#' @param sims number, the number of simulations to run in for loop.
#' @param deck dataframe, dataframe with a deck of cards.  Can be built with
#' `deck_of_cards()`.
#' @param hand_size number, number of cards for each hand or run.
#' @param ... arguments passed to `shuffle_cards()`, which can also pass args to
#'  `dplyr::sample_n()`.
#'
#' @return A vector of points that replicate the limit as they approach a.
#' 
#' @importFrom magrittr %>%
#' @importFrom dplyr rename arrange sample_n n
#' @importFrom rlang .data
#' 
#' @examples {
#'  # Instantiate a deck
#'  deck_cards <- deck_of_cards()
#'  # Shuffle Cards, select hand size
#'  dc_shuffle <- shuffle_cards(deck = deck_cards, hand_size = 5)
#'  # Generate probability for Full House
#'  fh_prob <- full_house_prob(sims = 10000, deck = deck_cards, hand_size = 5)
#'  # Genearte probability for Two of a Kind
#'  two_of_kind(sims = 50, deck = NA, hand_size = 5)
#' }


#' @export
#' @details This is test2
deck_of_cards <- function() {
  suit <- c('spades','clubs','hearts','diamonds')
  number <- seq(1,13,1)
  deck_cards <- expand.grid(suit,number, KEEP.OUT.ATTRS = FALSE) %>% 
    as.data.frame() %>% 
    dplyr::rename(face = .data$Var1, value = .data$Var2) %>% 
    dplyr::arrange(.data$face,.data$value)
  deck_cards  
}


#' @export
#' @rdname deck_of_cards
shuffle_cards <- function(deck,hand_size,...) {
  #set.seed(17)
  #rows_shuffle <- sample(nrow(deck), size = hand_size, ...)
  #dc_shuffle <- deck_cards[rows_shuffle,]
  if(any(is.na(deck))) {deck <- deck_of_cards()} else {deck}
  dc_shuffle <- dplyr::sample_n(deck, size = 5,...)
  dc_shuffle
}


#' @export
#' @rdname deck_of_cards
full_house_prob <- function(sims, ...) {
  full_house_cnt <- 0
  for(runs in 1:sims) {
    card_cnt <- shuffle_cards(...) %>% 
      dplyr::group_by(.data$value) %>% 
      dplyr::summarise(card_cnt = dplyr::n(), .groups = 'keep')
    if(max(card_cnt$card_cnt) == 3 & min(card_cnt$card_cnt) == 2) {
      full_house_cnt <- full_house_cnt + 1
    } else { full_house_cnt }
  }
  print('full_house_cnt',full_house_cnt)
  full_house_cnt/sims
}


#' @export
#' @rdname deck_of_cards
two_of_kind <- function(sims,...){
  two_kind_cnt <- 0
  for (i in 1:sims) { 
    kind_cnt <- shuffle_cards(...) %>% 
      dplyr::group_by(.data$value) %>% 
      dplyr::summarise(n = dplyr::n(), .groups = 'keep')
    if (TRUE %in% (as.vector(kind_cnt$n) >=2)) {
      two_kind_cnt <- two_kind_cnt + 1
    } else { two_kind_cnt }
  }
  two_kind_cnt/sims
}


