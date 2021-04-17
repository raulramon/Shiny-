library(shiny)
library(tidyverse)

uci <- read.csv("UCIRiders0519_2x.csv", stringsAsFactors = T)


ui <- fluidPage(textInput(inputId = "First.Name",
                          label = "Name",
                          value = "",
                          placeholder = "Louis"),
                selectInput(inputId = "Gender",
                            label = "Gender:",
                            choices = list(Female = "Female",
                                           Male = "Male")
                ),
                sliderInput(inputId = "ï..Year",
                            label = "Year Range:",
                            min = min(uci$ï..Year),
                            max = max(uci$ï..Year),
                            value = c(min(uci$ï..Year),
                                      max(uci$ï..Year)),
                            sep =""),
                
                submitButton(text = "Create my Plot!"),
                plotOutput(outputId = "nameplot")
                
)
server <- function(input, output){
    
    
    
    output$nameplot <- renderPlot({
        
        
        uci %>% 
            filter(Gender == input$Gender,
                   Year == input$ï..Year) %>% 
            ggplot(aes(x = ï..Year,
                       y = Country, color = Country)) +
            geom_bar(stat = "identity") +
            scale_x_continuous(input$ï..Year) +
            theme_minimal()
    })
    
    
}

shinyApp(ui = ui, server = server)