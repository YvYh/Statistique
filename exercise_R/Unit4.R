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

