## Get libraries
library("shiny")
library("dplyr")
library("ggplot2")
library("rsconnect")
library("leaflet")

## Get state data
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
  titlePanel("Exploring Hospital Data Thoughout the US (2015)"),
  
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
      radioButtons("ratings", label = h3("Figure 2: National Rating"), 
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
      tabsetPanel(
        tabPanel("About", includeMarkdown("about.Rmd")),
        tabPanel("1: Income to Population Ration", includeMarkdown("title1.Rmd"), plotOutput("scatterplot"), includeMarkdown("citation1.Rmd")),
        tabPanel("2: Rating to Area Income", includeMarkdown("title_fig2.Rmd"), leafletOutput("mymap"), includeMarkdown("desc2.Rmd")),
        tabPanel("3: Cities and Hospital Type", includeMarkdown("title3.Rmd"), plotOutput("distPlot"))
      )
     
      
    )
  )  
)
shinyUI(ui)
