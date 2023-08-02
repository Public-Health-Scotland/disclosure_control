############################################################
############################################################
#Suppression Section

##############################
# This updates variable select options for suppression

# Primary Suppression Selectbox Update ----
observe({
  
  cb_options <- SelectBox_Update(App_data$values)
  
  # Update Selectbox ----
  updateSelectInput(session, "Disc_Variables_Pri_Supp",
                    label = "Choose Variables for Primary Suppression:",
                    choices = cb_options,
                    selected = "")
  
})

# Secondary Suppression Checkbox Update ----
observe({
  
  cb_options <- SelectBox_Update(App_data$values)
  
  
  # Update Selectbox ----
  updateSelectInput(session, "Disc_Variables_Secondary_Supp",
                    label = "Choose Variables for Secondary Suppression:",
                    choices = cb_options,
                    selected = "")
  
})


##############################
# This is for primary suppression of selected variables in App data with a button press

# Primary Suppression of Selected Data with button press ----
observeEvent(
  
  input$pri_sup, {
    
    # Ensure that variables are selected for primary suppression ----
    if (is.null(input$Disc_Variables_Pri_Supp)){
      
      # Error Notification indicating that variables should be selected
      shinyalert("There is no variables selected for primary suppression", "Please select variables.", type = "error")
      
      # Ensures that values are selected for primary suppression
      shiny::validate(
        need(!is.null(input$Disc_Variables_Pri_Supp), "There is no variables selected for primary suppression")
        
      )
      
    } else {
      
      # Notification indicating successful primary suppression
      shinyalert("Primary suppression successful.", type = "success")
      
    }
    
    
    # temp data Storage ----
    isolate({    
      
      temp_pri_supp <- App_data$values
      
    })
    
    # Primary Suppression ----
    App_data$values <- Stat_Primary_Supress(temp_pri_supp, input$Disc_Variables_Pri_Supp,input$Supp_Chars, input$Pri_Supp_Cond, input$zero_sup)
    
    # Clear temp data
    temp_pri_supp <- NULL
  }
  
)

##############################
# This is for primary & secondary suppression of selected variables in app data with a button press


# Primary & secondary suppression of selected data with button press ----
observeEvent(
  
  input$pri_sec_sup, {
    
    
    # Ensure that variables are selected for primary & secondary suppression ----
    if (is.null(input$Disc_Variables_Pri_Supp) | is.null(input$Disc_Variables_Secondary_Supp)){
      
      # Error Notification indicating that variables should be selected for primary & secondary suppression
      shinyalert("There is no variables selected for primary and/or secondary suppression.", "Please select variables.", type = "error")
      
      # Ensure that primary & secondary suppression variables are selected
      shiny::validate(
        need(!is.null(input$Disc_Variables_Pri_Supp), "There is no variables selected for primary suppression"),
        need(!is.null(input$Disc_Variables_Secondary_Supp), "There is no variables selected for secondary suppression")
      )
      
    } else {
      
      # Notification indicating successful primary & secondary suppression
      shinyalert("Primary & secondary suppression successful.", type = "success")
      
    }
    
    #Temp Data Storage ----
    isolate({    
      
      temp_supp <- App_data$values
      
    })
    
    # primary & secondary suppressed data ----
    App_data$values <- Stat_Secondary_Supress(temp_supp, input$Disc_Variables_Pri_Supp, input$Disc_Variables_Secondary_Supp, input$Supp_Chars, input$Pri_Supp_Cond, input$zero_sup)
    
    # Clear temp data
    temp_supp <- NULL
  }
  
)

##############################
# Visualize App data 

output$Suppress_data <- DT::renderDataTable({
  
  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')
  
  # Data visualisation is achieved via a function inside a external script.
  Suppressed_data <- Table_Render(App_data$values,cb)
  
})

##############################

############################################################
############################################################