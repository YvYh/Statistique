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


#Unit1 exercise about students heights
#load the data in Unit1_Heights.csv
data_height <- read.csv("data_csv_files/Unit1_Heights.csv", header = T)
data_height
#another way of creating varaibles is bu indicating the column:
Heights <- data_height[,1]
Heights

#now compute the mean
mean(Heights)
#and the median
median(Heights)
quantile(Heights)

#or a specific percentile
quantile(Heights,0.25)

#and a histogram (with some of the many options available)
hist(Heights, breaks = c(1.6, 1.7, 1.8, 1.9), col="blue", main="Histogram", 
    xlab="Height", ylab="Frequency")
hist(Heights,col="blue",main="histogram",xlab="Height", ylab = "Frequency")

#range
range_Heights <- max(Heights) - min(Heights)
range_Heights

#interquartile range
IQR(Heights)
quantile(Heights)

#standard deviation
sd(Heights)

#variance
var(Heights)

#coefficient of variation.
CV <- function(mean, sd){
  (sd/mean)*100
}
CV(mean= mean(Heights), sd=sd(Heights))
CV(3,2)

#Skewness(asymetry) coefficient and Kurtosis
#install.packages("moments")
library(moments)
skewness(Heights)
kurtosis(Heights)

#depict the box and whisker plot
#hoeizontal graph here
boxplot(Heights, horizontal = TRUE, main="Box-Whisker plot",
        xlab="Heights", ylab="values")
abline(v=mean(Heights), col="red")

data_expenses <- read.csv("data_csv_files/Data_Expenses.csv",header = T, sep=";", dec = ",")
length(data_expenses$ExpensesMay)

mean(data_expenses$ExpensesMay)
median(data_expenses$ExpensesMay)
q1<-quantile(data_expenses$ExpensesMay, 0.25)
q3<-quantile(data_expenses$ExpensesMay, 0.75)
may <- data_expenses$ExpensesMay
var(may)
sd(may)
max(may)-min(may)
q3-q1
IQR(may)
quantile(may,0.85)