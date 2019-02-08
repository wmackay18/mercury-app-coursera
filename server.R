#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)

# mercury <- pressure

# Define server logic
shinyServer(function(input, output) {
  model <- lm(pressure ~ poly(temperature, 10, raw = TRUE), data = pressure)  
 
  modelPred <- reactive({
          TempInput <- input$TempSlider
          predict(model, newdata = data.frame(temperature = TempInput))
          
  })
  
  output$plot <- renderPlot({
          TempInput <- input$TempSlider
          
          plot(pressure$temperature, pressure$pressure, xlab = "Temperature", ylab = "Pressure", bty = "n", pch = 16)
          points(TempInput, modelPred(), col = "red", lwd = 2, pch = 7)
  })
  
  output$PredPressure <- renderText({modelPred()})
})
