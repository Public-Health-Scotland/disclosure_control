############################################################
############################################################
# Filtering Section

tabPanel("Filtering",
         
         # Contains Input and output Definitions ----
         fluidRow(
           
           # Sidebar panel for inputs ----
           sidebarPanel(
             
             # Button to store data prior to filtering ---- 
             h5(strong("Store Unprocessed Data")),
             actionButton('Unprocess_Store', 'Store'),
             
             br(),
             
             
             # Button to filter Data ----
             h5(strong("Filter Data")),
             actionButton('addFilter', 'Add filter'),
             
             tags$div(id = 'placeholderAddRemFilt'),
             
             tags$div(id = 'placeholderFilter'),
             
             br(),
             
             #Button to store filtered data ----
             h5(strong("Store Filtered Data")),
             actionButton('store_data', 'Store'),
             
             br(),
             
             
             #Button to re-add filtered data back into data frame ----
             h5(strong("Re-add Filtered Data Back In")),
             actionButton('re_add_data', 'Re-add')
             
           ),
           
           
           
           # Main panel for displaying data ----
           mainPanel(DT::dataTableOutput("filtered_data")))
         

)

############################################################
############################################################