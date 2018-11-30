library("shiny")
state <- data("state")
print(state.name)
state_name <- state.name
ui <- fluidPage(
  titlePanel("Income vs population hospital ratio"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "states", 
        "states of sightings",
        state_name,
        selected = "Alabama"
      )
    ),
    mainPanel(
      plotOutput("scatterplot"),
      textOutput("number_observations")
    )
  )
  
)
shinyUI(ui)
