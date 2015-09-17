### Server file for calculating positive and negative predictive values.

# functions for calculation of positive and negative predictive values
positivePV <- function(sens, spec, prev){
    sens * prev / (sens * prev + (1 - spec) * (1 - prev))
}

negativePV <- function(sens, spec, prev) {
    spec * (1- prev) / ((1 - sens) * prev + spec * (1 - prev)) 
}

library(shiny)
shinyServer(
    function(input, output) {
        output$ppv <- renderPrint({positivePV(input$sens, input$spec, input$prev)})
        output$npv <- renderPrint({negativePV(input$sens, input$spec, input$prev)})
    }
)