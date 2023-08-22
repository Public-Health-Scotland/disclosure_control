############################################################
############################################################
# Data Format Transform Section

tabPanel("Transform Format",
         
         # Contains Input and output Definitions
         fluidRow(
           
           # Sidebar panel for inputs ----
           sidebarPanel(
             
             h4(strong("Long to Wide Data Transformation")),
             
             #Button to remove serial number ----
             h5(strong("Remove Serial Number")),
             actionButton('rem_ser', 'Remove'),
             
             br(),
             
             #Button to put Serial number back ----
             h5(strong("Re-add Serial Number")),
             actionButton('re_add_ser', 'Serial'),
             
             br(),
             
             # Key Variable for long to wide transfrom
             selectInput("keyvariableId", label = "Choose Key Variable", choices = ""),
             
             # Value Variable for long to wide transfrom
             selectInput("valuevariableId", label = "Choose Value Variable", choices = ""),
             
             #Button to transform long data into wide data
             h5(strong("Transform Long Data into Wide Data")),
             actionButton('long_wide_trans', 'Transform'),
             
             h4(strong("Wide to Long Data Transformation")),
             
             
             #Button to transform wide data back into long data
             h5(strong("Transform Wide Data into Long Data")),
             actionButton('wide_long_trans', 'Transform'),
             
             br(),
             br(),
             br(),
             
             # Help Text ----
             h4("Transform Information"),
             p("For the long to wide data transform, if the wrong variables are entered in the data transform stage, go to ", strong("Tab 5"), 
               "and click the Reset data button. Also, for this stage, the serial number must be removed.")
             
           ),
           
           # Main panel for displaying data ----
           mainPanel(DT::dataTableOutput("format_data")))
         
)

############################################################
############################################################