# Author: Chris Nogales
# Comment: I quelched some conversion warning, python -W ignore foo.py

#!/usr/bin/python
import pdb  # for DEBUG
import os
import svmlight
import numpy as np # I need dense arrays?

from sklearn.datasets import load_svmlight_file
from sklearn.cross_validation import train_test_split
from sklearn.naive_bayes import MultinomialNB # I only need binomial
#from sklearn.naive_bayes import GaussianNB # I only need binomial
#from sklearn.naive_bayes import MultinomialNB




#Import features
X, y = load_svmlight_file("./features")
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

#pdb.set_trace() # BREAKPOINT (press c to continue)
X_test, y_test = load_svmlight_file("./features") # Change this later
print "This is the size of X_tes: "
print X_test.shape #)
print "This is the size of y_test: "
print y_test.shape #

print X_test
pred = clf.predict(X_test);
print "Predictions: "
print pred
###############
score = clf.score(X_test, y_test) 
print score
