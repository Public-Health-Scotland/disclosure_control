############################################################
############################################################
#Swapping Section

##############################
# This updates variable select options for swapping

observe({
  
  # Stores all variable names in App data apart from Serial - this function is in a external script
  cb_options <- SelectBox_Update(App_data$values)
  
  # Update Selectbox ----
  updateSelectInput(session, "Disc_Variables_Swap",
                    label = "Choose Variables to Swap:",
                    choices = cb_options,
                    selected = "")
  
})

##############################
# This is for swapping selected variables in App data with a button press

# Swap selected Data with button press ----
observeEvent(
  
  input$swapping, {
    
    # Ensure that variables are selected for swapping----
    if (is.null(input$Disc_Variables_Swap)){
      
      # Error Notification indicating that variables should be selected
      shinyalert("There is no input variables selected", "Please select input variables.", type = "error")
      
      # Ensures that values are selected for swapping
      shiny::validate(
        need(!is.null(input$Disc_Variables_Swap), "There is no variables selected for record swapping")
        
      )
      
    } else {
      
      # Notification indicating successful swapping
      shinyalert("Record Swapping successful.", type = "success")
      
    }
    
    
    
    #Temp Data Storage ----
    isolate({    
      
      temp_swap <- App_data$values
      
    })
    
    #Swap Data ----
    App_data$values <- Stat_Swap(temp_swap, input$Disc_Variables_Swap, input$Swap_Cond)
    
    # Clear temp data
    temp_swap <- NULL
    
  }
  
)

##############################
# Visualize App data 

output$Swapped_data <- DT::renderDataTable({
  
  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')
  
  # Data visualisation is achieved via a function inside a external script.
  Swapped_Data <- Table_Render(App_data$values,cb)
  
})

##############################

############################################################
############################################################
