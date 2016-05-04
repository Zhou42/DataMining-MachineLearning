import scipy.io as scio 
import pickle
import numpy as np
# train
'''
dataFile = 'SVHN_trainData_lasagne.mat'
data = scio.loadmat(dataFile) 
# print type(data)
train_X = np.array(data['X_lasagne'])
train_y = np.array(data['y']).reshape(len(data['y']),)

# devide the training data into train and validation set
train_data = (train_X[:70000,:,:,:], train_y[:70000])
validation_data = (train_X[70001:,:,:,:], train_y[70001:])
# print type(train_data)

pickle.dump( train_data, open( "SVHN_train_lasagne.p", "wb" ) )
pickle.dump( validation_data, open( "SVHN_validation_lasagne.p", "wb" ) )

'''

# test
dataFile = 'SVHN_dataTest_lasagne.mat'
data = scio.loadmat(dataFile) 
# print type(data)
test_X = np.array(data['X_lasagne_test'])
test_y = np.array(data['y_test']).reshape(len(data['y_test']),)

test_data = (test_X, test_y)
# print type(train_data)

pickle.dump( test_data, open( "SVHN_test_lasagne.p", "wb" ) )


