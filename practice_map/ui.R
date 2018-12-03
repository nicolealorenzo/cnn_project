library(shiny)
library(dplyr)
library(ggplot2)
library(rsconnect)

hospi <- read.csv("~/Desktop/info201/cnn_project/practice_map/data/hosp_income.csv", stringsAsFactors = FALSE)
hospi <- filter(hospi, Hospital.overall.rating != "Not Available")

hospi$latitude <- as.numeric(hospi$latitude)
hospi$longitude <- as.numeric(hospi$longitude)
hospi = hospi[complete.cases(hospi), ]

ui <- fluidPage(
  titlePanel("hospis In The US Based on Rating"),
  
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("ratings", label = h3("National Rating"), 
                         choices = list("5", "4", "3", "2", "1"),
                         selected = "5"),
      hr(),
      fluidRow(column(3, verbatimTextOutput("value")))
      ),
      
      
    
  
  mainPanel(
    leafletOutput("mymap")
    
  )
  
  )
)
shinyUI(ui)