#!/bin/bash
export PATH=$PATH:/home/kakwa/ns-allinone-2.34/bin
t=`ls`

for i in $t
	do
	if [ -d $i ]; then
	cd $i
	sed -i "s/addQueueWeights 3 150/addQueueWeights 3 350/" simul1.tcl
	cd ..
	fi
	done

