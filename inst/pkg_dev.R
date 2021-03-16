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
usethis::use_r("lim_dx1_dx2")
usethis::use_r("limit_at_a") 
usethis::use_r("dy_dx") 

# Add Packages

## Import Packages
import_pkg_list <- c("magrittr","purrr")
purrr::map2(import_pkg_list, .y = "Imports", .f = usethis::use_package)

## Suggests Packages
suggests_pkg_list <- c("roxygen2","remotes","knitr","rmarkdown","testthat")

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
#' @import
#'
#' @examples
#'
#' @export