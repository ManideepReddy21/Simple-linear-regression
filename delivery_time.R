DT_ST<- read.csv(file.choose())
View(DT_ST)


#Exploratory Data Analysis
summary(DT_ST)
ST<- DT_ST$SortingTime
DT<- DT_ST$DeliveryTime


#Scatterplot
plot(ST,DT)

#Correlation coefficient(r)
cor(ST,DT)

#Simple linear regression model
reg <-lm(DT~ST)
summary(reg)
#R-Squared Value is 0.6823


rmse <- sqrt(mean(reg$residuals^2))
rmse
#rmse value is 1.3983

confint(reg,level=0.95)
predict(reg,interval='predict')

#Log Transformation
plot(log(ST),DT)
cor(log(ST),DT)
#Correlation Coefficient R value is 0.833

reg_log<-lm(DT~log(ST))
summary(reg_log)
#R-squared value is 0.6954

rmse_log<- sqrt(mean(reg_log$residuals^2))
rmse_log
#rmse_log value is 2.733171

confint(reg_log,level=0.95)
predict(reg_log,interval='predict')

#Exp Model
plot(ST,log(DT))
cor(ST,log(DT))
#Correlation Coefficient R value is 0.8431

reg_exp<- lm(log(DT)~ST)
summary(reg_exp)
#R-Squared Value is 0.7109

reg_exp$residuals
logDT <- predict(reg_exp)
DTexp<-exp(logDT)

errorexp <- DT-DTexp
errorexp

rmse_exp <- sqrt(mean(errorexp^2))
rmse_exp

#Rmse_exp value is 2.940025

confint(reg_log,level=0.95)
predict(reg_log,interval='predict')

#Polynomial Transformation with quadratic model
plot(ST,log(DT))
plot(ST*ST,log(DT))

cor(ST,log(DT))
cor(ST*ST,log(DT))
#Correlation coefficient r value is 0.7882452

reg2degree<-lm(log(DT)~ST + I(ST^2))
summary(reg2degree)
#R-squared value is 0.7649

logpol2<- predict(reg2degree)
DTpol2<- exp(logpol2)

errorpol2<-DT-DTpol2
rmse2degree<-sqrt(mean(errorpol2^2))
rmse2degree
#rmse2degree  value is 2.799042

#Polynomial Transformation with cubic model
plot(ST,log(DT))
plot(ST*ST,log(DT))
plot(ST^3,log(DT))

cor(ST,log(DT))
cor(ST*ST,log(DT))
cor(ST^3,log(DT))

reg3degree<- lm(log(DT)~ST+I(ST^2)+I(ST^3))
summary(reg3degree)
#R-Squared value is 0.7819

logpol3<-predict(reg3degree)
DTpol3<-exp(logpol3)

errorpol3<-DT-DTpol3
rmse3degree<-sqrt(mean(errorpol3^2))
rmse3degree
#rmse3degree value is 2.706757

#Result
#R-squared value is 0.7819


