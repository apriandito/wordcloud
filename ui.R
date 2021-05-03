# UI
shinyUI(fluidPage(
  includeCSS("www/style.css"),
  theme = shinytheme("simplex"),
  titlePanel(title = ""),

  sidebarLayout(
    sidebarPanel(
      h1(strong("Wordcloud Generator 2.0"), style = "font-family: Titillium Web;"),
      p("Created by Muhammad Apriandito"),
      hr(),
      textAreaInput("text_input",
        label = "Text Input:",
        height = "130px",
        resize = "vertical",
        value = "Put the words here..."
      ),
      hr(),
      setSliderColor(c("black", "black"), c(1, 2)),
      chooseSliderSkin(skin = "Flat", color = "grey"),
      sliderInput("min",
        "Minimum Frequency:",
        min = 1, max = 20, value = 5
      ),
      sliderInput("max",
        "Maximum Number of Words:",
        min = 1, max = 50, value = 25
      ),
      actionButton("generate", "Generate", style = "font-family: Titillium Web;")
    ),

    mainPanel(
      h4("Wordcloud Visualization:", style = "font-family: Titillium Web;"),
      hr(),
      plotOutput("wordcloud")
    )
  )
))
