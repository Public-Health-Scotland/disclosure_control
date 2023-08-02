############################################################
############################################################
# Download Data

##############################
# Visualize data before download ----
output$Final_data <- DT::renderDataTable({
  
  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')
  
  final <- Table_Render(App_data$values,cb)
  
})
##############################
# Download and Reset Data in App

# Download and reset of uploaded data
source(glue("3_Server_Scripts/Section 5.1.1 - Download.R"),  local = TRUE)$value

# Download and reset of training data
source(glue("3_Server_Scripts/Section 5.1.2 - Download.R"),  local = TRUE)$value

##############################

##############################

############################################################
############################################################
