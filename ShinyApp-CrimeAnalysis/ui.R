#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Crime in the U.S"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("crimeType", 
                        "Select Crime Rate Type for Time Series:", 
                        levels(as.factor(crime_data$Crime))),
            selectInput("state", "Select State(s):", levels(as.factor(crime_data$State)), multiple = T),
            selectInput("histVar", 
                        "Select Crime Rate Type for Histogram:", 
                        levels(as.factor(crime_data$Crime))),
            selectInput("year", "Select a Year for Histogram:", levels(as.factor(crime_data$Year))),
            selectInput("xVar", "Crime Rate X:", levels(as.factor(crime_data$Crime))),
            selectInput("yVar", "Crime Rate Y:", levels(as.factor(crime_data$Crime)))
            
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("timeSeriesPlot"),
            plotOutput("histogramPlot"),
            plotOutput("bubblePlot")
        )
    )
))
