#Unit1 Exercise about Piechart
#one option is to directlt weite the data
#simple pie chart
sport <- c(9, 6, 5, 7)
lbls <- c("Rugby", "Football", "Basketball", "Other")
pie(sport, label=lbls, main="Pie chart of favourite sports")


#simple bar chart
barplot(sport, names.arg = lbls, main = "Bar chart of favourite sports",
        col = c("red", "blue", "orange", "pink"))


#another option is to loqd the data in Unit1_piechart.csv
#two options:wirte
data <- read.csv2("data_csv_files/Unit1_Piechart.csv", header = T)
#choose the file
#data <- read.csv(file.choose(), header=T, sep = ";")

#Declare vectors: values of the variable and frequencies
sport_vector <- data$Favourite_Sport
sport_vector
frequency_vector <- data$Frequency
frequency_vector
#now depict a piechart
pie(frequency_vector, labels = sport_vector, main = "Pie charts of favorite sport")
