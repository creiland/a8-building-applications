require(dplyr)
require(plotly)

#creates data frames containing the average length and width 
#for the petals and sepal of each species
average_size <- function(new_col_name, avg_col){
  col_name <- group_by(iris, Species) %>% summarise(col_name = mean(avg_col))
  return(col_name)
}

average_size(avg_sepal_length, Petal.Length)

#avg_sepal_length <- group_by(iris, Species) %>% summarise(avg_sepal_length = mean(Sepal.Length))
#avg_petal_length <- group_by(iris, Species) %>% summarise(avg_petal_length = mean(Petal.Length))
#avg_sepal_width <- group_by(iris, Species) %>% summarise(avg_sepal_width = mean(Petal.Width))
#avg_petal_width <- group_by(iris, Species) %>% summarise(avg_petal_width = mean(Petal.Width))

#joins the  data  frames into two data frames, one for length and one for width
avg_length <- full_join(avg_sepal_length, avg_petal_length, by = NULL, copy = FALSE)
avg_width <- full_join(avg_sepal_width, avg_petal_width, by = NULL, copy = FALSE)
avg_length_and_width <- full_join(avg_length, avg_width, by = NULL, copy = FALSE)

#rename the columns in avg_length_and_width
names(avg_length_and_width)[2] <- "Average Sepal Length"
names(avg_length_and_width)[3] <- "Average Petal Length"
names(avg_length_and_width)[4] <- "Average Sepal Width"
names(avg_length_and_width)[5] <- "Average Petal Width"

avg_setosa <- filter(avg_length_and_width, Species == "setosa")
avg_setosa <- select(avg_setosa, contains("Average"))

#creates a bar graph for each of the 
setosa_graph <- plot_ly(
  x = colnames(avg_setosa),
  y = as.numeric(avg_setosa[1,]),
  name = "setosa",
  type = "bar",
  marker = list(color = toRGB("black"))
)
setosa_graph
