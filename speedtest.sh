#!/bin/bash

# This avoids that the OS interprete
# the comma as a separator of the 
# integer and the decimal part.
export LC_NUMERIC=C

# File to save the results. Only for unix systems.
# So it must be deleted before do the test.
rm -rf /tmp/exetime		

for x in {1..10}	
do
	# Don't forget to install 'time':
	# Debian/Ubuntu: sudo apt-get install time
    /usr/bin/time -f "real %e user %U sys %S" -a -o /tmp/exetime $@
done

# Calculate the average of time execution
awk -f average.awk /tmp/exetime

