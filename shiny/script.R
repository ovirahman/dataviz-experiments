library(shiny)




ui <- fluidPage(
  theme = shinythemes::shinytheme(theme = "slate"),
  titlePanel(" Shiny App: Histogram"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("slider", "# of Bins", 10, 100, 20),
      selectInput("select", "Select Measurement", c("Length", "Width"))
      ),
    mainPanel(
      tabsetPanel(
        tabPanel("Sepal", plotOutput("plot1")),
        tabPanel("Petal", plotOutput("plot2"))
      )
    )
  )
  
)

server <- function(input, output, session) {
  
  
  output$plot1 <- renderPlot({
    par(bg = "transparent",fg = "white", col.main = "white", col.lab = "white", col.axis = "white", col = "white")
    hist(iris[[paste0("Sepal.",input$select)]], breaks = input$slider, col = "steelblue")
  })
  output$plot2 <- renderPlot({
    par(bg = "transparent",fg = "white", col.main = "white", col.lab = "white", col.axis = "white", col = "white")
    hist(iris$Petal.Length, breaks = input$slider, col = "darkred")
  })
}

shinyApp(ui, server)