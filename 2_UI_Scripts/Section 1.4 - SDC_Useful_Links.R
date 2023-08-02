############################################################
############################################################

tabPanel("Useful Links for SDC",
         fluidRow(
           
           # Main panel for displaying outputs ----
           # Stores Text for Help Page ----
           mainPanel(
             
             # Section Title
             h2("Useful Public Health Scotland Links"),
             
             p("For further information please see", a(href = "http://spark.publichealthscotland.org/corporate-guidance/statistical-governance/statistical-disclosure-control/",
                                                       "Statistical Disclosure Control - Statistical Governance - Corporate guidance - The Spark (publichealthscotland.org)"), 
               "and always complete your ", a(href = "http://spark.publichealthscotland.org/downloads/disclosure-risk-assessment-form/", 
                                              "Disclosure risk assessment form - Downloads - The Spark (publichealthscotland.org)"), "when considering disclosure control.")
             
             )
           
           )
         
         )

############################################################
############################################################