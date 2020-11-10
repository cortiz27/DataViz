#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$timeSeriesPlot <- renderPlot({

        plot_data <- crime_data %>%
                     filter(Crime == input$crimeType,
                            State %in% input$state)
                        
        ggplot(plot_data) +
            geom_line(aes(x=Year, y = Rate, color = State))+
            scale_color_discrete(name = "States")+
            labs(title = paste(input$crimeType, "by State"), x = "Year", y = "Rate per 100,000") +
            theme_dark()
    })
    
    output$histogramPlot <- renderPlot({
        
       
        
        hist_data <- crime_data %>%
                     filter(Year == input$year, Crime == input$histVar)

         ggplot(hist_data,aes(Rate))+
             geom_histogram(fill="red", color = "gray")+
             labs(title = paste("Distribution of", input$histVar, "in", input$year),
                  y = "Count",
                  x = "Rate per 100,000")+
             theme_dark()
        
        
    })
    
    output$bubblePlot <- renderPlot({
        
        crimes <- c(input$xVar, input$yVar)
        bubble_data <- crime_data %>%
                       filter(Year == input$year, Crime %in% crimes) %>%
                       spread(key = "Crime", value = "Rate")
        print(bubble_data)
        ggplot(bubble_data, aes_string(x = paste("`", input$xVar, "`", sep=""),
                                       y = paste("`", input$yVar, "`", sep=""), 
                                       size = "Population"))+
            geom_point()+
            scale_size_area(labels = scales::comma_format())
    })

})
