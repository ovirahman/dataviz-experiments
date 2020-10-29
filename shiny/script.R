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








###############################


library(shiny)
library(dplyr)
library(sp)
map <- rgdal::readOGR("bgd_admbnda_adm2_bbs_20180410/", "bgd_admbnda_adm2_bbs_20180410")

ui <- fluidPage(
  selectInput("select", "Division", c(levels(map$ADM1_EN)), "Sylhet"),
  plotOutput("plot")  
)

server <- function(input, output, session) {
  
  output$plot <- renderPlot({
    plot(map[map$ADM1_EN == input$select,], col = "red")
  })
}

shinyApp(ui, server)









