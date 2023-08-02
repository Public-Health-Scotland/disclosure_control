############################################################
############################################################
#PHS Branding

# Folder with all PHS branding details
fp_script <- glue("www/")    

#sidebar width
sb_width <- c(2,10) 

# Encoding for phs logo
b64 <- base64enc::dataURI(file=glue("{fp_script}phs_logo.png")) 

############################################################
############################################################
