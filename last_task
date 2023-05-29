import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import plotly.express as px
import plotly.graph_objects as go
import seaborn as sns

data = pd.read_csv("titanic.csv")

table_gender = data.groupby(['Survived', 'Sex']).size().unstack()
print(table_gender)

#table_gender.plot(kind='pie', subplots=True, figsize=(8, 4), autopct='%1.1f%%')
#plt.show()

table_class = data.groupby(['Survived', 'Pclass']).size().unstack()
print(table_class)

table_class.plot(kind='pie', subplots=True, figsize=(12, 4), autopct='%1.1f%%')
plt.show()

# Third Task: Analyzing survival by age
data_age_not_null = data.dropna(subset=['Age'])
survived_ages = data_age_not_null[data_age_not_null['Survived'] == 1]['Age']
not_survived_ages = data_age_not_null[data_age_not_null['Survived'] == 0]['Age']

#fig, axs = plt.subplots(1, 2, figsize=(10, 5))
#axs[0].set_xlabel('Age')
#axs[0].set_ylabel('Frequency')
#axs[1].set_xlabel('Age')
#axs[1].set_ylabel('Frequency')

#survived_ages.plot.hist(ax=axs[0], title='Survived')
#not_survived_ages.plot.hist(ax=axs[1], title='Not Survived')

#fig.suptitle('Histograms of Ages for Survived and Not Survived Passengers')
#plt.show()

cheap_survived = data.query('Survived == 1 and Fare < 25')
expensive_survived =  data.query('Survived == 1 and Fare >= 25')

cheap_not_survived = data.query('Survived == 0 and Fare < 25')
expensive_not_survived =  data.query('Survived == 0 and Fare >= 25')

table_price = pd.DataFrame(data=[[len(cheap_survived), len(expensive_survived)],
                        [len(cheap_not_survived), len(expensive_not_survived)]],
                index=['Survived', 'Died'],
                columns=['Cheap', 'Expensive'])

print(table_price)
#table_price.plot(kind='pie', subplots=True, figsize=(12, 4), autopct='%1.1f%%')
#plt.show()

#fig = px.pie(table_price, values='Cheap', names='Cheap', title='Correlation between price and mortality')
#fig.show()
