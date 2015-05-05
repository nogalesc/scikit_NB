# Author: Chris Nogales
# Comment: I quelched some conversion warning, python -W ignore foo.py

#!/usr/bin/python
import pdb  # for DEBUG
import os
import svmlight
import numpy as np # I need dense arrays?
import csv   # Save features to csv file
import matplotlib.pyplot as plt # I want nice plots

from scipy.sparse import coo_matrix # Sparse matrix in coordinate format
from sklearn.datasets import load_svmlight_file
from sklearn.cross_validation import train_test_split
from sklearn.naive_bayes import MultinomialNB # I only need binomial
#from sklearn.naive_bayes import GaussianNB # I only need binomial
#from sklearn.naive_bayes import MultinomialNB


#---------functions--------#
def plot_coo_matrix(m):
    if not isinstance(m, coo_matrix):
        m = coo_matrix(m)
    fig = plt.figure()
    ax = fig.add_subplot(111, axisbg='black')
    ax.plot(m.col, m.row, 's', color='white', ms=1)
    ax.set_xlim(0, m.shape[1])
    ax.set_ylim(0, m.shape[0])
    ax.set_aspect('equal')
    for spine in ax.spines.values():
        spine.set_visible(False)
    ax.invert_yaxis()
    ax.set_aspect('equal')
    ax.set_xticks([])
    ax.set_yticks([])
    return ax
#--------------------------#

#Import features
X, y = load_svmlight_file("./70_shuffled_features")
print "Done importing features..." 

# Split the data into 80% training set and 20% validation set
TEST_SIZE = 0.2
RANDOM_STATE = 0
X_train, X_val, y_train, y_val = train_test_split(X, y, test_size=TEST_SIZE, random_state=RANDOM_STATE)
print "Done spliting training and validation data..." 

# What is the size of testing?
X.shape, y.shape
print "This is the size of X: "
print X.shape # (3833, 1901)
print "This is the size of y: "
print y.shape # (3833,)
# y_pred = clf.predict_proba(X_val)[:, 1]


# Declare Naive Bayes classifier clf
#clf = GaussianNB()
clf = MultinomialNB()
# Do not work:
#myX = X_train.toarray()
#myy = y_train.toarray()

#myX = np.asarray(X_train)
#myy = np.asarray(y_train)
#clf.fit(myX, myy)
clf.fit(X_train, y_train)
print "Done creating GaussianNB classifier ..." 

###############

X_test, y_test = load_svmlight_file("./30_shuffled_features") # Change this later
#pdb.set_trace() # BREAKPOINT (press c to continue)
print "This is the size of X_tes: "
print X_test.shape #
print "This is the size of y_test: "
print y_test.shape #
print X_test
pred = clf.predict(X_test);
print "Predictions: "
print pred


###############
score = clf.score(X_test, y_test) 
print score
plt.spy(X_test)
plt.show()
plt.hold(True)

# ax = plot_coo_matrix(X_test)
# ax.figure.show()