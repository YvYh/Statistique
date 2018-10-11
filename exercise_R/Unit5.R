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
data_co2 <- read.csv2("./data_csv_files/Unit5_CO2.csv",header = T)
CO2<-data_co2$CO2
Machine<-data_co2$Machine
Machine_Factor <- as.factor(Machine)
anova_machine <- aov(lm(CO2~Machine_Factor))
summary(anova_machine)
require(graphics)
plot(TukeyHSD(anova_machine,"Machine_Factor",ordered = T))


#two factors
data_computer<-read.csv2("./data_csv_files/Unit5_Computers.csv",header = T)
Card <- data_computer$CARD
Speed <- data_computer$SPEED
Performance <- data_computer$Performance
Card_Factor <- as.factor(Card)
Speed_Factor <- as.factor(Speed)
anova_two_factors <- aov(lm(Performance~Card_Factor*Speed_Factor))
summary(anova_two_factors)
#the two factors and the interaction are significant
#now try to show the means plot
#table of means
aggregate(Performance~Card_Factor+Speed_Factor, FUN = "mean")
#interaction plot: performance as a function of speed, for each value
interaction.plot(Speed_Factor,Card_Factor,Performance,
                 xlab = "Speed_Factor",
                 ylab = "Performance",
                 trace.label = "Card_Factor",
                 main="Interaction Plot",
                 col = c("blue","red","green"),
                 bg=c("blue","red","green"),
                 pch = c(18,24,22),
                 type = "b")
