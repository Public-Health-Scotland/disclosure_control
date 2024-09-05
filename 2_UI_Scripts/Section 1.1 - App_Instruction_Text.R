### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### Section 1.1 - App_Instruction_Text.R Script ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### Setup App Instruction Sub-Tab   ### ### ### ### ### ### ### ### ### ### ### ### 
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
# 1. Stores Instructions for App Instruction Section ----
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

tabPanel("App Instructions",
         
         fluidRow(
           
           ### ### ### ### ### ### ### ### ### ### ### ### ###
           ## 1. Main panel for displaying all text ----
           ### ### ### ### ### ### ### ### ### ### ### ### ###
           
           mainPanel(
             
             ### ### ### ### ### ### ###
             ### 1. Main Page Title ----
             ### ### ### ### ### ### ###
             
             h1("Statistical Disclosure Control App Instructions"),
             
             ### ### ### ### ### ### ###
             ### 2. Initial Information Section ----
             ### ### ### ### ### ### ###
             
             # Paragraph text
             p("For performing statistical disclosure on a variable, the variable must be numeric, and the variable
                should not contain any numbers that have decimals in them. This is because the disclosure methods are
                designed to process whole numbers."),

             # Paragraph text
             p("Please note that this App contains training data to assist with understanding of SDC and
                the other features within this App."),
             
             # Line Break
             br(),
             
             ### ### ### ### ### ### ###
             ### 3. File Upload Section ----
             ### ### ### ### ### ### ###
             
             # Main Section Title
             h2("Step 1 - File Upload/Data Processing"),
             
             # Training Data Subsection
             h3("Step 1a - Training Data Choice"),
             
             # Paragraph text
             p("This step is designed for 1st time users of the App to ensure that the user is familiar with all the App's features.
               For this step, in the Data Input section in ", strong("Tab 1.", .noWS = "after"), ", choose the training data that is to be used and
               click the ", strong("Use Training Data"), "button. If no training data is to be selected, skip this step, and go to Step 1b."),
             
             # Upload File Subsection
             h3("Step 1b - File Upload"),

             # Paragraph text
             p("If training data is being used to check the features of the App, then skip this step.
                For Step 1b, go to ", strong("Tab 1."), "Click the browse button to upload a file of your choosing.
                In this tab, a data summary table and a missing data table will appear after the file has been uploaded.
                This will show a data summary for each variable and the percentage of data missing in each variable respectively." ),
             
             # Data Process Subsection
             h3("Step 1c - Data Processing"),
             
             # Paragraph text
             p("If no data processing is required, step 1c can be skipped. For variable conversion, in the ", strong("Choose Variable to Convert"),
               "select box, choose the variable to be converted. Once the variable has been selected, press one of the convert buttons. This will
                ensure that the variables selected are transformed into either a numeric variable or a character variable."),
             
             ### ### ### ### ### ### ###
             ### 4. Filtering/Formatting Section ----
             ### ### ### ### ### ### ###
             
             # Main Section Title
             h2("Step 2 - Data Filtering/Formatting"),
             
             # Paragraph text
             p("For Step 2, go to ", strong("Tab 2."), "Please note that if no filtering or formatting is
                required that this step can be skipped. Please note that if filtering is required on more
                than one variable, then go back to step 2 after the completion of step 4."),
             
             # Filtering Subsection
             h3("Step 2a - Filtering"),

             # Paragraph text
             p("For Filtering, first click the ", strong("Store Unprocessed Data"),  "button and then click the ", strong("add filter"), "button. Another button as well as
                two dropdown boxes will appear. In the ", strong("Choose Variable"), "box choose the variable to be filtered. In the ", strong("Select variable values to remove"),
               "box, select the variable values that are to be removed from the data. After the filtering has been done, click the ", strong("Clear Filter") , "button to remove the
                filter from the input panel. To ensure that the filtered data can be joined back on later, click the ", strong("Store filtered data"), "button"),
             
             # Formatting Subsection
             h3("Step 2b - Formatting"),

             # Paragraph text
             p("For data formatting, this stage is needed if long data needs to be transformed into wide data so that primary and
                secondary suppressions can be performed. For this stage, in the formatting section of " , strong("Tab 2."), "click the ",
                strong("Remove Serial Number"), "Button. The serial number must be removed so that the transformation can occur. In the Transform format section, 
                select one variable in the key variable drop down box and one variable in the value variable drop down box. Then click 
                the Transform long data into wide data button."),
             
             ### ### ### ### ### ### ###
             ### 5. Disclosure Methods Section ----
             ### ### ### ### ### ### ###
             
             # Main Section Title
             h2("Step 3 - Disclosure Control"),
             
             # Paragraph text
             p("Please note that all three disclosure methods are in",  strong("Tab 3.")),
             
             # Rounding Subsection
             h3("Step 3a - Rounding"),
             
             # Paragraph text
             p("If no rounding is needed, please move to record swapping for Step 3b. For rounding of the data, first select the
                variables that are to be rounded. Once the variables are selected, please enter the rounding value in the ",
                strong("Condition for rounding"), " select box and press the ", strong("Round"), " button."),
             
             # Swapping Subsection
             h3("Step 3b - Record Swapping"),

             # Paragraph text
             p("If no record swapping is needed, please move to suppression for Step 3c. For record swapping, first select the variables
                that are to be swapped. Once the variables are selected, please enter the swapping value in the ",
                strong("Condition for Swapping"), " select box and press the ", strong("Swap"), " button."),
             
             # Suppression Subsection
             h3("Step 3c - Suppression"),
             
             # Paragraph text
             p("If no suppression is needed, please move to ", strong("Tab 2"), " for Step 4."),

             # Paragraph text
             p("Please note that if zeros are not to be suppressed, then tick the No zero suppression checkbox. This can be used
               for primary suppression as well as primary & secondary suppression. Also, in the ", strong("Choose Character for suppression:"),
               "choose the suppression character that is to be used."),
             
             # Primary Suppression
             h4("1. Primary Suppression"),

             # Paragraph text
             p("For primary suppression, select the variables under the Primary Suppression
               heading that are to be suppressed. Once the variables are selected, please enter the suppression value in the ", strong("Condition for Suppression"),
               " select box and press the ", strong("Suppress"), " button under the Primary Suppression Heading."),
             
             # Primary & Secondary Suppression
             h4("2. Primary & Secondary Suppression"),

             # Paragraph text
             p("For Primary & Secondary Suppression,  select the variables under the Primary Suppression
                heading that are needed for primary suppression. Then select the variables for the variables under the Secondary Suppression
                heading that require secondary suppression. Once the variables are selected, please enter the suppression value in the ",
                strong("Condition for Suppression"), " select box and press the ", strong("Suppress"), " button under the Primary & Secondary Suppression Heading."),
             
             ### ### ### ### ### ### ###
             ### 6. Re-add filtered data/reformat data section ----
             ### ### ### ### ### ### ###
             
             # Main Section Title
             h3("Step 4 - Re-add Filtered Data/Reformat data"),

             # Paragraph text
             p("If no filtering or formatting has been done on this data, this step can be skipped. To transform the wide data back into long data,
                click the Transform wide data into long data button within", strong("Tab 2."), "To re-add the filtered data,
                click the re-add Serial number button if the serial number has been removed for the data formatting stage. Then click on the 
                re-add filtered data button. This will re-add the filtered data and the observations will be in the same order as the initial input file.
                Then click the remove Serial Number button to ensure that the serial number is not in the final downloaded file."),
             
             ### ### ### ### ### ### ###
             ### 7. Download data section ----
             ### ### ### ### ### ### ###
             
             # Main Section Title
             h3("Step 5 - Download Data"),

             # Paragraph text
             p("In", strong("Tab 1."), "there is a data summary tab for when after data processing or disclosure has occurred.
                This can be used to check if the final dataset is formatted as expected."),
             
             # Paragraph text
             p("If any mistakes have been made with the choice of disclosure variables, disclosure methods or filtering, then press the ",
                strong("Reset Uploaded Data"), " button, which will transform the data back to its initial state. If training data is being
                used, then press the ", strong("Reset Training Data"), "button. Once the Reset button is pressed,
                then go back to Step 2 and start again."),
             
             # Paragraph text
             p("If the result is what was expected, then click the download button and put the downloaded file in the folder of choice.")
             
             )
           
           )
         
         )

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### End of Sub- Script  ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
