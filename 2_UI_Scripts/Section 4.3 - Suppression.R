############################################################
############################################################
# Disclosure Method - Suppression
tabPanel("Suppression", fluid = TRUE,
         
         # Contains Input and output Definitions
         fluidRow(
           
           # Sidebar panel for inputs ----
           sidebarPanel(
             
             # Primary Suppression Variables
             selectInput("Disc_Variables_Pri_Supp", label = "Choose Variables for Primary Suppression:", choices = "", multiple = TRUE),
             
             
             # Secondary Suppression Variables
             selectInput("Disc_Variables_Secondary_Supp", label = "Choose Variables for Secondary Suppression:", choices = "", multiple = TRUE),
             
             
             # Sidebar Panel for Suppresion Conditions
             numericInput("Pri_Supp_Cond","Condition for Suppression",value = 10, min = 1, max = 1000),
             
             br(),
             
             # Choose Suppression Characters
             selectInput("Supp_Chars", label = "Choose Character for suppression:", choices = c("c","*"), multiple = FALSE),
             
             # Checkbox to ensure that zeros are not suppressed
             h5(strong("Choose if zeros should not be suppressed")),
             checkboxInput("zero_sup", label = "No zero suppression"),
             
             br(),
             
             #Action Button for Primary Suppression
             h5(strong("Primary Suppression")),
             actionButton("pri_sup", "Suppression"),
             
             br(),
             
             #Action Button for Primary & Secondary Suppression
             h5(strong("Primary & Secondary Suppression")),
             actionButton("pri_sec_sup", "Suppression"),
             
             br(),
             br(),
             br(),
             
             h4("Suppression Information"),
             p("For suppression, all numbers in the selected variables less than or equal to the suppression condition are suppressed. If the checkbox is ticked,
                              then zeros remain unsuppressed. This checkbox works for both types of suppression. For the suppression character, a * is the most
               commonly used character. For any open data, please use c")
             
           ),
           
           # Main panel for displaying outputs ----
           mainPanel(
             
             # Data Output for processed or unprocessed data
             DT::dataTableOutput("Suppress_data")
             
           )
           
         )
         
)
############################################################
############################################################