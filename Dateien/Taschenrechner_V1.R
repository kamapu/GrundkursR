library(shiny)

ui <- fluidPage(
  titlePanel("Interaktiver Taschenrechner"),
  sidebarLayout(
    sidebarPanel(
      textInput("input", "Eingabe"),
      actionButton("calculate", "Berechnen")
    ),
    mainPanel(
      verbatimTextOutput("output")
    )
  )
)

server <- function(input, output) {
  observeEvent(input$calculate, {
    result <- eval(parse(text = input$input))
    output$output <- renderPrint(result)
  })
}

shinyApp(ui = ui, server = server)
