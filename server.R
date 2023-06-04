library(shiny)

# Define server logic
server <- function(input, output, session) {
  
  # Reactive expression for available x-axis variable choices
  x_choices <- reactive({
    names(mtcars)
  })
  
  # Reactive expression for x-axis variable range
  x_range <- reactive({
    var <- input$x_var
    c(min(mtcars[[var]]), max(mtcars[[var]]))
  })
  
  # Update slider range when x-axis variable changes
  observeEvent(input$x_var, {
    updateSliderInput(session,
                      inputId = "x_range",
                      label = "X-axis Range:",
                      min = x_range()[1],
                      max = x_range()[2],
                      value = x_range())
  })
  
  # Create scatter plot based on user input
  output$scatter_plot <- renderPlot({
    x_var <- input$x_var
    y_var <- "mpg"
    x_range_val <- input$x_range
    
    colors<-ifelse(mtcars$am == 0, "red", "blue")
    
    plot(mtcars[, x_var], mtcars[, y_var],
         xlab = x_var, ylab = "miles/gallon (mpg)",
         xlim = x_range_val,
         main = paste("Scatter Plot of", x_var, "vs", y_var),
         col=colors, pch=16, cex=1.5)
  })
}
