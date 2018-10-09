#exe1
1-pbinom(2, size = 10, prob = 0.02)

#exe2
1-pbinom(0, size = 5, prob = 0.1)

#exe find n
#X~Bi(n,p=0.05)
#P[X<=1]<=0.1
pbinom(1, size = 77, prob=0.05)

#normal distribution
#in this file the decimal separator is '.' so we use read.csv
data_height <- read.csv("data_csv_files/Unit1_Heights.csv", header = T)
height <- data_height$Heights
#find the normal probability plot
qqnorm(height)
#do the shapiro-wilk test
shapiro.test(height)


pnorm(4.9, mean=5, sd=0.1, lower.tail=TRUE)
pnorm(4.8, mean=5, sd=0.1, lower.tail=FALSE)

pnorm(45, mean=25, sd=7, lower.tail=TRUE)
pnorm(45, mean=30, sd=3, lower.tail=TRUE)


pnorm(34, mean=30, sd=3, lower.tail=TRUE)

pbinom(5, size = 114, prob = 0.08)
