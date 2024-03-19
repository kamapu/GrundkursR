library(shiny)

# UI Definition
ui <- fluidPage(
  titlePanel("Taschenrechner"),
  sidebarLayout(
    sidebarPanel(
      textInput("display", label = "Anzeige", value = ""),
      actionButton("btn_1", label = "1"),
      actionButton("btn_2", label = "2"),
      actionButton("btn_3", label = "3"),
      actionButton("btn_4", label = "4"),
      actionButton("btn_5", label = "5"),
      actionButton("btn_6", label = "6"),
      actionButton("btn_7", label = "7"),
      actionButton("btn_8", label = "8"),
      actionButton("btn_9", label = "9"),
      actionButton("btn_0", label = "0"),
      br(),
      actionButton("btn_plus", label = "+"),
      actionButton("btn_minus", label = "-"),
      actionButton("btn_mult", label = "×"),
      actionButton("btn_divide", label = "÷"),
      br(),
      actionButton("btn_equals", label = "=")
    ),
    mainPanel(
      
    )
  )
)

# Server Definition
server <- function(input, output, session) {
  observeEvent(input$btn_1, {
    updateTextInput(session, "display", value = paste(input$display, "1", sep = ""))
  })
  observeEvent(input$btn_2, {
    updateTextInput(session, "display", value = paste(input$display, "2", sep = ""))
  })
  observeEvent(input$btn_3, {
    updateTextInput(session, "display", value = paste(input$display, "3", sep = ""))
  })
  observeEvent(input$btn_4, {
    updateTextInput(session, "display", value = paste(input$display, "4", sep = ""))
  })
  observeEvent(input$btn_5, {
    updateTextInput(session, "display", value = paste(input$display, "5", sep = ""))
  })
  observeEvent(input$btn_6, {
    updateTextInput(session, "display", value = paste(input$display, "6", sep = ""))
  })
  observeEvent(input$btn_7, {
    updateTextInput(session, "display", value = paste(input$display, "7", sep = ""))
  })
  observeEvent(input$btn_8, {
    updateTextInput(session, "display", value = paste(input$display, "8", sep = ""))
  })
  observeEvent(input$btn_9, {
    updateTextInput(session, "display", value = paste(input$display, "9", sep = ""))
  })
  observeEvent(input$btn_0, {
    updateTextInput(session, "display", value = paste(input$display, "0", sep = ""))
  })
  
  observeEvent(input$btn_plus, {
    updateTextInput(session, "display", value = paste(input$display, "+", sep = ""))
  })
  observeEvent(input$btn_minus, {
    updateTextInput(session, "display", value = paste(input$display, "-", sep = ""))
  })
  observeEvent(input$btn_mult, {
    updateTextInput(session, "display", value = paste(input$display, "*", sep = ""))
  })
  observeEvent(input$btn_divide, {
    updateTextInput(session, "display", value = paste(input$display, "/", sep = ""))
  })
  
  observeEvent(input$btn_equals, {
    result <- try(eval(parse(text = input$display)), silent = TRUE)
    if(class(result) == "try-error") {
      updateTextInput(session, "display", value = "Error")
    } else {
      updateTextInput(session, "display", value = result)
    }
  })
}

# Shiny App Aufruf
shinyApp(ui = ui, server = server)
