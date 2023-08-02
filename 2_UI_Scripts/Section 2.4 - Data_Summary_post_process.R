############################################################
############################################################
# App Data Summary Section

tabPanel("Data Summary after processing",
         
         # Contains Input and output Definitions ----
         fluidRow(
           
           # Main panel for displaying outputs ----
           mainPanel(
             
             # Section Title
             h1(strong("Data Information")),
             
             br(),
             
             # Output: Summary of distribution for App data ----
             h2(strong("Data Summary")),
             verbatimTextOutput("process_summary_dist"),
             
             br(),
             
             # Output: Summary of Missing Values for App data----
             h2(strong("Percentage of Missing Values for each Variable")),
             verbatimTextOutput("process_missing") # Shows percentage of missing values by column
             
           )
           
         )
         
)
############################################################
############################################################