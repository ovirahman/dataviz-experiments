library(shiny)


library(shiny)

ui <- fluidPage(
  theme = shinythemes::shinytheme(theme = "slate"),
  titlePanel(" Shiny App: Histogram"),
  sliderInput("slider", "# of Bins", 10, 100, 20),
  
  tabsetPanel(
    tabPanel("Sepal", plotOutput("plot1")),
    tabPanel("Petal", plotOutput("plot2"))
  )
)

server <- function(input, output, session) {
  
  output$plot1 <- renderPlot({
    hist(iris$Sepal.Length, breaks = input$slider, col = "wheat")
  })
  output$plot2 <- renderPlot({
    hist(iris$Petal.Length, breaks = input$slider, col = "wheat")
  })
}

shinyApp(ui, server)