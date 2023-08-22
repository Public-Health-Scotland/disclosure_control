########################################################################
########################################################################
########################################################################
# Set Up UI for Shiny App

ui <- fluidPage(
  
  ## Navigation Bar ----
  navbarPage(title = div(tags$a(img(src=b64, width=120, alt = "Public Health Scotland logo"), 
                                href= "https://www.publichealthscotland.scot/",
                                target = "_blank"),
                         style = "position: relative; top: -10px;"), 
             
             # Window Title for Stand-alone website
             windowTitle = "Statistical Disclosure",
             
             # css file for App theme
             header = tags$head(includeCSS(glue("{fp_script}/styles.css"))),
             
             ############################################################
             ############################################################
             ## SDC Home Page ----
             source(glue("2_UI_Scripts/Section 1 - Home Page.R"),  local = TRUE)$value,
             
             ############################################################
             ############################################################
             # Data Input Tab ----
             source(glue("2_UI_Scripts/Section 2 - Data_Input.R"),  local = TRUE)$value,
             
             ############################################################
             ############################################################
             # Input Data Filtering/Formatting Tab----
             source(glue("2_UI_Scripts/Section 3 - Filtering_Formatting.R"),  local = TRUE)$value,
             
             ############################################################
             ############################################################
             # Disclosure Methods Tab
             source(glue("2_UI_Scripts/Section 4 - Disclosure_Methods.R"),  local = TRUE)$value,

             ############################################################
             ############################################################
             # Download Tab
             source(glue("2_UI_Scripts/Section 5 - Download.R"),  local = TRUE)$value
             
             ############################################################
             ############################################################
             
  )
  
)

########################################################################
########################################################################
########################################################################