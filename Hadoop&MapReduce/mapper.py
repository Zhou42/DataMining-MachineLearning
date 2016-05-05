#!/usr/bin/python

# Format of each line is:
# date\ttime\tstore name\titem description\tcost\tmethod of payment
#
# We want elements 2 (store name) and 4 (cost)
# We need to write them out to standard output, separated by a tab

import sys

for line in sys.stdin:
	# line.strip() will get rid of whitespaces at the beginning and the end; line.strip('0') will eliminiate '0's
    data = line.strip().split("\t")
    if len(data) == 6:
        date, time, store, item, cost, payment = data
        print "{0}\t{1}".format(store, cost)

'''
The brackets and characters within them (called format fields) are replaced with the objects passed into the str.format() method. A number in the brackets refers to the position of the object passed into the str.format() method.

>>>
>>> print '{0} and {1}'.format('spam', 'eggs')
spam and eggs
>>> print '{1} and {0}'.format('spam', 'eggs')
eggs and spam
'''
