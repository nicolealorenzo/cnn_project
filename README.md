# Info 201 Fianl Project:
# Exploring Hospital Data Throughout The US
### Nicole Lorenzo
### Christopher Sofian
### Niev John Ignaco


## Project Description

### Goal: 
Health is a key aspect that affects lifestyle, and lifestyle can also have an affcet as to how health resources are provided. Through the data, we wanted to locate where hospitals are in the country and show thier relation to the communities in the area. Find out how different areas thoughout the nation are being represented through health resources and vise versa. This is important to know to see what areas are being underrepresented in good health care, and what socioeconomic factors play a role. 

### Data: 
We

### Audience:

## Visualizing our Findings:

### Figure 1: 

### Figure 2:

### Figure 3: 
1) What is the dataset you'll be working with?  Please include background on who collected the data, where you accessed it, and any additional information we should know about how this data came to be.
-Hospital General Information (kaggle)
This file contains general information about all hospitals that have been registered with Medicare, including their addresses, type of hospital, and ownership structure. It also contains information about the quality of each hospital, in the form of an overall rating (1-5, where 5 is the best possible rating & 1 is the worst), and whether the hospital scored above, same as, or below the national average for a variety of measures.

	-US Census Demographic Data(kaggle)
Taken from the DP03 and DP05 tables of American Community Survey 5-year estimate, this dataset expands on my earlier New York City Census Data dataset. It includes data from the entire country instead of just New York City. The expanded data will allow for much more interesting analyses and will also be much more useful at supporting other data sets.

2) Who is your target audience?  Depending on the domain of your data, there may be a variety of audiences interested in using the dataset.  You should home in on one of these audiences.
-Healthcare professionals, patients, and government. Where patients and government funds should be targeted towards. 

3) What does your audience want to learn from your data?  Please list out at least 3 specific questions that your project will answer for your audience.
Our goals are to :
-Highlight under represented cities in the US in terms of population to hospital/population ratio
-Analyze the locations of hospitals and their relation to the populations race, gender, or economic class.
-Find out which locations have the most hospital to population ratio
Technical Description

4) What will be the format of your final product (Shiny app, HTML page or slideshow compiled with KnitR, etc.)?
-Shiny App
5) How will you be reading in your data (i.e., are you using an API, or is it a static .csv/.json file)?
-Static .csv file that we get from kaggle. 
-https://www.kaggle.com/cms/hospital-general-information
6) What types of data-wrangling (reshaping, reformatting, etc.) will you need to do to your data?
-Reshaping - we would see how many hospitals are there in the city, we would also join two tables. Population by cities tables and the hospital in the cities table. 
-We would also have to perform a groupby operations to find the total number of hospitals in a city

7) What (major/new) libraries will be using in this project (no need to list common libraries that are used in many projects such as dplyr)
-Dplyr
	-Ggplot2
	-Keras
	-Sklearn
	-Pandas
8) What questions, if any, will you be answering with statistical analysis/machine learning?
-Which cities in the US are under represented in health resources such as hospitals? 
9) What major challenges do you anticipate? 
	-Data cleanups is going to be hard because there might be a data row where	
	there is no address, there is a typo, or a column with missing data. 
	-Find relationship that is statistically significant.
