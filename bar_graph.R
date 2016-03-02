
#function that wrangles the data, showing the average dimesnions of certain species as a bar graph
bar_graph <- function(data_frame, x, y){
  new_df <- data_frame %>% 
  group_by(Species) %>% 
  summarise("avg_sepal_length" = mean(Sepal.Length), "avg_petal_length" = mean(Petal.Length),
            "avg_sepal_width" = mean(Sepal.Width), "avg_petal_width" = mean(Petal.Width)) %>% 
    filter(Species %in% x)
  
  
  #graph the data frame 
  plot_ly(new_df, x = Species, y = eval(parse(text = y)), type = "bar", 
          color = toRGB("Black")) %>% 
          layout(title = "Average Dimensions of Each Species") %>% 
  return()
}
