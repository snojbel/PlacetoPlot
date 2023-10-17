

library(ggplot2)
library(plotly)
library(viridisLite)
library(viridis)


fig <- plot_ly() %>% 
  
  add_lines(x = c("a","b","c"), y = c(1,3,2))%>% 
  
  layout(title="sample figure", xaxis = list(title = 'x'), yaxis = list(title = 'y'), plot_bgcolor = "#c7daec") 


fig

# Scatter plots ----------------------------------------------------------------


fig <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length)


fig


fig <- plot_ly(data = iris, type = "scatter", mode = "markers", x = ~Sepal.Length, y = ~Petal.Length,
               
               marker = list(size = 10,
                             
                             color = 'rgba(255, 182, 193, .9)',
                             
                             line = list(color = 'rgba(152, 0, 0, .8)',
                                         
                                         width = 2)))

fig <- fig %>% layout(title = 'Styled Scatter',
                      
                      yaxis = list(zeroline = FALSE),
                      
                      xaxis = list(zeroline = FALSE))


fig



# Several trace same plot

trace_0 <- rnorm(100, mean = 5)

trace_1 <- rnorm(100, mean = 0)

trace_2 <- rnorm(100, mean = -5)

x <- c(1:100)


data <- data.frame(x, trace_0, trace_1, trace_2)


fig <- plot_ly(data, x = ~x)

fig <- fig %>% add_trace(y = ~trace_0, type = "scatter", name = 'trace 0',mode = 'lines')

fig <- fig %>% add_trace(y = ~trace_1, type = "scatter", name = 'trace 1', mode = 'lines+markers')

fig <- fig %>% add_trace(y = ~trace_2, type = "scatter", name = 'trace 2', mode = 'markers')

fig <- fig %>% layout(title = 'Three types of plotting',
                      
                      yaxis = list(title = "Time"),
                      
                      xaxis = list(zeroline = FALSE, title = "Value"))


fig

# Qualitative colors ----------------------------------------------------------
iris <- iris


fig <- plot_ly(data = iris, type = "scatter", mode = "markers", x = ~Sepal.Length, y = ~Petal.Length, color = ~Species)
fig

fig <- plot_ly(data = iris, type = "scatter", mode = "markers", x = ~Sepal.Length, y = ~Petal.Length, color = ~Species, colors = "Set1")
fig

pal <- c("violet", "cadetblue2", "darkgreen")
fig <- plot_ly(data = iris, type = "scatter", mode = "markers", x = ~Sepal.Length, y = ~Petal.Length, color = ~Species, colors = pal)
fig

#To ensure the wanted species gets the right color:
pal <- c("violet", "cadetblue2", "darkgreen")
pal <- setNames(pal, c("virginica", "setosa", "versicolor"))


fig <- plot_ly(data = iris,type = "scatter", mode = "markers", x = ~Sepal.Length, y = ~Petal.Length, color = ~Species, colors = pal)
fig



# Adding color and size mapping and data labels on hover



d <- diamonds[sample(nrow(diamonds), 1000), ]


fig <- plot_ly(
  
  data =d, x = ~carat, y = ~price,
  type = "scatter", mode = "markers",
  
  # Hover text:
  
  text = ~paste("Price: ", price, '$<br>Cut:', cut),
  color = ~carat, size = ~carat
  
)

fig <- fig %>%layout(title = 'Three types of plotting',
         
         yaxis = list(zeroline = FALSE, title = "Value"),
         
         xaxis = list(zeroline = FALSE, title = "Carat"))

fig
