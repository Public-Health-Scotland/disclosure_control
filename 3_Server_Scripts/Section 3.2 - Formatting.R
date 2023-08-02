############################################################
############################################################
# Data Formatting Section

##############################
# This is for removing the Serial number with a button press

Serial_Removed <- reactiveValues(data=NULL)

# Remove Serial Number with button press ----
observeEvent(
  
  input$rem_ser, {
    
    # Ensure that Serial number is in data
    if ("Serial" %notin% colnames(App_data$values)){
      
      # Error Notification saying that no Serial Number needs to be removed
      shinyalert("No serial number attached to data.", "No serial number to remove.", type = "error")
      
      # Ensures data has Serial Number
      shiny::validate(
        need(App_data$values$Serial, "There is no Serial Number")
      )
      
    } else {
      
      # Notification saying that Serial Number has been removed
      shinyalert("Serial number removed", type = "success")
      
    }
    
    #Temp Storage of App data
    isolate({    
      
      temp <- App_data$values
      
    })
    
    # Store Serial Numbers
    Serial_Removed$data <- temp %>%
      select(Serial)
    
    
    # Remove Serial Number
    App_data$values <- temp %>%
      select(-Serial)
    
    #Clear Temp data
    temp <- NULL
  })

##############################
# This is for re-adding the Serial Number with a button press ----

observeEvent(
  
  # Re-add Serial Number with button press ----
  input$re_add_ser, {
    
    # Ensure that Serial number has been removed
    if (is.null(Serial_Removed$data)){
      
      #Error Notification indicate that Serial Number has not been removed
      shinyalert("Serial number has not been removed.", type = "error")
      
      # Ensures that Serial number has been removed
      shiny::validate(
        need(Serial_Removed$data, "There is no Serial Number that has been removed"
        ))
      
      # Serial Number has been removed
    } else {}
    
    # Ensure that App data has the same number of rows as the Serial Number
    if (nrow(App_data$values) != nrow(Serial_Removed$data)){
      
      # Error Notification indicating that rows in App data doesn't match number of Serial numbers.
      shinyalert("Number of observations in datasets different to the number of removed serial numbers.", 
                 "Please ensure that numbers of observation in dataset is the same as number of serial numbers.", type = "error")
      
      # Checks that number of rows in datasets equals the number of serial numbers
      shiny::validate(
        need(nrow(App_data$values) == nrow(Serial_Removed$data), "The stored serial numbers have a different number of rows to data frame"
        ))
      
    } else {
      
      #Notification indicating that Serial number has been re-added
      shinyalert("Serial number successfully re-added.", type = "success")
      
    }
    
    # Re-add Serial number
    App_data$values <- App_data$values %>%
      cbind(Serial_Removed$data) %>%
      select(Serial,everything())
    
    # Clear Stored Serial Number
    Serial_Removed$data <- NULL
    
  })

##############################
# This updates key and value variable select box for data transformation

# Allows select input Box to be updated with variable names for key variable
observe({
  
  # Stores all variable names in App data apart from Serial - this function is in a external script
  cb_options <- SelectBox_Update(App_data$values)
  
  # Update Selectbox ----
  updateSelectInput(session, "keyvariableId",
                    label = "Choose Key Variable",
                    choices = cb_options,
                    selected = "")
  
})


# Allows select input Box to be updated with variable names for value variable
observe({
  
  # Update Selectbox ----
  cb_options <- SelectBox_Update(App_data$values)
  
  # Update Selectbox ----
  updateSelectInput(session, "valuevariableId",
                    label = "Choose Value Variable",
                    choices = cb_options,
                    selected = "")
  
})

##############################
# This stores variables prior to data transformation

# Store key value options
key_value_options <- reactiveValues(data=NULL)

# Store key value name
key_value_header <- reactiveValues(header=NULL)

# Store variable value name
variable_value_header <- reactiveValues(header=NULL)

# Store Column Names in original order
column_values <- reactiveValues(order=NULL)

##############################
# This transforms long data to wide data with button press ----

observeEvent(
  
  # Transform with button press
  input$long_wide_trans, {
    
    # Ensure that key & value variable is entered ----
    if (input$keyvariableId == "" & input$valuevariableId == ""){
      
      # Error Notification indicating no key and value variable
      shinyalert("There is no key or value variable selected", "Please select key variable and value variable.", type = "error")
      
      # Ensure that key & value variable is entered
      shiny::validate(
        need(input$keyvariableId , "There is no key variable"),
        need(input$valuevariableId , "There is no value variable")
        
      )
      
      # Ensure that value variable is entered ----
    } else if (input$keyvariableId != "" & input$valuevariableId == ""){
      
      # Error Notification indicating no value variable
      shinyalert("There is no value variable selected", "Please select value variable.", type = "error")
      
      # Ensure that value variable is entered
      shiny::validate(
        need(input$valuevariableId , "There is no value variable")
        
      )
      
      # Ensure that key variable is entered ----
    } else if (input$keyvariableId == "" & input$valuevariableId != "") {
      
      # Error Notification indicating no key variable
      shinyalert("There is no key variable selected", "Please select key variable.", type = "error")
      
      # Ensure that key variable is entered
      shiny::validate(
        need(input$keyvariableId , "There is no key variable")
        
      )
      
      # All variables entered
    } else {
      
      
    }
    
    
    #Temp Data Storage ----
    isolate({    
      
      temp_format <- App_data$values
      
    })
    
    
    # Key Variable
    key_value_header$header <- input$keyvariableId
    
    #Value Variable
    variable_value_header$header <- input$valuevariableId
    
    # Key Value Options
    key_value_options$data <- unique(temp_format[,input$keyvariableId]) %>%
      pull()
    
    # Column Header - Used to put data frame columns back to original order for transforming back to long data
    column_values$order <- colnames(temp_format)
      
    # Transforms long to wide - generates error notification if transformation is unsuccessful
    tryCatch(
      
      # Checks for error - if no error, this then performs the transformation
      expr = {App_data$values <- temp_format %>%
        spread(input$keyvariableId,input$valuevariableId)
      
      shinyalert("Long to wide transformation successful", type = "success")},
      
      error = function(e)
        shinyalert("Transformation Unsuccessful. Please reset data.",type = "error")
      
    )
    
    # Clear Temp data
    temp_format <- NULL
    
  })

##############################
# This transforms wide data back to long data with button press ----

observeEvent(
  
  # Transform with button press
  input$wide_long_trans, {
    
    # Ensures that long data has been transformed to wide data via the App ----
    if (is.null(key_value_header$header) & is.null(variable_value_header$header)){
      
      # Error notification indicates that long data has not been transformed
      shinyalert("Long data has not been transformed to wide data", "To transform back to wide data, please press
                 the long to wide transform button", type = "error")
      
      # Ensure that long to wide transformation has occured
      shiny::validate(
        need(key_value_header$header, "There is no key variable"),
        need(variable_value_header$header, "There is no value variable")
        
      )
      
      
      # Long data has been transformed to wide - re-transform to long data can occur
    } else {
      
      
    }
    
    
    #Temp Data Storage ----
    isolate({    
      
      temp_wide_format <- App_data$values
      
    })
    
    # Convert to character so that these values become options under the key value column header
    key_value_options$data <- as.character(key_value_options$data)
    
    #Convert wide data back to long data ----
    
    # Transforms wide to long - generates error notification if transformation is unsuccessful
    # For data transform back to long, column headers are re-ordered to the same order as before.
    tryCatch(
      
      # Checks for error - if no error, this then performs the transformation
      expr = {App_data$values <- temp_wide_format %>%
        gather_(key_value_header$header,variable_value_header$header,key_value_options$data) %>%
        select(all_of(column_values$order))
      
      shinyalert("Wide to long transform successful", type = "success")},
      error = function(e)
        shinyalert("Transformation Unsuccessful. Please reset data.",type = "error"))
    
    
    
    
    # Clear options for wide to long transform
    key_value_header$header <- NULL
    variable_value_header$header <- NULL
    key_value_options$data <- NULL
    column_values$order <- NULL
    temp_wide_format <- NULL
    
  })

##############################
# Visualize App data 

output$format_data <- DT::renderDataTable({
  
  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')
  
  # Data visualisation is achieved via a function inside a external script.
  Format_Data <- Table_Render(App_data$values,cb)
  
})

##############################

############################################################
############################################################