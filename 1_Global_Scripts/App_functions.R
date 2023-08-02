############################################################
############################################################
# Functions to use in the App

##############################
# New Datatable Function - used to avoid large quantities of duplicate code

# Renders data table for App data
Table_Render <- function(dataset,cb){
  
  output_data <- datatable(data = dataset,
                     escape = FALSE,
                     rownames = FALSE,
                     class="compact stripe hover",
                     selection = 'none',
                     options = list(
                       rowsGroup = list(0),
                       drawCallback =  cb,
                       columnDefs = list(
                         list(className = 'dt-center', targets = "_all")
                       ),
                       pageLength = 10,
                       dom = 'Bfrtip'
                     ))%>%
    spk_add_deps()
  
  return(output_data)
  
}

##############################
# New SelectBox Update Function - used to avoid large quantities of duplicate code

# Updates selectbox to include all variable names of App data apart from Serial
SelectBox_Update <- function(SDC_data){
  
  # Check if data is given ----
  req(SDC_data)
  
  dsnames <- names(SDC_data) # Extracts Column Names
  dsnames <- dsnames[!dsnames %in% c("Serial")]        # Remove Serial Number Option
  
  # Select column names as options for checkbox ----
  cb_options <- list()
  cb_options[ dsnames] <- dsnames
  
  return(cb_options)
  
}


##############################

############################################################
############################################################
