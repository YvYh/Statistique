#P7 example
#data_resources <- read.csv2(file.choose(),header=T)
data_resources <- read.csv2("./data_csv_files/Unit5_Resources.csv",header = T)
Resource <- data_resources$Resource
Price <- data_resources$Price
#Treat resource as a factor
Resource_Factor<- as.factor(Resource)
#get the ANOVA table
anova_resources <- aov(lm(Price~Resource_Factor))
summary(anova_resources)
#
require(graphics)
plot(TukeyHSD(anova_resources,"Resource_Factor",ordered=TRUE))

#P12 example
