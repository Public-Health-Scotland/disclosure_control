############################################################
############################################################
# Disclosure Methods
tabPanel(title = "3. SDC Methods", navlistPanel(
  
  id = "methods",
  
  widths = sb_width,
  
  ##############################
  # Disclosure Method - Rounding
  source(glue("2_UI_Scripts/Section 4.1 - Rounding.R"),  local = TRUE)$value,
  
  ##############################
  # Disclosure Method - Swapping
  source(glue("2_UI_Scripts/Section 4.2 - Swapping.R"),  local = TRUE)$value,
  
  ##############################
  # Disclosure Method - Suppression
  source(glue("2_UI_Scripts/Section 4.3 - Suppression.R"),  local = TRUE)$value
  
  
)

)

############################################################
############################################################