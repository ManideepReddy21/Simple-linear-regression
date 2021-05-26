# -*- coding: utf-8 -*-
"""
Created on Sat Jan 18 20:37:48 2020

@author: Ravi Teja
"""
import pandas as pd # deals with data frame  
import numpy as np  # deals with numerical values

wgcc = pd.read_csv("E:/DS/Assignments/Module7_Assignment/calories_consumed_1.csv")
wgcc.describe()

import matplotlib.pylab as plt #for different types of plots

plt.scatter(x=wgcc['CaloriesConsumed'], y=wgcc['Weightgained'],color='green')# Scatter plot

np.corrcoef(wgcc['CaloriesConsumed'], wgcc['Weightgained']) #correlation

import statsmodels.formula.api as smf

model = smf.ols('Weightgained ~ CaloriesConsumed', data=wgcc).fit()
#model.params # only parameters(beta,beta1)
model.summary()
#R-squared value is 0.897

pred1 = model.predict(pd.DataFrame(wgcc['CaloriesConsumed']))
pred1
print (model.conf_int(0.01)) # 99% confidence interval

res = wgcc.CaloriesConsumed - pred1
sqres = res*res
mse = np.mean(sqres)
rmse = np.sqrt(mse)
#Rmse value is 2027.040

######### Model building on Transformed Data
# Transforming variables

# Log Transformation
# x = log(CaloriesConsumed); y = Weightgained
plt.scatter(x=np.log(wgcc['CaloriesConsumed']),y=wgcc['Weightgained'],color='brown')
np.corrcoef(np.log(wgcc['CaloriesConsumed']), wgcc['Weightgained']) #correlation

model2 = smf.ols('Weightgained ~ np.log(CaloriesConsumed)', data=wgcc).fit()
#model.params # only parameters(beta,beta1)
model2.summary()
#R-squared value is 0.808

pred2 = model2.predict(pd.DataFrame(wgcc['CaloriesConsumed']))
pred2
print (model2.conf_int(0.01)) # 99% confidence interval

res2 = wgcc.CaloriesConsumed - pred2
sqres2 = res2*res2
mse2 = np.mean(sqres2)
rmse2 = np.sqrt(mse2)
#rmse2 value is 2031.431

# Exponential transformation
plt.scatter(x=wgcc['CaloriesConsumed'], y=np.log(wgcc['Weightgained']),color='orange')

np.corrcoef(wgcc.CaloriesConsumed, np.log(wgcc.Weightgained)) #correlation

model3 = smf.ols('np.log(Weightgained) ~ CaloriesConsumed',data=wgcc).fit()
model3.summary()
#R-squared value is 0.878


pred_log = model3.predict(pd.DataFrame(wgcc['CaloriesConsumed']))
pred_log
pred3 =np.exp(pred_log)
pred3
print(model3.conf_int(0.01))

res3 = wgcc.CaloriesConsumed - pred3
sqres3 = res3*res3
mse3 = np.mean(sqres3)
rmse3 = np.sqrt(mse3)
#rmse3 value is 2033.099

 #Result
## Applying transformation is decreasing Multiple R Squared Value. So model doesnot need further transformation, Multiple R-squared:  0.8968