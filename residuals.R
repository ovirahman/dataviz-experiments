data <- data.frame(x = c(2,5,7,10,14), y = c(6,8,14,18,15))




plot(data, pch = 19, cex = 1.5, xlim = c(0,18), ylim = c(0,20))
abline(lm(data$y~data$x))
segments(data$x, data$y, data$x, fit$fitted.values, lty = 2)
textxy(data$x, data$y, round(data$y,2),cex = 0.8,offset = 1.2)
textxy(data$x, fit$fitted.values+fit$residuals/2, round(residuals(fit),2),cex = 0.5,offset = 1.2)





study <- data.frame(hour = c(2,3,4,5,6,7,8,9),result = c(60,71,68,77,74,83,80,92))
plot(study)
study$result[3]<- 73
plot(study)
study$result[5]<- 69
plot(study)
abline(lm(study$result~study$hour))
lm(study$result~study$hour)




library(calibrate)
set.seed(234)
data<- read.csv("weight-height.csv")
data<- subset(data, data$Gender == "Male")
data <- data[sample(nrow(data),6),]
plot(data$Weight~data$Height, pch = 19, xlim = c(67.5,74))
abline(lm(data$Weight~data$Height))

fit <- lm(data$Weight~data$Height)
segments(data$Height, data$Weight, data$Height, fit$fitted.values, lty = 2)

textxy(data$Height, data$Weight, round(data$Weight,2),cex = 0.8,offset = 0.8)

