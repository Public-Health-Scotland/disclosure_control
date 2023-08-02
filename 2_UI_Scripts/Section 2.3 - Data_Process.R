############################################################
############################################################
# Data Process Section

tabPanel("Data Process",
         
         # Contains Input and output Definitions ----
         fluidRow(
           
           
           # Sidebar panel for inputs ----
           column(3,
                  
                  # Choose Variable to Convert
                  selectInput("Variable_Convert", label = "Choose Variable to Convert:", choices = "", multiple = FALSE),
                  
                  br(),
                  
                  #Button to convert character variable to numeric variable ----
                  h5(strong("Convert Character Variable to Numeric Variable")),
                  actionButton('char_to_num', 'Convert'),
                  
                  br(),
                  
                  #Button to convert numeric variable to character variable ----
                  h5(strong("Convert Numeric Variable to Character Variable")),
                  actionButton('num_to_char', 'Convert')
                  
                  
           ),
           
           # Main panel for displaying data ----
           mainPanel(DT::dataTableOutput("convert_data"))
           
         )
         
)

############################################################
############################################################