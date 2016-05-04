'''
For pooling layer of CNN
'''
import numpy as np

def first_pool(input):
	# print input.ndim
	# return	input[0,0]
	return	np.amax(input)