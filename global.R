# Load library
library(shiny)
library(shinythemes)
library(textclean)
library(tidytext)
library(ggwordcloud)
library(hrbrthemes)
library(RColorBrewer)
library(shinyWidgets)
library(tidyverse)


mycolors <- colorRampPalette(brewer.pal(8, "Set1"))(62)

# Create function to Clean
count_text <- function(text, min, max) {
  df <- tibble(text)

  # Process the data
  df_clean <- df %>%
    select(text) %>%
    mutate(text = strip(text)) %>%
    mutate(text = replace_emoji(text)) %>%
    mutate(text = replace_html(text)) %>%
    mutate(text = replace_hash(text, pattern = "#([A-Za-z0-9_]+)", replacement = "")) %>%
    mutate(text = replace_tag(text, pattern = "@([A-Za-z0-9_]+)", replacement = ""))

  # Unnest Token
  df_text <- df_clean %>%
    unnest_tokens(word, text) %>%
    anti_join(stop_words) %>%
    count(word) %>%
    ungroup() %>%
    filter(n >= min) %>%
    filter(n <= max)

  return(df_text)
}
