#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  model <- lm(mpg ~ hp, data = mtcars)
  
  modelpred <- reactive({ ##'the calculations are from the user interface that's way you need the reactive statement
    hp_input <- input$SliderHP
    predict(model, newdata = data.frame(hp = hp_input)) ##' Is going to predict based on the new value on the interface
  })
   
  output$hp_plot <- renderPlot({ # has to have the same name as the user interface otherwise is not going to work
  hp_input <- input$SliderHP
  scatterplot(mpg ~ hp, data = mtcars, xlab = "Horse Power", ylab = "Miles per Gallon")
  points(hp_input, modelpred(), col = "red", pch = 16, cex = 1)  
  })
  output$pred <- renderText({
    modelpred()
  })
})
