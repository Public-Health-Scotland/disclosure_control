tabPanel("File Upload",

# Contains Input and output Definitions ----
fluidRow(


# Sidebar panel for inputs ----
column(3,

# Input: Select a file ----
h4(strong("File Upload (This accepts .csv and .xlsx/.xls files)")),
fileInput("upload", NULL, accept = c(".csv", ".tsv", ".xlsx",".xls"))

),

# Main panel for displaying outputs ----
mainPanel(

# Section Title
h1(strong("Data Information")),

br(),

# Output: Summary of distribution for File Input ----
h2(strong("Data Summary")),
verbatimTextOutput("upload_summary_dist"),

br()

)

)

)