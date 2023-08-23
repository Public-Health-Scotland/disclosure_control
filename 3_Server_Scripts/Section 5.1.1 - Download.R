############################################################
############################################################
# Download and Reset of Upload Data

##############################
# Reset processed data to original state with button press ----

observeEvent(
  
  input$upload_dat_reset, {
    
    # Ensures that this only works when data is provided
    shiny::validate(
      need(data(), "There is no input data")
    )
    
    shinyalert("Input data reset to initial state.", type = "success")
    
    
    #Temp Data Storage ----
    isolate({
      
      App_data$values <- data() %>%
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

### Download Processed Uploaded Data ----
output$downloadData <- downloadHandler(
  
  # Store Filename
  filename = function(){
    

    # Ensures that this only works when data is provided
    shiny::validate(
      need(App_data$values, "There is no input data")
    )
    
    paste0("SDC_", input$upload$name)
    
  },
  
  # Download of different file type
  content = function(fname){
    
    # Ensures that this only works when data is provided
    shiny::validate(
      need(App_data$values, "There is no input data")
    )
    
    # Final Data
    Final <- App_data$values 
    
    
    if (input$upload$type == "text/csv") {
      
      write.csv(Final, fname, row.names = FALSE)
      
    } else if (input$upload$type == "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
      
      # For writeing xlsx, data must be stored in dataframe ----
      Final <- as.data.frame(Final)
      
      write.xlsx(Final, fname, row.names = FALSE)
      
    } else if (input$upload$type == "application/vnd.ms-excel") {
      
      # For writeing xls, data must be stored in dataframe ----
      Final <- as.data.frame(Final)
      
      write.xlsx(Final, fname, row.names = FALSE)
      
    } else {
      
      write.csv(Final, fname, row.names = FALSE)
      
    }
    
  }
  
)
