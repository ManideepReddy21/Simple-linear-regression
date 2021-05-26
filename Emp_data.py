# -*- coding: utf-8 -*-
"""
Created on Sun Jan 19 12:28:36 2020

@author: RaviTeja
"""
import pandas as pd # deals with data frame  
import numpy as np  # deals with numerical values

Emp_data = pd.read_csv("E:/DS/Assignments/Module7_Assignment/emp_data.csv")
Emp_data.describe()

import matplotlib.pylab as plt #for different types of plots

plt.scatter(x=Emp_data['Salary_hike'], y=Emp_data['Churn_out_rate'],color='green')# Scatter plot

np.corrcoef(Emp_data['Salary_hike'], Emp_data['Churn_out_rate']) #correlation

import statsmodels.formula.api as smf

model = smf.ols('Churn_out_rate ~ Salary_hike', data=Emp_data).fit()
#model.params # only parameters(beta,beta1)
model.summary()
#R-squared value is 0.831


pred1 = model.predict(pd.DataFrame(Emp_data['Salary_hike']))
pred1
print (model.conf_int(0.01)) # 99% confidence interval

res = Emp_data.Salary_hike - pred1
sqres = res*res
mse = np.mean(sqres)
rmse = np.sqrt(mse)
#Rmse value is 1618.563

######### Model building on Transformed Data
# Transforming variables

# Log Transformation
# x = log(Churn_out_rate); y = Salary_hike
plt.scatter(x=np.log(Emp_data['Salary_hike']),y=Emp_data['Churn_out_rate'],color='brown')
np.corrcoef(np.log(Emp_data['Salary_hike']), Emp_data['Churn_out_rate']) #correlation

model2 = smf.ols('Churn_out_rate ~ np.log(Salary_hike)', data=Emp_data).fit()
#model.params # only parameters(beta,beta1)
model2.summary()
#R-squared value is 0.849

pred2 = model2.predict(pd.DataFrame(Emp_data['Salary_hike']))
pred2
print (model2.conf_int(0.01)) # 99% confidence interval

res2 = Emp_data.Salary_hike - pred2
sqres2 = res2*res2
mse2 = np.mean(sqres2)
rmse2 = np.sqrt(mse2)
#rmse2 value is 1618.5692

# Exponential transformation
plt.scatter(x=Emp_data['Salary_hike'], y=np.log(Emp_data['Churn_out_rate']),color='orange')

np.corrcoef(Emp_data.Salary_hike, np.log(Emp_data.Churn_out_rate)) #correlation

model3 = smf.ols('np.log(Churn_out_rate) ~ Salary_hike',data=Emp_data).fit()
model3.summary()
#R-squared value is 0.874


pred_log = model3.predict(pd.DataFrame(Emp_data['Salary_hike']))
pred_log
pred3 =np.exp(pred_log)
pred3
print(model3.conf_int(0.01))

res3 = Emp_data.Salary_hike - pred3
sqres3 = res3*res3
mse3 = np.mean(sqres3)
rmse3 = np.sqrt(mse3)
#rmse3 value is 1618.644


#Result
#Rsquared value is 0.8735 ,That means this model will predict the output 87.4% time correct