## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ColombiAPI)
library(dplyr)
library(ggplot2)

## ----colombia-gdp,echo = TRUE,message = FALSE,warning = FALSE,results = 'markup'----


colombia_gdp <- head(get_colombia_gdp())

print(colombia_gdp)


## ----colombia-life-expectancy,echo = TRUE,message = FALSE,warning = FALSE,results = 'markup'----

colombia_life_expectancy <- head(get_colombia_life_expectancy())

print(colombia_life_expectancy)


## ----colombia-population,echo = TRUE,message = FALSE,warning = FALSE,results = 'markup'----

colombia_population <- head(get_colombia_population())

print(colombia_population)


## ----colombia-rainfall, message=FALSE, warning=FALSE, fig.width=9, fig.height=5----

Medellin_rain_tbl_df %>%
  group_by(month) %>%
  summarise(mean_rainfall = mean(rainfall, na.rm = TRUE), .groups = "drop") %>%
  ggplot(aes(x = month, y = mean_rainfall)) +
  geom_line(size = 1, color = "steelblue") +
  geom_point(size = 2, color = "darkred") +
  labs(
    title = "Climatological Monthly Average Rainfall in Medellin",
    subtitle = "Each point represents the long-term mean rainfall for that month, averaged across all years",
    x = "Month",
    y = "Mean Rainfall (mm)"
  ) +
  theme_minimal()




## ----view_datasets------------------------------------------------------------

view_datasets_ColombiAPI()


