library(shiny)
library(dplyr)
library(leaflet)

server <- function(input,output, session){
  
 
  
  
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