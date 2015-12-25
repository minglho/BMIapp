# This is the user-interface definition of a Shiny web application.

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("BMI Calculator"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("system", "Choose measurement system:",
                  c("Imperial" = "Imperial",
                    "Metric" = "Metric")),
      uiOutput("getWt"),
      uiOutput("getHt") 
      #,
      #submitButton('Submit')
    ),

    # Show a plot of the generated distribution
    mainPanel(
      h4('Your BMI is'),
      verbatimTextOutput("BMI"),
      h4('As a measure of body fat, your BMI indicates that you are'),
      verbatimTextOutput("BMIcategory")
    )
  )
))
