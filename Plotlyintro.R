

library(ggplot2)
library(plotly)
library(viridisLite)
library(viridis)


fig <- plot_ly() %>% 
  
  add_lines(x = c("a","b","c"), y = c(1,3,2))%>% 
  
  layout(title="sample figure", xaxis = list(title = 'x'), yaxis = list(title = 'y'), plot_bgcolor = "#c7daec") 


fig
