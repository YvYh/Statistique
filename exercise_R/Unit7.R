#Unit 7
#Train Passengers
data_passengers <- read.csv2("./data_csv_files/Unit7_Passengers.csv",header = T)
Users <- data_passengers$USERS
Month <- data_passengers$MONTH
#ts-object
#frequency refers to the period of seasonality, if there is seasonality
#start is the time of the first observation
#end refers to the time of the last observation, optional if you need to specify it
ts_Users <- ts(Users, frequency = 12, start = c(1989,1), end = c(2015,12))
#plot the time series
#seasonality
plot(ts_Users,main="Time Series Plot", type="l",lwd=2,col="blue",xlab="Month-Year", ylab="Users")
#Now plot the decomposition of the time series into trend, seasonal component, and remainder(residual)
#s.windows: either the character string "periodic" or the span(in lags) of the loess window for seasonal extraction
plot(stl(ts_Users,s.window = "periodic"))

#arima
install.packages("forecast")
library(forecast)
model_best <- auto.arima(ts_Users)
model_best
# in this example you get model_1

#find the forecasts for the next 9 months
predictions <- predict(model_best,n.ahead = 12)
predictions
plot(predictions$pred, type="l",col="blue")
#plot the series plus the prediction
ts.plot(ts_Users, predictions$pred,lty=c(1,3),col=c(3,2))
help("ts.plot")

#1.96 is the critical point of a Normal(0,1) needed for the confidencde interval
upper <- predictions$pred + 1.96*predictions$se
lower <- predictions$pred - 1.96*predictions$se
plot(predictions$pred, col="blue")
lines(upper, col="red", lty=3)
lines(lower, col="red", lty=3)

actual <- c(6441.1, 6446.6, 7466.3, 7652.31, 7835.89, 8154.57, 8712.82, 8706.77,8762.54)
ts_actual <- ts(actual, frequency = 12, start = c(2016,1), end = c(2016,9))
plot(ts_actual, col="red", type="p", ylim=c(6000,9000))
lines(upper,col="blue", lty=3)
lines(lower,col="blue",lty=3)
points(predictions$pred,col="blue")

#predictions using function forecast
predictions_forecast <- forecast(model_best, h=9, level = 0.95)
plot(predictions_forecast)
predictions_forecast

predicted_values <- predictions_forecast$mean
predicted_values
predictied_lower <- predictions_forecast$lower
predictied_lower
predictied_upper <- predictions_forecast$upper
predictied_upper

#assess the accuaracy of the model
accuracy(model_best)
accuracy(predictions$pred, ts_actual)


data_passengers <- read.csv2("./data_csv_files/Data_Consumption.csv",header = T)
