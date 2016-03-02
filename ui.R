library(shiny)
library(plotly)

shinyUI(fluidPage(
  
  titlePanel("Iris Dimensions by Species"),
  
  sidebarLayout(
    
    sidebarPanel(
  
      selectInput("y", label = h3("Value"),
                  choices = list("Average Sepal Length" = "avg_sepal_length", 
                                 "Average Petal Length" = "avg_petal_length",
                                 "Average Sepal Width" = "avg_sepal_width",
                                 "Average Petal Width" = "avg_petal_width"),
                  selected = "avg_sepal_length"),
    
      
      
   # Copy the line below to make a select box 
  checkboxGroupInput("x", label = h3("Species"), 
              choices = list("setosa" = "setosa", "versicolor" = "versicolor", "virginica" = "virginica"), 
              selected = "setosa"),
  
  
  
  hr(),
  fluidRow(column(3, verbatimTextOutput("value")))
  
),

mainPanel(
  plotlyOutput('graph')
)
)
))