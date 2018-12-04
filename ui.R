## Get libraries
library("shiny")
library("dplyr")
library("ggplot2")
library("rsconnect")
library("leaflet")
state <- data("state")
print(state.name)
state_name <- state.name

## Read data
hospi <- read.csv("~/INFO/INFO201/cnn_project/data/hosp_income.csv", stringsAsFactors = FALSE)
hospi <- filter(hospi, Hospital.overall.rating != "Not Available")

## Get needed information 
hospi$latitude <- as.numeric(hospi$latitude)
hospi$longitude <- as.numeric(hospi$longitude)
hospi = hospi[complete.cases(hospi), ]
city_name <- unique(hospi$City)

## Shiny UI
ui <- fluidPage(
  titlePanel("Income vs population hospital ratio"),
  
  ## Sidebar
  sidebarLayout(
    sidebarPanel(
      
      ## Dropdown widget for figure 1 
      selectInput(
        "states", 
        "Figure 1: Select States",
        state_name,
        selected = "Alabama"
      ),
      
      ## Button widget for figure 2
      radioButtons("ratings", label = h3("National Rating"), 
                   choices = list("5", "4", "3", "2", "1"),
                   selected = "5"),
      hr(),
      fluidRow(column(3, verbatimTextOutput("value"))),
      
      ## Dropdown widget for figure 3
      selectInput(
        "cities", 
        "Figure 3: Select Cities",
        city_name,
        selected = "CHICAGO"
      )
    ),
    ## Display
    mainPanel(
      plotOutput("scatterplot"),
      verbatimTextOutput("description_1"),
      textOutput("diagram_title"),
      leafletOutput("mymap"),
      verbatimTextOutput("description"),
      plotOutput("distPlot"),
      textOutput("text")
    )
  )  
)
shinyUI(ui)
