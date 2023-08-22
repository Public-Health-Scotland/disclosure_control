############################################################
############################################################

##############################

# Required Packages for shiny app
packages = c("tidyr", "data.table", 
             "glue", "plyr",
             "dplyr", "readr", 
             "rstudioapi", "DistributionUtils", 
             "stringr", "readxl",
             "haven", "shiny",
             "openxlsx", "DT",
             "base64enc", "sparkline",
             "shinyalert")


# Load pacakges or install & load packages
package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)

##############################

# Allows for the use of shiny alerts for notifications
useShinyalert(force = TRUE)

##############################

############################################################
############################################################