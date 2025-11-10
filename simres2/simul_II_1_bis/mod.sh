#!/bin/bash
export PATH=$PATH:/home/kakwa/ns-allinone-2.34/bin
t=`ls`
tq=270
for i in $t
	do
	if [ -d $i ]; then
	cd $i
	sed -i "s/\$ns queue-limit \$nred \$ndest.*/\$ns queue-limit \$nred \$ndest $tq/" simul1.tcl
	        sed -i "s/exp set burst_time_.*/exp set burst_time_ 1ms/" simul1.tcl
		        sed -i "s/exp set idle_time_.*/exp set idle_time_ 2ms/" simul1.tcl
			        sed -i "s/exp set rate_.*/exp set rate_ 90Mb/" simul1.tcl
	tq=$(( $tq +8 ))
	cd ..
	fi
	done

