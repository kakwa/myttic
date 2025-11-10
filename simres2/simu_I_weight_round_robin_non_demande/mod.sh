#!/bin/bash
export PATH=$PATH:/home/kakwa/ns-allinone-2.34/bin
t=`ls`
w=50
for i in $t
	do
	if [ -d $i ]; then
	cd $i
	w2=$(( 50 + $w  ))
	sed -i "s/\$q0n1 addQueueWeights 1 50/\$q0n1 addQueueWeights 1 100/" simul1.tcl
	sed -i "s/\$q0n1 addQueueWeights 2 $w/\$q0n1 addQueueWeights 2 $w2/" simul1.tcl
	cd ..
	w=$(( $w + 50 ))
	fi
	done

