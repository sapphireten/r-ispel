# Brandon Miranda
# Learning Basic Plotly

# Installing required packages below
library(plotly)
library(tidyverse)
library(dplyr)

# mtcars is a sample R database that includes information on vehicles such as
# MPG, CYL, Displacement etc.
fig1 <- mtcars %>%
  plot_ly(x = ~mpg, y = ~disp)
fig1
# From running this plot using Plotly I'm able to manipulate the plot
# We can zoom, pan, box and lasso select and download the plot.
# Using the Plotly toolbar in the right hand corner when you click zoom. 


# Below are the 3 main functions available in Plotly 

# plot_ly() takes r objects and maps them to the plotly graphing library
plot_ly()
# layout() allows us to specify attributes of the x and y axis such as titles
layout()
# Similar to geometries in ggplot2 so the type of plot we want to use
add_trace()


# layout function example

fig1 <- mtcars %>%
  plot_ly(x = ~mpg, y = ~disp) %>%
  layout(
    title = "Miles per Gallon vs Displacement",
    xaxis = list(
      title ="Miles per Gallon",
      range = c(10, 35)
    ),
    yaxis = list(
      title = "Displacement",
      range = c(50, 500)
      )
  )
fig1

# This example shows how to involve 2 plots in the same figure while
# Corresponding them to a matching legend in the top right
fig1 <- mtcars %>%
  plot_ly(x = ~factor(cyl), y = ~mpg, type = "scatter",
          name = "Scatter") %>%
  add_boxplot(name = "Boxplot")
fig1
          
# this example shows using the add trace function to create a scatter plot
airquality %>%
  plot_ly(x = ~Temp) %>%
  add_trace(y = ~Ozone, type = "Scatter")%>%
  layout(
    title = "Temperature and the Ozone",
    xaxis = list(title = "Temperature"),
    yaxis = list(title = "Ozone")
  )

fig2 <- airquality %>%
  plot_ly(x = ~Temp, y = ~Ozone, type = "scatter")%>%
  layout(
    title = "Temperature vs The Ozone",
    xaxis = list(title = "Temperature"),
    yaxis = list(title = "Ozone")
    )
fig2



























