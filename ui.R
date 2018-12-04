library("shiny")
library("dplyr")
library("ggplot2")
state <- data("state")
print(state.name)
state_name <- state.name
hospi <- read.csv("data/hospital_data_full.csv", na.strings = c("NA", "Not Available", "Results are not available for this reporting period"), stringsAsFactors = FALSE)
hospi <- filter(hospi, Hospital.overall.rating != "Not Available")
hospi$latitude <- as.numeric(hospi$latitude)
hospi$longitude <- as.numeric(hospi$longitude)
hospi = hospi[complete.cases(hospi), ]
State <- data("State")
state_name <- state.name
print(state.abb)
city_name <- unique(hospi$City)
print(city_name)
#Hosp <- as.data.frame(Hosp)


ui <- fluidPage(
  titlePanel("Different types of hospital ownership by state"),
  sidebarLayout(
    sidebarPanel(
      
      selectInput(
        "cities", 
        "cities",
        city_name,
        selected = "CHICAGO"
      )
    ),
    mainPanel(
      plotOutput("distPlot"),
      textOutput("text")
    )
  )
  
)

shinyUI(ui)
