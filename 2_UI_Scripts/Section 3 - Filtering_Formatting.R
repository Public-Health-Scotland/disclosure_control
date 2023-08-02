############################################################
############################################################

# Input Data Filtering/Formatting ----
tabPanel("2. Input Data Filtering/Formatting", navlistPanel( 
  
  id = "tabset",
  
  widths = sb_width,
  
  ##############################
  # Filtering Section
  
  source(glue("2_UI_Scripts/Section 3.1 - Filtering.R"),  local = TRUE)$value,
  
  
  ##############################
  # Data Format Transform Section
  
  source(glue("2_UI_Scripts/Section 3.2 - Formatting.R"),  local = TRUE)$value
  
  
)

)

############################################################
############################################################