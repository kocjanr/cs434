from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
import pandas as pd
import matplotlib
from sklearn.neighbors import KNeighborsClassifier
import numpy as np

iris_dataset = load_iris()

# print("Type of data: {}".format(type(iris_dataset['data'])))
# print("Shape of data: {}".format(iris_dataset['data'].shape))
# print("Rows: {}".format(iris_dataset['data'][:5]))
# print("Targets: \n{}".format(iris_dataset['target_names']))

training_data,testing_data,training_labels,testing_lables = train_test_split(iris_dataset['data'],iris_dataset['target'])

knn = KNeighborsClassifier(n_neighbors=1)
knn.fit(training_data,training_labels)
mystery_iris = np.array([[5,2.9,1,0.2]])

prediction = knn.predict(mystery_iris)
# print(iris_dataset['target_names'][prediction])

test_predictions = knn.predict(testing_data)
# print(test_predictions)

print("Score: {:.2}".format(np.mean(test_predictions==testing_lables)))
print(knn.score(testing_data,testing_lables))