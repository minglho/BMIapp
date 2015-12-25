# This is the server logic for a Shiny web application.

library(shiny)

valueID = c("wtDefault", "wtMin", "wtMax", "wtStep",
            "htDefault", "htMin", "htMax", "htStep")
paramImp <- c(150, 80, 300, 1, 69, 44, 76, 0.5)
names(paramImp) = valueID
paramMetric <- c(70, 35, 135, 0.5, 175, 110, 195, 1)
names(paramMetric) = valueID
paramList <- list(Imperial = paramImp, Metric = paramMetric)
unitList <- list(Imperial = c(wt = "pounds", ht = "inches"),
                 Metric = c(wt = "kilograms", ht = "centimeters"))
coeff <- c(Imperial = 703, Metric = 9978)

BMI <- function(coeff, wt, ht) coeff*wt/ht/ht

shinyServer(function(input, output) { 

    output$getWt <- renderUI ({ 
        param <- paramList[[input$system]]
        unit <- unitList[[input$system]]
        numericInput("wtInput", 
                     paste("Enter your weight in ", 
                           unit["wt"],":", sep=""),
                     value = param["wtDefault"],
                     min = param["wtMin"], max = param["wtMax"],
                     step = param["wtStep"])
    })
    
    output$getHt <- renderUI ({ 
        param <- paramList[[input$system]]
        unit <- unitList[[input$system]]
        numericInput("htInput", 
                     paste("Enter your height in ", 
                           unit["ht"],":", sep=""),
                     value = param["htDefault"],
                     min = param["htMin"], max = param["htMax"],
                     step = param["htStep"])
        
    })
    
    output$BMI <- renderPrint({
        c <- coeff[input$system]; names(c) <- c()
        BMI(c, input$wtInput, input$htInput)
    })
    
    output$BMIcategory <- renderPrint({
        bmi = BMI(coeff[input$system], input$wtInput, input$htInput)
        if (bmi < 18.5) "Underweight"
        else if (bmi < 25) "Normal weight"
        else if (bmi < 30) "Overweight"
        else "Obese"
    })
})
