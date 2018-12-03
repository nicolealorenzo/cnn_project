library(shiny)
library(leaflet)
library(dplyr)

hospital <- read.csv("~/Desktop/info201/cnn_project/data/hospital_data_full.csv", stringsAsFactors = FALSE)
hospital$latitude <- as.numeric(hospital$latitude)
hospital$longitude <- as.numeric(hospital$longitude)