library(dplyr)
##define server logic required to draw histogram
server <- function(input,output){
  
  ##print pie chart
  output$distPlot <- renderPlot({
    
    ##get selected data from UI
    hospi <- hospi %>%
      filter(City == input$cities) %>%
      group_by(Hospital.Ownership) %>%
      summarise(Hosp = n())
    # print(input$states)
    # print(hospi)
    # 
    # ##get percent per ownership
    # hospi <- hospi %>%
    #   group_by(Hospital.Ownership) %>%
    #   summarise(Hosp = n())
    
    print(hospi$Hosp)
    
    #graph
    ggplot(hospi, aes(x = '', y = Hosp , fill = Hospital.Ownership)) +
      geom_col(aes(fill = Hospital.Ownership), width = 1) + 
      geom_text(aes(label = hospi$Hosp), position = position_stack(vjust = 0.5)) +
      labs(fill= "Ownership Type", x=NULL, y="Distribution of Ownership") +
      coord_polar("y")
      
  })
  
}
shinyServer(server)