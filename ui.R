#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict MPG from Horse Power"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel("Select horse power",
       sliderInput("SliderHP",
                   "Horse Power:",
                   min = 60,
                   max = 200,
                   value = 60)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("hp_plot"),
       h3("Predicted Miles per gallon from model"),
       textOutput("pred")
    )
  )
))
