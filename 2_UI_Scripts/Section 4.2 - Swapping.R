############################################################
############################################################
# Disclosure Method - Swapping

tabPanel("Record Swapping", fluid = TRUE,
         
         # Contains Input and output Definitions
         fluidRow(
           
           # Sidebar panel for inputs ----
           sidebarPanel(
             
             
             # Choose Variables to Swap
             selectInput("Disc_Variables_Swap", label = "Choose Variables to Swap:", choices = "", multiple = TRUE),
             
             
             # Sidebar Panel for Swapping Condition
             numericInput("Swap_Cond","Condition for Swapping",value = 10, min = 1, max = 1000),
             
             br(),
             
             #Action Button to swap data
             h5(strong("Record Swapping")),
             actionButton("swapping", "Swap"),
             
             br(),
             br(),
             br(),
             
             h4("Swapping Information"),
             p("For record swapping, all numbers in the selected variables less than or equal to the swapping condition are swapped.")
             
           ),
           
           # Main panel for displaying outputs ----
           mainPanel(
             
             # Data Output for processed or unprocessed data
             DT::dataTableOutput("Swapped_data")
             
           )
           
         )
         
)
############################################################
############################################################