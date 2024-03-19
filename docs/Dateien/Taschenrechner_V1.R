library(shiny)

# UI Definition
ui <- fluidPage(
  titlePanel("Taschenrechner"),
  sidebarLayout(
    sidebarPanel(
      textInput("input1", "Zahl 1:"),
      textInput("input2", "Zahl 2:")
    ),
    mainPanel(
      verbatimTextOutput("result")
    )
  )
)

# Server Definition
server <- function(input, output) {
  observe({
    req(input$input1)
    req(input$input2)
    
    num1 <- as.numeric(input$input1)
    num2 <- as.numeric(input$input2)
    
    output$result <- renderText({
      paste("Ergebnis:", num1 + num2)
    })
  })
}

# Shiny App Aufruf
shinyApp(ui = ui, server = server)
