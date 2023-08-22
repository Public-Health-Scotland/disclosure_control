############################################################
############################################################
#Data Summary Post Processing Section

##############################
# Generate Summary tables for App Data

# Generate a summary of the App data
output$process_summary_dist <- renderPrint({
  
  # Ensures input data is provided
  shiny::validate(
    need(!is.null(App_data$values), "")
  )
  
  # Data Summary ----
  summary(App_data$values)
  
})

# Generate a summary of percentage of missing data in each variable ----
output$process_missing <- renderPrint({
  
  # Ensures input data is provided
  shiny::validate(
    need(!is.null(App_data$values), "")
  )
  
  # Calculates Percentage of data missing in each variable
  (colSums(is.na(App_data$values)) / nrow(App_data$values))*100
  
})

############################################################
############################################################