############################################################
############################################################
# Data Input Page ----

tabPanel("1. Input Data", navlistPanel(
  
  id = "tabset",
  
  widths = sb_width,
  
  ##############################
  # Data Input Choice Section
  
  source(glue("2_UI_Scripts/Section 2.1 - Dummy_Data_Choice.R"),  local = TRUE)$value,
  
  ##############################
  # File Upload Section
  
  source(glue("2_UI_Scripts/Section 2.2 - File_Upload.R"),  local = TRUE)$value,
  
  ##############################
  # Data Process Section
  
  source(glue("2_UI_Scripts/Section 2.3 - Data_Process.R"),  local = TRUE)$value,
  
  ##############################
  # App Data Summary Section
  
  source(glue("2_UI_Scripts/Section 2.4 - Data_Summary_post_process.R"),  local = TRUE)$value
  
  )
  
  )

############################################################
############################################################