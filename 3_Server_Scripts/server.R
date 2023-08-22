########################################################################
########################################################################
########################################################################

server <- function(input, output, session) {
  
  # This is where the external scripts get uploaded for the server function for the different App tabs
  ############################################################
  ############################################################
  # Home Section - there is no script required as the home section has no active functions.

  ############################################################
  ############################################################
  # File Upload/Data Input Section
  
  # Training Data Input Side Panel Script
  source(glue("3_Server_Scripts/Section 2.1 - Dummy_Data.R"),  local = TRUE)$value
  
  # File Upload Side Panel Script
  source(glue("3_Server_Scripts/Section 2.2 - File_Upload.R"),  local = TRUE)$value
  
  # Data Process Side Panel Script
  source(glue("3_Server_Scripts/Section 2.3 - Data_Process.R"),  local = TRUE)$value
  
  # Data Summary after processing Side Panel script
  source(glue("3_Server_Scripts/Section 2.4 - Data_Summary_post_process.R"),  local = TRUE)$value
  
  ############################################################
  ############################################################
  # Filtering/Formatting Section
  
  # Filtering Side Panel Script
  source(glue("3_Server_Scripts/Section 3.1 - Filtering.R"),  local = TRUE)$value
  
  # Formatting Side Panel Script
  source(glue("3_Server_Scripts/Section 3.2 - Formatting.R"),  local = TRUE)$value
  
  ############################################################
  ############################################################
  # SDC Methods Section
  
  # Rounding Side Panel Script
  source(glue("3_Server_Scripts/Section 4.1 - Rounding.R"),  local = TRUE)$value
  
  # Swapping Side Panel Script
  source(glue("3_Server_Scripts/Section 4.2 - Swapping.R"),  local = TRUE)$value
  
  # Suppression Side Panel Script
  source(glue("3_Server_Scripts/Section 4.3 - Suppression.R"),  local = TRUE)$value
  
  ############################################################
  ############################################################
  # Download Section
  
  # Download Script
  source(glue("3_Server_Scripts/Section 5 - Download.R"),  local = TRUE)$value
  
  ############################################################
  ############################################################
  
  # Shut App when browser is closed
  session$onSessionEnded(stopApp)
  
}

########################################################################
########################################################################
########################################################################