tabPanel("4. Download Data", fluid = TRUE,
         
         # Sidebar layout with input and output definitions ----
         fluidRow(
           
           # Sidebar panel for inputs ----
           sidebarPanel(
             
             h4(strong("File Download/Data Reset")),
             
             #Action Button to ensure that data can be transferred back to it's original state
             h5(strong("Reset Uploaded Data")),
             actionButton("upload_dat_reset", "Reset"),
             
             br(),
             
             #Action Button to ensure that data can be transferred back to it's original state
             h5(strong("Reset Training Data")),
             actionButton("training_dat_reset", "Reset"),
             
             br(),
             
             # Download button to download processed data
             h5(strong("Download Data")),
             downloadButton("downloadData", label = "Download")
             
           ),
           
           # Main panel for displaying outputs ----
           mainPanel(
             
             # Data Output for processed or unprocessed data
             DT::dataTableOutput("Final_data")
             
           )
           
         )
         
)