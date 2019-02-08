#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#




# MY CODE
 
# pressure -Vapor Pressure of Mercury as a Function of Temperature

library(shiny)


# EXAMPLE BELOW

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Vapor Pressure of Mercury as a Function of Temperature"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       h4("Select the temperature and see the predicted pressure."),
       sliderInput("TempSlider", "Select Temp:", 0, 360,0)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       h3("Predicted Pressure:"),
       h2(textOutput("PredPressure")),
       plotOutput("plot")
    )
  )
))
