Emp_data <- read.csv(file.choose())
summary(Emp_data)

plot(Emp_data$Salary_hike,Emp_data$Churn_out_rate)
cor(Emp_data$Salary_hike,Emp_data$Churn_out_rate)

#Linear regression model
reg<-lm(Emp_data$Churn_out_rate~Emp_data$Salary_hike)
summary(reg)
#R-squared value is 0.8312

rmse<-sqrt(mean(reg$residuals^2))
rmse

#rmse value is 3.997528

confint(reg,level=0.95)
predict(reg,interval='predict')

#Log Transformation
plot(log(Emp_data$Salary_hike),Emp_data$Churn_out_rate)
cor(log(Emp_data$Salary_hike),Emp_data$Churn_out_rate)

reg_log<-lm(Emp_data$Churn_out_rate ~ log(Emp_data$Salary_hike))
summary(reg_log)
#R-squared value is 0.8489

rmse_log<- sqrt(mean(reg_log$residuals^2))
rmse_log

confint(reg_log,level=0.95)
predict(reg_log,interval='predict')

#Exponential Transformation

plot(Emp_data$Salary_hike,log(Emp_data$Churn_out_rate))
cor(Emp_data$Salary_hike,log(Emp_data$Churn_out_rate))

reg_Exp<- lm(log(Emp_data$Churn_out_rate)~Emp_data$Salary_hike)
summary(reg_Exp)
# Rsquared Value is 0.8735

reg_Exp$residuals
logchurnoutrate<-predict(reg_exp)
churnoutrateexp<- exp(logchurnoutrate)

errorexp<-Emp_data$Churn_out_rate-churnoutrateexp
errorexp

rmse_exp<-sqrt(mean(errorexp^2))
rmse_exp

confint(reg_exp,level=0.95)
predict(reg_exp,interval='predict')

#Result
#Rsquared value is 0.8735 ,That means this model will predict the output 87.35% time correct





