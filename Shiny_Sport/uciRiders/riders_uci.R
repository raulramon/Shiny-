library(shiny)
library(tidyverse)




ui <- fluidPage(textInput(inputId = "name",
                          label = "Name",
                          value = "",
                          placeholder = "UCI"),
                selectInput(inputId = "Gender",
                            label = "Gender:",
                            choices = list(Female = "Female",
                                           Male = "Male")
                            ),
                sliderInput(inputId = "�..Year",
                            label = "Year Range:",
                            min = min(uci$�..Year),
                            max = max(uci$�..Year),
                            value = c(min(uci$�..Year),
                                      max(uci$�..Year)),
                sep =""),
                plotOutput(outputId = "nameplot")
 
)
server <- function(input, output){
  output$nameplot <- renderPlot({
   
     uci %>% 
      filter(Gender == input$Gender,
             �..Year == input$�..Year) %>% 
      ggplot(aes(x = �..Year,
                 y = Country, color = Country)) +
      geom_bar(stat = "identity") +
       scale_x_continuous(input$�..Year) +
      theme_minimal()
  })
  
  
}

shinyApp(ui = ui, server = server)


