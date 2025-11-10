#!/bin/bash
export PATH=$PATH:/home/kakwa/ns-allinone-2.34/bin
t=`ls`

for i in $t
	do
	if [ -d $i ]; then
	urxvt -e watch ./estim.sh $i/trace1 &
	fi
	done

