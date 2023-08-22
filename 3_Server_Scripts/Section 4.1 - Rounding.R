############################################################
############################################################
#Rounding Section

##############################
# This updates variable select options for rounding

observe({
  
  # Stores all variable names in App data apart from Serial - this function is in a external script
  cb_options <- SelectBox_Update(App_data$values)
  
  
  # Update Selectbox ----
  updateSelectInput(session, "Disc_Variables_Round",
                    label = "Choose Variables to Round:",
                    choices = cb_options,
                    selected = "")
  
})


##############################
# This is for rounded selected variables in App data with a button press

# Rounding Selected Data with button press ----
observeEvent(
  
  input$rounding, {
    
    # Ensure that variables are selected for rounding----
    if (is.null(input$Disc_Variables_Round)){
      
      # Error Notification indicating that variables should be selected
      shinyalert("There is no input variables selected", "Please select input variables.", type = "error")
      
      # Ensure that values are selected for rounding
      shiny::validate(
        need(!is.null(input$Disc_Variables_Round), "There is no variables selected for rounding")
        
      )
      
    } else {
      
      # Notification indicating successful rounding
      shinyalert("Data successfully rounded.", type = "success")
      
    }
    
    # Temp Data Storage ----
    isolate({    
      
      temp_round <- App_data$values
      
    })
    
    # Round Data ----
    App_data$values <- Stat_Round(temp_round, input$Disc_Variables_Round,input$Round_Cond)
    
    # Clear temp data
    temp_round <- NULL
    
  }
  
)

##############################
# Visualize App data 

output$Rounded_data <- DT::renderDataTable({
  
  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')
  
  # Data visualisation is achieved via a function inside a external script.
  Rounded_Data <- Table_Render(App_data$values,cb)
  
})

##############################

############################################################
############################################################