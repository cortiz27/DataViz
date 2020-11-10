# Your application should display times series charts showing the per capita rate 
# of some type of crime over time for various states and include the following interactive features:
#   
# -let your user pick the type of crime (assault, larceny theft, robbery, etc) to show
# -let your user pick one or more states to display (show the line for each state in a different color, 
# include a legend so that you can identify which line represents which state).
#.
#
#
#To earn an exemplary mark, your application should include the features listed above AND 
#at least one additional display.  You may choose any appropriate display you wish. 
#The list below provides some possibilities, but other options are certainly possible:

# -a bubble plot -- let your user pick a year and two different crime rates for the x-axis and y-axis variable
# -a choropleth or a cartogram (equal area or distorted) -- let your user pick a year and a crime rate
# -some type of distributional chart (histogram, boxplot, etc) -- let your user pick a crime rate and a year
# -some type of 2D distributional chart (tile plot,  contour plot, etc) -- let your user pick a year and two crime rates

library(shiny)
library(tidyverse)
library(ggrepel)

crime <- read_csv("CrimeStatebyState.csv")
crime_data <- crime %>%
              filter(State != "United States-Total") %>%
              select(Year, State, Population, contains("rate")) %>%
              gather(key = "Crime", value = "Rate", -Year, -State, -Population)

