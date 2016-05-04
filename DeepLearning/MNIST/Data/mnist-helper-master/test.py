from mnist_helpers import *

import cv2
import csv
# this is the image we want to distort
# test_image = './images//four.png'
import numpy as np


if __name__ == '__main__':

    # read the grayscale image
    # image = cv2.imread(test_image, 0)
	g = open('../train_distort_2.csv', 'wb')
	g_csv = csv.writer(g)
	
	f = np.loadtxt('../train_ver2.csv',delimiter=',',dtype='str')
	df = f.astype('float')
	n, d = df.shape
	
	for i in range(1):
		# print(df[i,1:].shape)
		image = np.reshape(df[i,1:],(28,28))
		distorted_image = elastic_transform(image, kernel_dim=15,
								alpha=5.5,
								sigma=35)
		row_distort = np.reshape(distorted_image,(1,28*28))
		# print(row_distort.shape)
		g_csv.writerow(row_distort[0])
		
	g.close();
    # just call the function elastic_transform function 
    # with a suitable kernel size, alpha and sigma
    # as a rule of thumb, if use sigma as a value near 6,
    # alpha 36-40, kernel size 13-15
    #
    # NOTE: the input image SHOULD be of square dimension,
    # ie no.of rows should be equal to number of cols.
    
    # image = cv2.resize(image, (30,30))

    # get the transformed image
	'''
    distorted_image = elastic_transform(image, kernel_dim=15,
                                        alpha=5.5,
                                        sigma=35)
	'''
    # cv2.imwrite('./images/distortd.png', distorted_image)
