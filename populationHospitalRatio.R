library(dplyr)
population <- read.csv("data/acs2015_census_tract_data.csv", stringsAsFactors = FALSE)
county_population <- population %>%
  group_by(State, County) %>%
  summarise_all(funs(sum), na.rm=TRUE)
county_population <- data.frame(county_population)
hospital <- read.csv("data/hospital_data_full.csv", stringsAsFactors = FALSE)
hospital_per_county <- data.frame(hospital %>%
  group_by(County = County.Name) %>%
  summarise(hospital_count = n()))
hospital_per_county$County <- tolower(hospital_per_county$County)
county_population$County <- tolower(county_population$County)
joined_data <- inner_join(county_population, hospital_per_county, by = "County")
joined_data$population_hospital_ratio <- joined_data$TotalPop / joined_data$hospital_count
write.csv(joined_data, file = "data/per_county_information.csv")
