# server.Rsource("helpers.R")
library(shiny)
source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer(
  function(input, output) {
    output$map <- renderPlot({
      data <- switch(input$var, "Percent White" = counties$white, "Percent Black" = counties$black, "Percent Hispanic" = counties$hispanic, "Percent Asian" = counties$asian)
      color <- switch(input$var, "Percent White" = "seagreen4", "Percent Black" = "snow4", "Percent Hispanic" = "darkorchid4", "Percent Asian" = "lightcoral")
      legend <- switch(input$var, "Percent White" = "% White", "Percent Black" = "% Black", "Percent Hispanic" = "% Hispanic", "Percent Asian" = "% Asian")
      percent_map(data, color, legend, input$range[1], input$range[2])
    })
      
  }
)
    