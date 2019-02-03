#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that calculates denomination
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Denomination in Pesos"),
  
  # Sidebar with a text input for number of Denomination 
  sidebarLayout(
    sidebarPanel(
      h4("Value in PHP should not",br(), "be more than 5,000"),
      numericInput("den",label= h4("Enter total number of Currency:"),min=1, max=5000,0),
      br(),
      actionButton("calc",label="Calculate Denomination")),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
              tabPanel(p(h4("Denomination")),
                      strong(textOutput("currentDenom")),
                      br(),
                      p(h4("The breakdown is as follows: ")),
                      br(),
                           img(src = "1000_Philippine_Peso_Bill_Obverse_2018.png", height = 50, width = 150),
                           HTML('&emsp;'),
                      textOutput("onet"),
                      br(), 
                           img(src = "500-Peso_New_Generation_Currency_Series_2016_(Obverse).png", height = 50, width = 150),
                           HTML('&emsp;'),
                      textOutput("fiveh"),
                      br(),
                           img(src = "200-Peso_New_Generation_Currency_Series_2017_(Obverse).png", height = 50, width = 150),
                           HTML('&emsp;'),
                      textOutput("twoh"),
                      br(),
                           img(src = "100-Peso_New_Generation_Currency_Series_2015_(Obverse).png", height = 50, width = 150),
                           HTML('&emsp;'),
                      textOutput("oneh"),
                      br(),
                           img(src = "50-Peso_New_Generation_Currency_Series_(Obverse).png", height = 50, width = 150),
                           HTML('&emsp;'),
                      textOutput("fif"),
                      br(),
                           img(src = "20-Peso_New_Generation_Currency_Series_(Obverse).png", height = 50, width = 150),
                           HTML('&emsp;'),
                      textOutput("twen"),
                      br(),
                           br(),HTML('&emsp;'),
                           img(src = "100px-2011phil10pisoobv.png", height = 50, width = 100),
                           br(),HTML('&emsp;'),
                      textOutput("ten"),
                           br(),HTML('&emsp;'),
                           img(src = "800px-2005phil05pisoobv.png", height = 50, width = 100),
                           br(),HTML('&emsp;'),
                      textOutput("five"),
                           br(),HTML('&emsp;'),
                           img(src = "800px-Philpeso2010obv.png", height = 50, width = 100),
                           HTML('&emsp;'),
                      textOutput("one")
                      ),
                  tabPanel("Documentation",br(), 
                                    "This Denomination is used for",strong("Currency Conversion"),br(),
                                    "The goal is for showing bank notes conversion in PHP (Philippine Peso)", br(),
                                    "This will be use for enthusiasts and curious about the bank and coin conversion in Philippines",br(),
                                    "To use this, enter the value of currency you want to compute",br(),
                                    "Click", strong("Calculate Denomination"), "button",br(),
                           "Once Calculate Denomination button is selected, you can see the denomination on the", strong("Denomination tab"))
      )
    )
    
  )
))
