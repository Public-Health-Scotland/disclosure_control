############################################################
############################################################
# Functions to perform statistical disclosure

##############################
# Useful Functions

# Not in function
`%notin%` <- Negate(`%in%`)

##############################
# Rounding Function
Stat_Round <- function(orig_data,var_choice,round_cond) {
  
  # Variables to be rounded ----
  orig_var <- orig_data[,var_choice]
  
  # Replace any NAs with a high value ----
  orig_var[is.na(orig_var)] <- 999999999
  
  # Ensures that replacement of NAs occurs
  orig_data[,var_choice] <- orig_var
  
  # NA value after rounding has occured - this is changed back to NA for the disclosed data
  rounding_NA_value <- round_any(999999999,round_cond,round)
  
  # Check if column headers are all whole numbers ----
  num_var_choice <- unlist(lapply(orig_data[var_choice], is.wholenumber))
  
  # Only select variables with whole numbers ----
  num_var_choice <- data.frame(num_var_choice) %>%
    filter(num_var_choice == TRUE) %>%
    rownames(num_var_choice)
  
  # Store Variables chosen for rounding
  x <- orig_data[,num_var_choice]
  
  # Copy of original data
  rounded_data <- orig_data 
  
  # Rounds chosen variables if provided variables are whole numbers
  rounded_data[,num_var_choice] <- lapply(x,
                                   function(x)
                                     if(is.wholenumber(x)) 
                                       round_any(x, round_cond, round)
                                   else x)
  
  # Add NAs back to data ----
  rounded_data[,var_choice][rounded_data[,var_choice] == rounding_NA_value] <- NA
  
  # Rounded Data
  return(rounded_data)
  
}

##############################
# Cell Swapping Function

Stat_Swap <- function(orig_data,var_choice,swap_cond) {
  
  
  # Variables to be processed ----
  orig_var <- orig_data[,var_choice]
  
  # Replace any NAs with high value - this is changed back to NA for the disclosed data
  orig_var[is.na(orig_var)] <- 999999999
  
  # Ensures that replacement of NAs occurs
  orig_data[,var_choice] <- orig_var
  
  # Copy of original data to process ----
  swapped_data <- orig_data 
  
  # Check if column headers are all whole numbers ----
  num_var_choice <- unlist(lapply(orig_data[var_choice], is.wholenumber))
  
  # Only select variables with whole numbers ----
  num_var_choice <- data.frame(num_var_choice) %>%
    filter(num_var_choice == TRUE) %>%
    rownames(num_var_choice)
  
  # Get number of columns containing whole numbers ----
  var_swap_len <- length(num_var_choice) 
  
  # For Loop to process each numeric column ----
  for (i in 1:var_swap_len) {
    
    # checks if variable value is less than or equal to the swapping condition 
    chk <- swapped_data[,num_var_choice[i]] <= swap_cond 
    chk <- which(chk == TRUE)
    ind_numbers <- length(chk) # For each column, calculate how many values must be swapped
    
    # If statement for columns where values are swapped, else statements if no value in a column needs to be swapped 
    if (length(ind_numbers) > 0) {
      
      # Allows for indices position to be swapped ----
      swapindices <- sample(x = c(chk),ind_numbers)
      newindices <- sample(swapindices,ind_numbers)
      
      # If statement when only one value is below swapping condition to ensure no swapping occurs
      if(length(swapindices) > 1){
        
        # Performs Swapping ----
        swapped_data[swapindices,num_var_choice[i]] <- swapped_data[newindices,num_var_choice[i]]
        # Clear Indices Values
        rm(swapindices,newindices)
        
      } else {
        
        # Clear Indices Values
        rm(swapindices,newindices)
        # No Cell Swapping Occurs ----
        swapped_data <- swapped_data 
        
      }
      
      
    } else {
      
      # No Cell Swapping Occurs ----
      swapped_data <- swapped_data 
    }
  }
  
  # Add NAs back to data ----
  swapped_data[,var_choice][swapped_data[,var_choice] == 999999999] <- NA
  
  # Swapped Data ----
  return(swapped_data)
  
}

##############################
# Primary Suppression Function

Stat_Primary_Supress <- function(orig_data,var_choice,char_supp,sup_cond,zero) {
  
  
  # Variables to be processed ----
  orig_var <- orig_data[,var_choice]
  
  # Replace any NAs with high value - this is changed back to NA for the disclosed data
  orig_var[is.na(orig_var)] <- 999999999
  
  # Ensures that replacement of NAs occurs
  orig_data[,var_choice] <- orig_var
  
  # Check if column headers are all whole numbers ----
  num_var_choice <- unlist(lapply(orig_data[var_choice], is.wholenumber))
  
  # Only select variables with whole numbers ----
  num_var_choice <- data.frame(num_var_choice) %>%
    filter(num_var_choice == TRUE) %>%
    rownames(num_var_choice)
  
  # Store Variables choosen for Primary Suppression ----
  x <- orig_data[,num_var_choice]
  
  # Copy of original data ----
  primary_data <- orig_data 
  
  # If Statement - Leave zero unsuppress if checkbox is ticked - otherwise suppress zeros
  if (zero == TRUE){
    
    # Applies Primary Suppression on all numbers below suppression condition apart from zero  ----
    primary_data[,num_var_choice] <- lapply(x,
                                     function(x)
                                       if(is.wholenumber(x)) 
                                         replace(x, x <= sup_cond & x > 0, char_supp)
                                     else x)
  } else {
    
    # Applies Primary Suppression on all numbers below suppression condition ----
    primary_data[,num_var_choice] <- lapply(x,
                                     function(x)
                                       if(is.wholenumber(x)) 
                                         replace(x, x <= sup_cond, char_supp)
                                     else x)
  }
  
  # Add NAs back to data ----
  primary_data[,var_choice][primary_data[,var_choice] == "999999999"] <- NA
  
  # Primary Suppressed Data ----
  return(primary_data)
  
}

##############################
# Primary and Secondary Suppression Function

Stat_Secondary_Supress <- function(orig_data, pri_var_choice, sec_var_choice, char_supp, sup_cond, zero) {
  
  # Disable warning messages caused by function - ensures that the function runs smoothly 
  options (warn = - 1) 
  
  # Check if Serial Number is in data - remove if it is
  if ("Serial" %notin% colnames(orig_data)){
    
    orig_data <- orig_data
    
    # Ensure Serial values are NULL if no Serial number provided - this is required for later in this function
    Serial_values <- NULL
    
    # Remove Serial Number for Primary & Secondary Suppression - this gets re-added later
  } else {
    
    # Store removed Serial number
    Serial_values <- orig_data %>%
      select(Serial)
    
    # Remove Serial number
    orig_data <- orig_data %>%
      select(-Serial)
  }
  
  
  ############# Primary Suppresion performed first ----
  
  # Variables to be processed ----
  orig_var <- orig_data[,pri_var_choice]
  
  # Replace any NAs with high value - this is changed back to NA for the disclosed data
  orig_var[is.na(orig_var)] <- 999999999
  
  # Ensures that replacement of NAs occurs
  orig_data[,pri_var_choice] <- orig_var
  
  # Check if column headers are all whole numbers for primary variables 
  pri_var_choice <- unlist(lapply(orig_data[pri_var_choice], is.wholenumber))
  
  # Only select variables with whole numbers ----
  pri_var_choice <- data.frame(pri_var_choice) %>%
    filter(pri_var_choice == TRUE) %>%
    rownames(pri_var_choice)
  
  # Store Variables choosen for Primary Suppression ----
  x <- orig_data[,pri_var_choice]
  
  # Copy of original data ----
  primary_data <- orig_data 
  
  # Primary Suppression - If Statement which leaves zero unsuppress if checkbox is ticked - otherwise suppress zeros
  if (zero == TRUE){
    
    # Applies Primary Suppression on all numbers below suppression condition apart from zero  ----
    primary_data[,pri_var_choice] <- lapply(x,
                                         function(x)
                                           if(is.wholenumber(x)) 
                                             replace(x, x <= sup_cond & x > 0, char_supp)
                                         else x)
  } else {
    
    # Applies Primary Suppression on all numbers below suppression condition ----
    primary_data[,pri_var_choice] <- lapply(x,
                                         function(x)
                                           if(is.wholenumber(x)) 
                                             replace(x, x <= sup_cond, char_supp)
                                         else x)
  }
  
  # Add NAs back to data ----
  primary_data[,pri_var_choice][primary_data[,pri_var_choice] == "999999999"] <- NA
  
  
  ############# Secondary Suppression ----
  
  # Variables to be processed ----
  orig_var_sec <- primary_data[,sec_var_choice]
  
  # Replace any NAs with high value - this is changed back to NA for the disclosed data
  orig_var_sec[is.na(orig_var_sec)] <- 999999999
  
  # Ensures that replacement of NAs occurs
  primary_data[,sec_var_choice] <- orig_var_sec
  
  # Check if column headers are all whole numbers for secondary variables 
  sec_var_choice <- unlist(lapply(primary_data[sec_var_choice], is.wholenumber))
  
  # Only select variables with whole numbers ----
  sec_var_choice <- data.frame(sec_var_choice) %>%
    filter(sec_var_choice == TRUE) %>%
    rownames(sec_var_choice)
  
  # Store Variables choosen for Secondary Suppression ----
  x <- primary_data[,sec_var_choice]
  
  #Copy of primary suppressed data ----
  init_secondary_data <- primary_data
  
  # Initial Secondary Suppression - Primary Suppression is done first before the remaining values are suppressed
  # Applies Secondary Suppression on all numbers below suppression condition apart from zero  ----
  if (zero == TRUE){
    
    # Applies Initial Secondary Suppression on all numbers below suppression condition apart from zero  ----
    init_secondary_data[,sec_var_choice] <- lapply(x,
                                             function(x)
                                               if(is.wholenumber(x)) 
                                                 replace(x, x <= sup_cond & x > 0, char_supp)
                                             else x)
  } else {
    
    # Applies Initial Secondary Suppression on all numbers below suppression condition ----
    init_secondary_data[,sec_var_choice] <- lapply(x,
                                             function(x)
                                               if(is.wholenumber(x)) 
                                                 replace(x, x <= sup_cond, char_supp)
                                             else x)
  }
  
  #Copy of initial secondary suppressed data ----
  secondary_data <- init_secondary_data
  
  # # Store Variables choosen for Secondary Suppression ----
  x <- secondary_data[,sec_var_choice]
  
  # Count number of suppressions in each row ----
  secondary_data$SDC_count <- apply(x, 1, function(x) length(which(x==char_supp)))
  
  # Replace zeros with identifier to avoid supression
  secondary_data[,sec_var_choice] <- lapply(x,
                                           function(x)
                                             if(is.character(x)) 
                                               replace(x, x == "0", "zero_rep")
                                           else x)
  
  #Copy of initial secondary suppressed data ----
  x <- secondary_data[,sec_var_choice]
  
  # Replace high NA numbers with identifier to avoid supression
  secondary_data[,sec_var_choice] <- lapply(x,
                                           function(x)
                                             if(is.character(x)) 
                                               replace(x, x == "999999999", "missing_value")
                                           else x)
  
  # # Store Variables choosen for Secondary Suppression ----
  x <- secondary_data[,sec_var_choice]
  
  
  # Extracts number to be suppressed - this occurs if there is only one suppressed secondary value ----
  secondary_data$min_value_sec <- ifelse(secondary_data$SDC_count == 1, apply(x, 1, function(x) min(as.numeric(x),na.rm = TRUE)),
                                        NA)
  
  # If Else Loop to ensure that process is only done if secondary variables are available
  
  if (length(sec_var_choice) > 0) {
    
    # For loop which performs Secondary Suppression ----
    for (i in 1:length(sec_var_choice)) {
      
      # Suppress next lowest value in the secondary varible column for each row if only one value is suppressed
      secondary_data[[sec_var_choice[i]]] <- ifelse(is.na(secondary_data$min_value_sec),secondary_data[[sec_var_choice[i]]],
                                                   ifelse(secondary_data[[sec_var_choice[i]]] == secondary_data$min_value_sec, char_supp ,secondary_data[[sec_var_choice[i]]]))  
      
    }
    
    # No further suppression
  } else {
    
    secondary_data <- secondary_data
    
  }
  
  #############
  
  # Store Variables choosen for Secondary Suppression ----
  x <- secondary_data[,sec_var_choice]
  
  # Add zeros back to dataset
  secondary_data[,sec_var_choice] <- lapply(x,
                                           function(x)
                                             if(is.character(x)) 
                                               replace(x, x == "missing_value", NA)
                                           else x)
  
  # Store Variables choosen for Secondary Suppression ----
  x <- secondary_data[,sec_var_choice]
  
  # Add NAs back to dataaset
  secondary_data[,sec_var_choice] <- lapply(x,
                                           function(x)
                                             if(is.character(x)) 
                                               replace(x, x == "zero_rep", "0")
                                           else x)
  
  # Re-add Serial number if removed by function
  if (!is.null(Serial_values)) {
    
    # Ensures that Serial number is 1st column as previously
    secondary_data <- secondary_data %>%
      cbind(Serial_values) %>%
      select(Serial,everything())
    
    
  } else {
    
    # No changes to data
    secondary_data <- secondary_data
    
  }
  
  # Processed Data - removed variables added for the purpose of secondary suppression
  secondary_data <- secondary_data %>%
    select(-SDC_count,-min_value_sec)
  
  # Secondary Suppressed Data
  return(secondary_data)
  
}

##############################


############################################################
############################################################
