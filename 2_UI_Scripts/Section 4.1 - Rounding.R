############################################################
############################################################
# Disclosure Method - Rounding

tabPanel("Rounding",
         
         # Contains Input and output Definitions
         fluidRow(
           
           # Sidebar panel for inputs ----
           sidebarPanel(
             
             # Choose Variables to Round
             selectInput("Disc_Variables_Round", label = "Choose Variables to Round:", choices = "", multiple = TRUE),
             
             
             # Sidebar Panel for Rounding Condition
             numericInput("Round_Cond","Condition for Rounding",value = 10, min = 1, max = 1000),
             
             br(),
             
             #Action Button to round data
             h5(strong("Rounding")),
             actionButton("rounding", "Round"),
             
             br(),
             br(),
             br(),
             
             # Help Text
             h4("Rounding Information"),
             p("For rounding, all selected variables are rounded to the base set in the Condition for Rounding box.")
             
           ),
           
           # Main panel for displaying outputs ----
           mainPanel(
             
             # Data Output for processed or unprocessed data
             DT::dataTableOutput("Rounded_data")
             
           )
           
         )
         
)
############################################################
############################################################