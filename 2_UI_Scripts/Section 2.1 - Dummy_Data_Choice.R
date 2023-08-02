############################################################
############################################################
# Dummy Data Choice Page

tabPanel("Training Data",
         
         # Contains Input and output Definitions ----
         fluidRow(
           
           
           # Sidebar panel for inputs ----
           column(3,
                  
                  h4("Use Training Data"),
                  # Input - Disable Training Data Section
                  actionButton("use_train", label = "Use Training Data"),
                  
                  br(),

                  # Input: Select a file ----
                  selectInput("train_data_select", label = "Choose Dataset", choices = c("Wide Data","Long Data"))
                  
           ),
           
           # Main panel for displaying outputs ----
           mainPanel(
             
             # Section Title
             h1(strong("Data Information")),
             
             br(),
             
             # Output: Summary of distribution for File Input ----
             h2(strong("Data Summary")),
             verbatimTextOutput("Train_summary_dist"),
             
             br(),
             
             # Output: Summary of Missing Values for File Input ----
             h2(strong("Percentage of Missing Values for each Variable")),
             verbatimTextOutput("Train_summary_missing") # Shows percentage of missing values by column
             
           )
           
         )
         
)

############################################################
############################################################