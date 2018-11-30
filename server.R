library(dplyr)
library(ggplot2)
library("shiny")
county_data <- read.csv("data/per_county_information.csv", stringsAsFactors = FALSE)
county_data <- data.frame(county_data)
states_unique <- unique(county_data$State)

my_server <- function(input, output) {
  dataset <- reactive({
    print(county_data)
    states_data <- filter(county_data, State == input$states)
    print(nrow(states_data))
    return(states_data)
  })
  
  output$scatterplot <- renderPlot({
    ggplot(dataset(), aes(x=Income, y=population_hospital_ratio)) + geom_point() + geom_abline(method="auto", se=TRUE, fullrange=FALSE, level=0.95)
  })
  
  output$number_observations <- renderText({
    relevant_dataset <- dataset()
    return(paste("There are", nrow(relevant_dataset), "observations for the given state and time range"))
  })
}

shinyServer(my_server)

