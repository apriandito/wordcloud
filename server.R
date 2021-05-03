# Server

shinyServer(function(input, output) {
  df_count <- eventReactive(input$generate, {
    isolate({
      withProgress({
        setProgress(message = "Visualizing")
        df_count <- count_text(input$text_input,
          min = input$min,
          max = input$max
        )
      })
    })
  })

  # Plot the Servqual
  output$wordcloud <- renderPlot(
    # Barplot
    ggplot(
      df_count(),
      aes(label = word, size = n, colour = word)
    ) +
      geom_text_wordcloud_area(family = "Titillium Web") +
      scale_size(range = c(1, 30)) +
      scale_colour_manual(values = mycolors) +
      theme_ipsum_rc()
  )
})
