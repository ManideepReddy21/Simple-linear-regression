# -*- coding: utf-8 -*-
"""
Created on Sun Jan 19 11:17:30 2020

@author: RaviTeja
"""
# For reading data set
# importing necessary libraries
import pandas as pd # deals with data frame  
import numpy as np  # deals with numerical values

sal_data = pd.read_csv("E:/DS/Assignments/Module7_Assignment/Salary_Data.csv")
sal_data.describe()
import matplotlib.pylab as plt #for different types of plots
plt.scatter(x=sal_data['YearsExperience'], y=sal_data['Salary'],color='green')# Scatter plot

np.corrcoef(sal_data['YearsExperience'], sal_data['Salary']) #correlation

import statsmodels.formula.api as smf

model = smf.ols('Salary ~ YearsExperience', data=sal_data).fit()
#model.params # only parameters(beta,beta1)
model.summary()
#R-squared value is 0.957

pred1 = model.predict(pd.DataFrame(sal_data['YearsExperience']))
pred1
print (model.conf_int(0.01)) # 99% confidence interval

res = sal_data.YearsExperience - pred1
sqres = res*res
mse = np.mean(sqres)
rmse = np.sqrt(mse)
rmse
#Rmse value is 80440.8450

#Result
#Rsquared value is 0.957 ,That means this model will predict the output 95.7% time correct