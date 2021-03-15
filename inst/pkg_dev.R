# Package Development Script

library(usethis)
library(devtools)
library(roxygen2)
library(testthat)
library(purrr)

# Create package - done manually, versioning, and documentation

## Package Documentation and Vignettes
usethis::use_description()
usethis::use_namespace()
usethis::use_news_md()
usethis::use_readme_rmd()
usethis::use_gpl3_license(name = "Alfredo G Marquez")
usethis::use_pkgdown()
usethis::use_package_doc()

# Create/add functions
usethis::use_pipe()
usethis::use_r("f_a_h")


# Limiting function 
#dx_1 <- function(x1,x2) {(fx_1(x1) - fx_1(x2))/(x1-x2)}
lim_dx <- function(x1,x2,.fun) {(.fun(x1) - .fun(x2))/(x1-x2)}

# Combine the functions above to built the limit function: `limit_at_a()`
# Derives the derivative @ point a.
limit_at_a <- function(a,.fun) {
  delta_range <- f_a_h(a = a, h = 0.01) # a +/- h, a vector centered on point a.
  limit_range <- lim_dx(x1 = a, x2 = delta_range, .fun = .fun) # associated limits from delta_range
  limit_at_a <- limit_range[(which(is.na(lim_2))-1):(which(is.na(lim_2))+1)] %>% na.omit() %>% mean()
  limit_at_a
}

# Add Packages

## Import Packages
import_pkg_list <- c("RPostgres","stringr","dbplyr","dplyr","rlang","tidyr","askpass","ssh",
                     "glue", "purrr")
purrr::map2(import_pkg_list, .y = "Imports", .f = usethis::use_package)

## Suggests Packages
suggests_pkg_list <- c("roxygen2","kableExtra","remotes","knitr","rmarkdown","testthat","covr")

purrr::map2(suggests_pkg_list, .y = "Suggests", .f = usethis::use_package)



# After adding roxygen2 params to function in R folder
roxygen2::roxygenise()
devtools::document()
devtools::load_all()

# Build Tests

usethis::use_testthat()

# Update Version
usethis::use_version()

# Build Pkgdown
pkgdown::build_site()


# Buildignore: Add directory
usethis::use_build_ignore("docs")
usethis::use_build_ignore(".Rhistory")
usethis::use_build_ignore("pkg_dev")


# Spell Check

usethis::use_spell_check()


# Functions Roxygen format
#' @title
#'
#' @description
#'
#' @details
#'
#' @param
#'
#' @return
#'
#' @examples
#'
#' @export