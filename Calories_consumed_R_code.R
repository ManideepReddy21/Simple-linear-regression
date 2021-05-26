WG_CC <- read.csv(file.choose())
View(WG_CC)

#Exploratory Data Analysis
summary(WG_CC)

#Scatterplot
plot(WG_CC$Calories.Consumed,WG_CC$Weight.gained..grams.)

#Correlation coefficient(r)
cor(WG_CC$Calories.Consumed,WG_CC$Weight.gained..grams.)

#Simple linear regression model
reg <-lm(WG_CC$Weight.gained..grams.~ WG_CC$Calories.Consumed)
summary(reg)

rmse <- sqrt(mean(reg$residuals^2))
rmse

confint(reg,level=0.95)
predict(reg,interval='predict')


#Log Model
plot(log(WG_CC$Calories.Consumed),WG_CC$Weight.gained..grams.)
cor(log(WG_CC$Calories.Consumed),WG_CC$Weight.gained..grams.)

reg_log <- lm(WG_CC$Weight.gained..grams.~log(WG_CC$Calories.Consumed))

summary(reg_log)

rmse_log<- sqrt(mean(reg_log$residuals^2))
rmse_log

confint(reg_log,level=0.95)
predict(reg_log,interval='predict')

#Exp Model
plot(WG_CC$Calories.Consumed,log(WG_CC$Weight.gained..grams.))
cor(WG_CC$Calories.Consumed,log(WG_CC$Weight.gained..grams.))

reg_exp <- lm(log(WG_CC$Weight.gained..grams.) ~ WG_CC$Calories.Consumed)

summary(reg_exp)

reg_exp$residuals
logwt <- predict(reg_exp)
wtexp<-exp(logwt)


errorexp <- WG_CC$Weight.gained..grams.-wtexp
errorexp

rmse_exp <- sqrt(mean(errorexp^2))
rmse_exp

confint(reg_exp,level=0.95)
predict(reg_exp,interval='predict')

#Polynomial Transformation

plot(WG_CC$Calories.Consumed,log(WG_CC$Weight.gained..grams.))
plot(WG_CC$Calories.Consumed^2,log(WG_CC$Weight.gained..grams.))

cor(WG_CC$Calories.Consumed,log(WG_CC$Weight.gained..grams.))
cor(WG_CC$Calories.Consumed^2,log(WG_CC$Weight.gained..grams.))

reg2degree <- lm(log(WG_CC$Weight.gained..grams.) ~ WG_CC$Calories.Consumed + I(WG_CC$Calories.Consumed^2))
summary(reg2degree)

logpol<-predict(reg2degree)
wtpol <- exp(logpol)

errorPol<- WG_CC$Weight.gained..grams.-wtpol

rmsepol<- sqrt(mean(errorPol^2))
rmsepol

# Result
## Applying transformation is decreasing Multiple R Squared Value. So model doesnot need further transformation, Multiple R-squared:  0.8968



