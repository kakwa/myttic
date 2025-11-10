#!/bin/bash
export PATH=$PATH:/home/kakwa/ns-allinone-2.34/bin
t=`ls`

for i in $t
	do
	if [ -d $i ]; then
	cd $i
	time ns simul1.tcl &
	cd ..
	fi
	done

