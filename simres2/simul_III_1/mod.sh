#!/bin/bash
export PATH=$PATH:/home/kakwa/ns-allinone-2.34/bin
t=`ls`
tq=0
for i in $t
	do
	if [ -d $i ]; then
	cd $i
	sed -i "s/q0n1 configQ 1 0.*/q0n1 configQ 1 0 $tq 56 1/" simul1.tcl
	tq=$(( $tq +10 ))
	cd ..
	fi
	done

