### User interface file for calculating positive and negative predictive values.

library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Predictive values of a test"),
    sidebarPanel(
        h3('Input values as decimal fractions!'),
        p("This application calculates positive and negative predictive values 
          based on sensitivity and specificity of a (clinical) test and
          prevalnce of the disease (or pre-test probability of having the 
          disease of interest). Please input all the values as decimal fractions
          between 0 and 1. If you are ready, press \"Submit\" button "),
        h5("For the meaning of these values, please refer to ", 
           a("this Wiki page", 
             href="https://en.wikipedia.org/wiki/Positive_and_negative_predictive_values")),
        numericInput("sens", "Sensitivity (0.0-1.0)", 0.9, min = 0.0, max = 1.0),
        numericInput("spec", "Specificity (0.0-1.0)", 0.9, min = 0.0, max = 1.0),
        numericInput("prev", "Prevalence (or pre-test probability, 0.0-1.0)",
                     0.0001, min = 0.0, max = 1.0),
        submitButton('Submit')
    ),
    mainPanel(
        h3('Results'),
        h4("Positive predictive value is"),
        verbatimTextOutput("ppv"),
        h4("Negative predictive value is"),
        verbatimTextOutput("npv")
    )
))