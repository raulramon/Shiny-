#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(
    #title Panel
    titlePanel("UCI"),
    
    #Sidebar layout with side bar Panel
    sidebarLayout(sidebarPanel(
        
    #Slide input
    sliderInput(inputId = "pointSize", 
                label = "Point Size:",
                min = 0,
                max = 10,
                value = 5)
    , 
    selectInput(inputId = "pointColor",
                label = "Point Color",
                choices = c("green", "blue"))
 
    ),
    #where it going to show
    mainPanel(
        plotOutput("UCIplot")
    )
    
    
))





#Define server Logic
server <- function(input, output) {
    
    
    output$UCIplot <- renderPlot({
        
        ggplot(uci, aes(x=ï..Year, y = Category, fill = Gender)) +
            geom_boxplot(size = input$pointSize, color = input$pointColor)
    
    })
    
    
}


#Run the application
shinyApp(ui = ui, server = server)


