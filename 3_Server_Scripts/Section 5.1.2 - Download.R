############################################################
############################################################
# Download and reset of training data

##############################
# Reset processed training data to original state with button press ----
observeEvent(
  
  input$training_dat_reset, {
    
    # Ensures that this only works when data is provided
    shiny::validate(
      need(trainingdata(), "There is no input data")
    )
    
    shinyalert("Input data reset to initial state.", type = "success")
    
    
    #Temp Data Storage ----
    isolate({
      
      App_data$values <- trainingdata() %>%
        mutate(Serial = row_number()) %>%
        select(Serial,
               everything())
      
    })
    
    # Clear Prior Settings
    unprocessed$data <- NULL
    removed_values$removed_data <- NULL
    Serial_Removed$data <- NULL
    key_value_header$header <- NULL
    variable_value_header$header <- NULL
    key_value_options$data <- NULL
    
  }
  
)


##############################

############################################################
############################################################