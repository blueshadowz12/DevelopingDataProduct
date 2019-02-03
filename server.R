#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


# Define server logic required to get denomination
shinyServer(function(input, output) {
   
  # Create a reactiveValues object where we can track some extra elements
  # reactively.
  
  #Show inputted denomination
  output$currentDenom<- renderText({
    
    input$calc
    paste("Current Denomination is : ",isolate(input$den))
    
  })
  #Initialize reactive values
  calcdenom <- reactiveValues()
  
  #Calculations

  observe({
    input$calc
    calcdenom$calculate_onet <- isolate({
      
      (input$den %/% 1000)
    })
  
    calcdenom$calculate_fiveh <- isolate({
      
      ((input$den %% 1000) %/% 500)
    })
    
    calcdenom$calculate_twoh <- isolate({
      
      (((input$den %% 1000) %% 500) %/%200)
    })
    
    calcdenom$calculate_oneh <- isolate({
      
      ((((input$den %% 1000) %% 500) %%200) %/%100)
    })
    
    calcdenom$calculate_fif <- isolate({
      
      (((((input$den %% 1000) %% 500) %%200) %%100) %/% 50)
    })
    
    calcdenom$calculate_twen <- isolate({
      
      ((((((input$den %% 1000) %% 500) %%200) %%100) %% 50) %/% 20)
    })
    
    calcdenom$calculate_ten <- isolate({
      
      (((((((input$den %% 1000) %% 500) %%200) %%100) %% 50) %%20 ) %/% 10)
    })
    
    
    calcdenom$calculate_five <- isolate({
      
      ((((((((input$den %% 1000) %% 500) %%200) %%100) %% 50) %%20 ) %% 10) %/%5)
    })
    
    calcdenom$calculate_one <- isolate({
      
      (((((((((input$den %% 1000) %% 500) %%200) %%100) %% 50) %%20 ) %% 10) %%5) %/% 1)
    })
    
    
  })
  
  #Printing the output data
  
    output$onet<- renderText({
      paste("1000 PHP bill: ",calcdenom$calculate_onet)
    })
  
    output$fiveh<- renderText({
      paste("500 PHP bill: ",calcdenom$calculate_fiveh)
    })

    output$twoh<- renderText({
      paste("200 PHP bill: ",calcdenom$calculate_twoh)
    })
  
    output$oneh<- renderText({
      paste("100 PHP bill: ",calcdenom$calculate_oneh)
    })
    
    output$fif <- renderText(({
      paste("50 PHP bill: ",calcdenom$calculate_fif)
      
    }))
    
    output$twen <- renderText(({
      paste("20 PHP bill: ",calcdenom$calculate_twen)
      
    }))
    output$ten <- renderText(({
      paste("10 coin/s: ",calcdenom$calculate_ten)
      
    }))
    
    output$five <- renderText(({
      paste("5 coin/s: ",calcdenom$calculate_five)
      
    }))

    output$one <- renderText(({
      paste("1 coin/s: ",calcdenom$calculate_one)
      
    }))
})