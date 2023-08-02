############################################################
############################################################
# Dummy Data Choice Section

##############################

trainingdata <- reactive({
  switch(input$train_data_select,
         "Wide Data" = wide_data,
         "Long Data" = long_data)
  
})

# Allows data to be stored as reactive values for processing
App_data <- reactiveValues(values=NULL)

##############################

# Generate a summary of the dataset ----
output$Train_summary_dist <- renderPrint({
  
  summary(trainingdata())
  
})

# Generate a summary of percentage of missing data in each variable ----
output$Train_summary_missing <- renderPrint({
  
  # Calculates Percentage of data missing in each variable
  (colSums(is.na(trainingdata())) / nrow(trainingdata()))*100
  
})

##############################


# Select Training Data with button press ----
observeEvent(
  
  input$use_train, {
    
    App_data$values <- trainingdata() %>%
      mutate(Serial = row_number()) %>%
      select(Serial,
             everything())

  }
  
)

############################################################
############################################################