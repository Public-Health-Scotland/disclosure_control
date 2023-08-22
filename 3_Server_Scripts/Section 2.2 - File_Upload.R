############################################################
############################################################
#File Upload Section

##############################

# Create empty vector to store column names
dsnames <- c()

##############################
# This is for the file upload

# Reactive Statement to store input data
data <- reactive({
  
  # Store Input File
  inFile <- input$upload
  
  # Check if data is given
  req(inFile)
  
  # Ensures valid file Upload
  ext <- tools::file_ext(inFile$name)
  
  # Upload File
  switch(ext,
         csv = as_tibble(read.csv(input$upload$datapath, sep = ",",
                                  quote = '"')),         
         # tsv = vroom::vroom(input$upload$datapath, delim = "\t"),
         xlsx = read_excel(input$upload$datapath),
         xls = read_xls(input$upload$datapath),
         validate("Invalid file; Please upload a .csv or .tsv file")
         
  )
  
})

##############################
# This adds Serial number to App data.

# Allows data to be stored as reactive values for processing
App_data <- reactiveValues(values=NULL)

# Add Serial number as 1st column in dataframe
observe({

  App_data$values <- data() %>%
    mutate(Serial = row_number()) %>%
    select(Serial,
           everything())
  
  
})



##############################
# This renders the summary tables for the file input


# Generate a summary of the dataset ----
output$upload_summary_dist <- renderPrint({
  
  summary(data())
  
})

# Generate a summary of percentage of missing data in each variable ----
output$upload_summary_missing <- renderPrint({
  
  # Calculates Percentage of data missing in each variable
  (colSums(is.na(data())) / nrow(data()))*100
  
})

##############################

############################################################
############################################################