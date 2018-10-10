#first exercise about confidence intervals for the mean
income <- c(125,135,145,130,120,145,125,130,150,145)
mean(income)
sd(income)


#this conmmand directly computes the confidence interval
t.test(income, conf.level = 0.95)

#when sigma is known
install.packages('TeachingDemos')
library(TeachingDemos)
z.test(income, sd=50)

#confidence interval about the proportion
prop.test(120,200, conf.level = 0.95)


#example
before <- c(26.2,20.3,25.4,19.6,21.5,28.3,23.7,24)
after <-c(24.1,21.3,23.7,18,20.1,25.8,22.4,21.4)
difference <- before-after
t.test(difference)

t.test(difference, conf.level = 0)

#exemple
speed <- c(69,60,80,85,68,74,60,86,92)
t.test(speed, mu=70,alternative = "two.sides") #H1:not equal

t.test(speed, mu=70, alternative = "less")
t.test(speed, mu=70, alternative = "greater")

#unites produces x:defective
prop.test(2,20,p=0.05,alternative = "two.sided")
prop.test(20,200,p=0.05,alternative = "two.sided")
