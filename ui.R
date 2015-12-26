# This is the user-interface definition of a Shiny web application.

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("BMI Calculator"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("system", "Choose measurement system for your input:",
                  c("Imperial" = "Imperial",
                    "Metric" = "Metric")),
      uiOutput("getWt"),
      uiOutput("getHt") 
      #,
      #submitButton('Submit')
    ),

    # Show a plot of the generated distribution
    mainPanel(
      tags$html(
          tags$body(
              p("Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women."),
              p("Although BMI can be used for most adults, it does have some limits:")
          ),
          tags$li(
              p("It may overestimate body fat in athletes and others who have a muscular build.")
          ),
          tags$li(
              p("It may underestimate body fat in older persons and others who have lost muscle.")
          )
      ),
      br(),
      p(strong("Input your weight and height to the right to calculate your BMI and find out if you are overweight.")),
      p(strong('Your BMI is')),
      verbatimTextOutput("BMI"),
      p(strong('As a measure of body fat, your BMI indicates that you are')),
      verbatimTextOutput("BMIcategory")
    )
  )
))
