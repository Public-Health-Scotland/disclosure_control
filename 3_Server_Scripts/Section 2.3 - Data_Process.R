############################################################
############################################################
#Data Process Section

##############################
# Allows Check Box to be updated with variable names from App data

observe({
  
  # Stores all variable names in App data apart from Serial - this function is in a external script
  cb_options <- SelectBox_Update(App_data$values)
  
  # Update Selectbox ----
  updateSelectInput(session, "Variable_Convert",
                    label = "Choose Variables to Convert:",
                    choices = cb_options,
                    selected = "")
  
})

##############################
# This converts character variable to a numeric variable with a button press

observeEvent(
  
  input$char_to_num, {
    
    # Ensures that the input data is available
    shiny::validate(
      need(App_data$values, "There is no Input Data")
    )
    
    # Ensures that input variable is selected 
    if (input$Variable_Convert == ""){
      
      # Variable Selection Notification error 
      shinyalert("There is no input variable selected", "Please select input variable.", type = "error")
      
      # Variable Validation 
      shiny::validate(
        need(input$Variable_Convert, "No Variables are selected")
      )
      
    } else {
      
      # Variable Convertion Notification success
      shinyalert("Variable converted to a numeric format", type = "success")
      
      
    }
    
    #Temp Data Storage of App data
    isolate({    
      
      temp_char <- App_data$values
      
    })
    
    # Convert variable and clear temp data
    App_data$values[[input$Variable_Convert]] <- as.numeric(temp_char[[input$Variable_Convert]])
    temp_char <- NULL
    
    
  }
  
)

##############################
# This converts numeric variable to a character variable with a button press

observeEvent(
  
  input$num_to_char, {
    
    # Ensure that the input data is available
    shiny::validate(
      need(App_data$values, "There is no Input Data")
    )
    
    # Ensure that input variable is selected
    if (input$Variable_Convert == ""){
      
      # Variable Selection Notification error 
      shinyalert("There is no input variable selected", "Please select input variable.", type = "error")
      
      # Variable Validation 
      shiny::validate(
        need(input$Variable_Convert, "No Variables are selected")
      )
      
    } else {
      
      # Variable Convertion Notification success
      shinyalert("Variable converted to a character format", type = "success")
      
      
    }
    
    #Temp Data Storage ----
    isolate({
      
      temp_num <- App_data$values
      
    })
    
    
    # Convert variable and clear temp data
    App_data$values[[input$Variable_Convert]] <- as.character(temp_num[[input$Variable_Convert]])
    temp_num <- NULL
    
  }
  
)


##############################
# Visualize App data 


output$convert_data <- DT::renderDataTable({
  
  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')
  
  # Data visualisation is achieved via a function inside a external script.
  convert_data <- Table_Render(App_data$values,cb)
  
})

##############################

############################################################
############################################################
