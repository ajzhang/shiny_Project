library(shiny)

# Define UI for application
ui <- fluidPage(
  tags$head(
    tags$style(
      HTML(
        "
        .subtitle {
          text-align: center;
          font-style: italic;
          font-size: 14px;
          margin-top: -10px;
        }
        "
      )
    )
  ),
  titlePanel(
    div(
      "Motor Trend Car Road Tests",
      class = "title",
      br(),
      span("Aijun Zhang, 06-01-2023", class = "subtitle")
    )
  ),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "x_var",
        label = "X-axis Variable:",
        choices = names(mtcars),
        selected = "wt"
      ),
      sliderInput(
        inputId = "x_range",
        label = "X-axis Range:",
        min = min(mtcars$wt),
        max = max(mtcars$wt),
        value = c(min(mtcars$wt), max(mtcars$wt)),
        step = 0.1
      )
    ),
    mainPanel(
      plotOutput(outputId = "scatter_plot")
    )
  )
)
