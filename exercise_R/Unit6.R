#Exercise about lifespan
data_lifespan <- read.csv2("./data_csv_files/Unit6_Lifespan.csv", header = T)
#define variable
Lifespan <- data_lifespan$Lifespan
Price <- data_lifespan$Price
Use <- data_lifespan$Use

model_lifespan <- lm(Lifespan~Price+Use)
#help(lm)
summary(model_lifespan)

#Prediction
#punctual
predict.lm(model_lifespan, data.frame(Price=10, Use=0.5))
#confidence interval for the average value
predict.lm(model_lifespan, data.frame(Price=10, Use=0.5), interval = "confidence")
#confidence interval for the one value
predict.lm(model_lifespan, data.frame(Price=10, Use=0.5), interval = "prediction")

model2 <- lm(Lifespan~Price)
summary(model2)

#Voltage
data_voltage <- read.csv2("./data_csv_files/Unit6_Voltage.csv", header = T)
#define variables
Voltage <- data_voltage$Voltage
Current <- data_voltage$Current
#first draw a scatter plot to try and guess the relationship between the variables
plot(Voltage~Current, main="Dispersion graph", xlab="Voltage", ylab = "Current", col="blue")
#it looks like a logrithmic model could apply(we add a constant to avoid log(0))
model_log <- lm(Voltage~log(Current + 0.01))
summary(model_log)
#Rs=0.8901

#other posibilities
#linear model Rs=0.5441
summary(lm(Voltage~Current))
#double-log model Rs=0.471
summary(lm(log(Voltage+0.01)~log(Current+0.01)))

#lab session
data_gdp <- read.csv2("./data_csv_files/Data_GDP.csv", header = T)
Year <- data_gdp$Year
UR <- data_gdp$UR
GDP <- data_gdp$GDP
plot(UR~GDP, main="Dispersion graph", xlab="gdp", ylab = "ur", col="blue")
model_ln <- lm(UR~GDP)
summary(model_ln)
predict.lm(model_ln,data.frame(GDP=180),interval = "confidence")
help("predict.lm")
