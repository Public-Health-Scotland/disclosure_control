### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### Section 1.4 - SDC_Useful_Links.R Script ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### Setup SDC Links Sub-Tab   ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
# 1. Stores Text for Useful SDC Links ----
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

tabPanel("Useful Links for SDC",
         fluidRow(
           
           ### ### ### ### ### ### ### ### ### ### ### ### ###
           ## 1. Main panel for displaying all text ----
           ### ### ### ### ### ### ### ### ### ### ### ### ###
           
           mainPanel(
             
             ### ### ### ### ### ### ###
             ### 1. Main Page Title ----
             ### ### ### ### ### ### ###
             
             h1("Useful Public Health Scotland Links"),
             
             ### ### ### ### ### ### ###
             ### 2. SDC Link Info ----
             ### ### ### ### ### ### ###
             
             # Paragraph text
             p("For further information please see", a(href = "http://spark.publichealthscotland.org/corporate-guidance/statistical-governance/statistical-disclosure-control/",
                                                       "Statistical Disclosure Control - Statistical Governance - Corporate guidance - The Spark (publichealthscotland.org)"), 
               "and always complete your ", a(href = "http://spark.publichealthscotland.org/downloads/disclosure-risk-assessment-form/", 
                                              "Disclosure risk assessment form - Downloads - The Spark (publichealthscotland.org)"), "when considering disclosure control.")
             
             )
           
           )
         
         )

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### End of Sub- Script  ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###