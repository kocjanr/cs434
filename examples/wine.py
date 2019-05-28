#TODO name
# descripton
# http://mlr.cs.umass.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv

DATASET_URL = 'http://mlr.cs.umass.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv'
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn import preprocessing
from sklearn.ensemble import RandomForestRegressor
from sklearn.pipeline import make_pipeline
from sklearn.model_selection import GridSearchCV
from sklearn.metrics import mean_squared_error,r2_score
import joblib

data = pd.read_csv(DATASET_URL,sep=';')
# print(data.head())
# print(data.describe())