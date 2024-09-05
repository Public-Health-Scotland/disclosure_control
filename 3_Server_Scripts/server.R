### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### server.R Script ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### Setup Server for Shiny App  ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
# Server Function ----
# This is where the external scripts get uploaded for the server function for the different App tabs
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

server <- function(input, output, session) {
  
  ### ### ### ### ### ### ### ### ### ### ### ### ###
  ## 1. SDC Home Page ----
  # No script required as the home section has no active functions.
  ### ### ### ### ### ### ### ### ### ### ### ### ###
  
  ### ### ### ### ### ### ### ### ### ### ### ### ###
  ## 2. Data Input Page ----
  ### ### ### ### ### ### ### ### ### ### ### ### ###
  
  ### ### ### ### ### ### ### ###
  ### 1. Training Data Input Side Panel Script ----
  ### ### ### ### ### ### ### ###
  
  source(glue("3_Server_Scripts/Section 2.1 - Dummy_Data.R"),  local = TRUE)$value
  
  ### ### ### ### ### ### ### ###
  ### 2. File Upload Side Panel Script ----
  ### ### ### ### ### ### ### ###
  
  source(glue("3_Server_Scripts/Section 2.2 - File_Upload.R"),  local = TRUE)$value
  
  ### ### ### ### ### ### ### ###
  ### 3. Data Process Side Panel Script ----
  ### ### ### ### ### ### ### ###
  
  source(glue("3_Server_Scripts/Section 2.3 - Data_Process.R"),  local = TRUE)$value
  
  ### ### ### ### ### ### ### ###
  ### 4. Data Summary after processing Side Panel script ----
  ### ### ### ### ### ### ### ###
  
  source(glue("3_Server_Scripts/Section 2.4 - Data_Summary_post_process.R"),  local = TRUE)$value
  
  ### ### ### ### ### ### ### ### ### ### ### ### ###
  ## 3. Filtering/Formatting Page ----
  ### ### ### ### ### ### ### ### ### ### ### ### ###
  
  ### ### ### ### ### ### ### ###
  ### 1. Filtering Side Panel Script ----
  ### ### ### ### ### ### ### ###
  
  source(glue("3_Server_Scripts/Section 3.1 - Filtering.R"),  local = TRUE)$value
  
  ### ### ### ### ### ### ### ###
  ### 2. Formatting Side Panel Script ----
  ### ### ### ### ### ### ### ###
  
  source(glue("3_Server_Scripts/Section 3.2 - Formatting.R"),  local = TRUE)$value
  
  ### ### ### ### ### ### ### ### ### ### ### ### ###
  ## 4. SDC Methods Page ----
  ### ### ### ### ### ### ### ### ### ### ### ### ###

  ### ### ### ### ### ### ### ###
  ### 1. Rounding Side Panel Script ----
  ### ### ### ### ### ### ### ###
  
  source(glue("3_Server_Scripts/Section 4.1 - Rounding.R"),  local = TRUE)$value
  
  ### ### ### ### ### ### ### ###
  ### 2. Swapping Side Panel Script ----
  ### ### ### ### ### ### ### ###
  
  source(glue("3_Server_Scripts/Section 4.2 - Swapping.R"),  local = TRUE)$value
  
  ### ### ### ### ### ### ### ###
  ### 3. Suppression Side Panel Script ----
  ### ### ### ### ### ### ### ###
  
  source(glue("3_Server_Scripts/Section 4.3 - Suppression.R"),  local = TRUE)$value
  
  ### ### ### ### ### ### ### ### ### ### ### ### ###
  ## 5. Download Page ----
  ### ### ### ### ### ### ### ### ### ### ### ### ###

  ### ### ### ### ### ### ### ###
  ### 1. Download Script ----
  ### ### ### ### ### ### ### ###
  
  source(glue("3_Server_Scripts/Section 5 - Download.R"),  local = TRUE)$value
  
  ### ### ### ### ### ### ### ### ### ### ### ### ###
  ## 6. Shut App when browser is closed ----
  ### ### ### ### ### ### ### ### ### ### ### ### ###
  
  session$onSessionEnded(stopApp)
  
}

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### End of Server Script    ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###