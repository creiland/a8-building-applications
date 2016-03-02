library(plotly)
library(shiny)
library(dplyr)
source("C:/info498f/homework/a8-building-applications/bar_graph.R")

shinyServer(function(input, output){
  output$graph <- renderPlotly({
    bar_graph(iris, input$x, input$y)
  })
})