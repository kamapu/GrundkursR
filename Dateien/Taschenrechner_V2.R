library(shiny)

ui <- fluidPage(
  titlePanel("Interaktiver Taschenrechner"),
  sidebarLayout(
    sidebarPanel(
      textInput("display", label = "Anzeige", value = ""),
      actionButton("num1", label = "1"),
      actionButton("num2", label = "2"),
      actionButton("num3", label = "3"),
      actionButton("add", label = "+"),
      actionButton("subtract", label = "-"),
      actionButton("multiply", label = "*"),
      actionButton("divide", label = "/"),
      actionButton("calculate", label = "Berechnen")
    ),
    mainPanel(
      verbatimTextOutput("result")
    )
  )
)

server <- function(input, output) {
  values <- reactiveValues(display_text = "")
  
  observeEvent(input$num1, {
    values$display_text <- paste(values$display_text, "1")
  })
  
  observeEvent(input$num2, {
    values$display_text <- paste(values$display_text, "2")
  })
  
  observeEvent(input$num3, {
    values$display_text <- paste(values$display_text, "3")
  })
  
  observeEvent(input$add, {
    values$display_text <- paste(values$display_text, "+")
  })
  
  observeEvent(input$subtract, {
    values$display_text <- paste(values$display_text, "-")
  })
  
  observeEvent(input$multiply, {
    values$display_text <- paste(values$display_text, "*")
  })
  
  observeEvent(input$divide, {
    values$display_text <- paste(values$display_text, "/")
  })
  
  observeEvent(input$calculate, {
    result <- eval(parse(text = values$display_text))
    output$result <- renderPrint(result)
  })
}

shinyApp(ui = ui, server = server)
