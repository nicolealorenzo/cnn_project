# library(dplyr)
# library(ggplot2)
# library("shiny")
# county_data <- read.csv("data/per_county_information.csv", stringsAsFactors = FALSE)
# county_data <- data.frame(county_data)
# states_unique <- unique(county_data$State)
# 
# my_server <- function(input, output) {
#   dataset <- reactive({
#     print(county_data)
#     states_data <- filter(county_data, State == input$states)
#     print(nrow(states_data))
#     return(states_data)
#   })
# 
#   output$scatterplot <- renderPlot({
#     ggplot(dataset(), aes(x=Income, y=population_hospital_ratio)) + geom_point()
#   })
# 
#   output$number_observations <- renderText({
#     relevant_dataset <- dataset()
#     return(paste("There are", nrow(relevant_dataset), "observations for the given state and time range"))
#   })
# }
# 
# shinyServer(my_server)


library(shiny)
library(dplyr)
library(leaflet)
library(dplyr)
library(ggplot2)
library("shiny")
county_data <- read.csv("data/per_county_information.csv", stringsAsFactors = FALSE)
county_data <- data.frame(county_data)
states_unique <- unique(county_data$State)

server <- function(input,output, session){
  dataset <- reactive({
    print(county_data)
    states_data <- filter(county_data, State == input$states)
    print(nrow(states_data))
    return(states_data)
  })
  
  output$scatterplot <- renderPlot({
    ggplot(dataset(), aes(x=Income, y=population_hospital_ratio)) + geom_point() + ggtitle("Median Income vs Population to Hospital Ratio")
  })
  
  output$diagram_title <- renderText({
    return("Hospitals in The US Based on Ratings and Area Income")
  })
  output$description <- renderText({
    return(paste("This map displays hospitals thougout the US based on a selected US National rating. the markers represent the givin areas income.", 
                 "Green represents high income (>$100,000)",
                 "Orange represents midle class income (>$35,000, < $100,000)",
                 "Red represents low income (<= $35,000)", sep= "\n"))
  })
  
  output$description_1 <- renderText({
    return(paste("This scatterplot shows that generally for most states, counties with the best population to hospital ratio tends to be a county with income between $40,000 and $60,000",
                 "","", sep="\n"))
  })
  
  output$mymap <- renderLeaflet({
    getColor <- function(hospi) {
      sapply(hospi$Income, function(Income) {
        if(is.null(Income) ) {
          "blue"
        } else if (Income <= 35000.0){
          "red"
        }else if (Income > 35000.0 & Income <= 100000.0){
          "orange"
        } else {
          "green"
          
          
          
          
          
          # } else if(Income > 35000 & Income <= 100000) {
          #   "orange"
          # } else {
          #   "green"
        } })
    }
    
    icons <- awesomeIcons(
      icon = 'ios-close',
      iconColor = 'black',
      #library = 'ion',
      markerColor = getColor(hospi)
    )
    #
    
    
    # df <- data()
    hosp_filter <- hospi %>% 
      filter(Hospital.overall.rating == input$ratings )
    
    m <- leaflet(data = hosp_filter) %>%
      addTiles() %>% 
      addAwesomeMarkers(lng = ~longitude,
                        lat = ~latitude,
                        icon=icons, 
                        #markerColor: 'red'
                        #label=~hospital$Income,
                        popup = paste("Name:", hosp_filter$Hospital.Name, "<br>",
                                      "County:", hosp_filter$County.Name.x
                        ))
    
    m
  })
}
shinyServer(server)