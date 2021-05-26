sal_data <- read.csv(file.choose())
summary(sal_data)
View(sal_data)

plot(sal_data$YearsExperience,sal_data$Salary)
cor(sal_data$YearsExperience,sal_data$Salary)
#CorrelationCoefficeint R value is 0.978


#Linear Regression Model
reg<-lm(sal_data$Salary~sal_data$YearsExperience)
summary(reg)

#R-squared value is 0.957

rmse<-sqrt(mean(reg$residuals^2))
rmse

#rmse value is 5592.044

confint(reg,level=0.95)
predict(reg,interval='predict')

#Result
#Rsquared value is 0.957 ,That means this model will predict the output 95.7% time correct