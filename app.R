library(shiny)
library(randomForest)

# Wczytanie modelu i poziomów dla zmiennej genre
model <- readRDS("model_rf.rds")
genre_levels <- readRDS("genre_levels.rds")

ui <- fluidPage(
  titlePanel("Predykcja oceny filmu 🎬"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("budget", "Budżet ($):", 50000000, min = 0),
      numericInput("runtime", "Czas trwania (min):", 120, min = 1),
      numericInput("year", "Rok:", 2020, min = 1900, max = 2100),
      selectInput("genre", "Gatunek:", choices = genre_levels),
      numericInput("votes", "Liczba głosów:", 100000, min = 1),
      actionButton("predict_btn", "Przewidź ocenę ⭐")
    ),
    
    mainPanel(
      h3("Przewidywana ocena filmu:"),
      textOutput("result")
    )
  )
)

server <- function(input, output) {
  
  observeEvent(input$predict_btn, {
    new_movie <- data.frame(
      budget = input$budget,
      runtime = input$runtime,
      year = input$year,
      genre = factor(input$genre, levels = genre_levels),
      votes = input$votes
    )
    
    pred <- predict(model, new_movie)
    pred <- max(min(pred, 10), 1)
    
    output$result <- renderText(round(pred, 2))
  })
}

shinyApp(ui = ui, server = server)

