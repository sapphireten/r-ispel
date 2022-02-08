# Brandon Miranda
# Learning Basic Plotly
install.packages("plotly")
install.packages("tidyverse")
install.packages("dplyr")
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

# The below visual uses the restyle method which is used when modifying data and
# data attributes 
fig2 <- airquality %>%
  plot_ly(x = ~Temp, y = ~Ozone, type = "scatter")%>%
  layout(
    title = "Temperature vs The Ozone",
    xaxis = list(title = "Temperature"),
    yaxis = list(title = "Ozone"),
    updatemenus = list(
      list(
        type = "buttons",
        y = 0.8,
        buttons = list(
          
          list(method = "restyle",
               args = list("marker.color", "blue"),
               label = "Blue"),
          
          list(method = "restyle",
               args = list("marker.color", "red"),
               label = "Red")))
    )
  )
fig2
# This example demonstrates how to update several data attributes such as:
# colorscale, chart type, and colorscale with the restyle method 
fig <- plot_ly(z = ~volcano, type = "heatmap", colorscale='Rainbow')

# chart option buttons
chart_types <- list(
  type = "buttons",
  direction = "right",
  xanchor = 'center',
  yanchor = "top",
  pad = list('r'= 0, 't'= 10, 'b' = 10),
  x = 0.5,
  y = 1.27,
  buttons = list(
    
    list(method = "restyle",
         args = list("type", "heatmap"),
         label = "Heatmap"),
    
    list(method = "restyle",
         args = list("type", "contour"),
         label = "Contour"),
    
    list(method = "restyle",
         args = list("type", "surface"),
         label = "Surface")
  ))

# color option buttons  
color_types <- list(
  type = "buttons",
  direction = "right",
  xanchor = 'center',
  yanchor = "top",
  pad = list('r'= 0, 't'= 10, 'b' = 10),
  x = 0.5,
  y = 1.17,
  buttons = list(
    
    list(method = "restyle",
         args = list("colorscale", "Rainbow"),
         label = "Rainbow"),
    
    list(method = "restyle",
         args = list("colorscale", "Jet"),
         label = "Jet"),
    
    list(method = "restyle",
         args = list("colorscale", "Earth"),
         label = "Earth"),
    
    list(method = "restyle",
         args = list("colorscale", "Electric"),
         label = "Electric")
  ))

annot <- list(list(text = "Chart<br>Type", x=0.2, y=1.25, xref='paper', yref='paper', showarrow=FALSE),
              list(text = "Color<br>Type", x=0.2, y=1.15, xref='paper', yref='paper', showarrow=FALSE))

# plot
fig <- fig %>% layout(
  xaxis = list(domain = c(0.1, 1)),
  yaxis = list(title = "y"),
  updatemenus = list(chart_types,color_types),
  annotations = annot)

fig
# This one shows the relayout method should be used when modifying the layout 
# attributes of the graph. Update One Layout Attribute this example demonstrated
# how to update a layout attribute: shapes with the relayout method.
x0 <- rnorm(400, mean=2, sd=0.4)
y0 <- rnorm(400, mean=2, sd=0.4)
x1 <- rnorm(400, mean=3, sd=0.6)
y1 <- rnorm(400, mean=6, sd=0.4)
x2 <- rnorm(400, mean=4, sd=0.2)
y2 <- rnorm(400, mean=4, sd=0.4)

# shapes components
cluster0 = list(
  type = 'circle',
  xref ='x', yref='y',
  x0=min(x0), y0=min(y0),
  x1=max(x0), y1=max(y0),
  opacity=0.25,
  line = list(color="#835AF1"),
  fillcolor="#835AF1")

cluster1 = list(
  type = 'circle',
  xref ='x', yref='y',
  x0=min(x1), y0=min(y1),
  x1=max(x1), y1=max(y1),
  opacity=0.25,
  line = list(color="#7FA6EE"),
  fillcolor="#7FA6EE")

cluster2 = list(
  type = 'circle',
  xref ='x', yref='y',
  x0=min(x2), y0=min(y2),
  x1=max(x2), y1=max(y2),
  opacity=0.25,
  line = list(color="#B8F7D4"),
  fillcolor="#B8F7D4")

# updatemenus component
updatemenus <- list(
  list(
    active = -1,
    type = 'buttons',
    buttons = list(
      
      list(
        label = "None",
        method = "relayout",
        args = list(list(shapes = c()))),
      
      list(
        label = "Cluster 0",
        method = "relayout",
        args = list(list(shapes = list(cluster0, c(), c())))),
      
      list(
        label = "Cluster 1",
        method = "relayout",
        args = list(list(shapes = list(c(), cluster1, c())))),
      
      list(
        label = "Cluster 2",
        method = "relayout",
        args = list(list(shapes = list(c(), c(), cluster2)))),
      
      list(
        label = "All",
        method = "relayout",
        args = list(list(shapes = list(cluster0,cluster1,cluster2))))
    )
  )
)

fig <- plot_ly(type = 'scatter', mode='markers') 
fig <- fig %>% add_trace(x=x0, y=y0, mode='markers', marker=list(color='#835AF1')) 
fig <- fig %>% add_trace(x=x1, y=y1, mode='markers', marker=list(color='#7FA6EE')) 
fig <- fig %>% add_trace(x=x2, y=y2, mode='markers', marker=list(color='#B8F7D4')) 
fig <- fig %>% layout(title = "Highlight Clusters", showlegend = FALSE,
                      updatemenus = updatemenus)

fig


