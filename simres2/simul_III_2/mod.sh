#!/bin/bash
export PATH=$PATH:/home/kakwa/ns-allinone-2.34/bin
t=`ls`
tq=10000000
for i in $t
	do
	if [ -d $i ]; then
	cd $i
	sed -i "s/] TokenBucket 10.*/] TokenBucket 10 $tq 75000/" simul1.tcl
	tq=$(( $tq + 10000000 ))
	cd ..
	fi
	done

