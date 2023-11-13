############################################################
############################################################
# SDC Home Page Tab

tabPanel(#tags$head(tags$style(HTML(".selectize-input {border: 1px solid #3F3685;}"))), #controls SelectInput boxes border color
         
         title = "Home",
         
         navlistPanel( 
           
           id = "tabset",
           
           widths = sb_width,
           
           ##############################
           # App Instruction Sub-Tab ----
           
           # Stores SDC App Instructions
           source(glue("2_UI_Scripts/Section 1.1 - App_Instruction_Text.R"),  local = TRUE)$value,
           
           ##############################
           # SDC Theory Sub-Tab ----
           
           # Stores SDC Theory Details
           source(glue("2_UI_Scripts/Section 1.2 - SDC_Theory_Text.R"),  local = TRUE)$value,
           
           ##############################
           # Contact Details Sub-Tab ----
           
           # Stores Contact Details Section
           source(glue("2_UI_Scripts/Section 1.3 - Contact_Details.R"),  local = TRUE)$value,
           
           ##############################
           # Useful Links Sub-Tab ----
           
           # Stores Useful Links Section
           source(glue("2_UI_Scripts/Section 1.4 - SDC_Useful_Links.R"),  local = TRUE)$value
           
         )
         
)

############################################################
############################################################
