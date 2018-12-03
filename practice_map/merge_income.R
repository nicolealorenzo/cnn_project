library(dplyr)

hosp_data <- read.csv("~/Desktop/info201/rCode/practice_map/data/hospital_data_full.csv", stringsAsFactors = FALSE)
demo_data <- read.csv("~/Desktop/info201/rCode/practice_map/data/per_county_information.csv", stringsAsFactors = FALSE)

demo_data <- select(demo_data, State, County, Income)

colnames(demo_data)[2] <- "superduper" <- "County.Name"
demo_data[,2] = toupper(demo_data[,2])

demo_data$State <- state.abb[match(demo_data$State, state.name)]

demo_data$state_county <- paste(demo_data$State, demo_data$County.Name)
hosp_data$state_county <- paste(hosp_data$State, hosp_data$County.Name)



hosp_data <- merge(hosp_data, demo_data, by = "state_county", all = TRUE, sort = FALSE)

hosp_data$Income <- as.numeric(as.character(hosp_data$Income))



    if(hosp_data$Income <= 35000) {
      "Low"
    } else if(hosp_data$Income > 35000 & hosp_data$Income <= 100000) {
      "Middle"
    } else {
      "High"
    }
#hosp_data$Income[hosp_data$Income <= 35000] <- "Low"
#replace(hosp_data$Income, hosp_data$Income > 35000 & hosp_data$Income <= 100000, "mid")
# hosp_data$Income[hosp_data$Income <= 35000] <- "Low"
# hosp_data$Income[hosp_data$Income > 35000 & hosp_data$Income <= 100000] <- "Middle"

#write.csv(hosp_data, "~/Desktop/info201/rCode/practice_map/data/hosp_income.csv")