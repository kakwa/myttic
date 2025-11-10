#!/bin/bash
export PATH=$PATH:/home/kakwa/ns-allinone-2.34/bin
tr=`ls`
t=0
r=30
for i in $tr
	do
	if [ -d $i ]; then
	cd $i
	rm .simul1.tcl.swp
	#sed -i "s/set numQueues_ 3/set numQueues_ 1/" simul1.tcl
	#sed -i "s/setNumPrec 3/setNumPrec 1/" simul1.tcl
	#sed -i "s/addPHBEntry 11 1 0/addPHBEntry 11 0 0/" simul1.tcl
	#sed -i "s/addPHBEntry 12 2 0/addPHBEntry 12 0 0/" simul1.tcl
	#sed -i "s/\$q0n1 configQ 1 0 999999990 999999999 1//" simul1.tcl
	#sed -i "s/\$q0n1 configQ 2 0 999999990 999999999 1//" simul1.tcl
	#sed -i "s/\$q0n1 setSchedularMode WRR//" simul1.tcl
	sed -i "s/addQueueWeights 1.*/addQueueWeights 1 50/" simul1.tcl
	sed -i "s/addQueueWeights 2.*/addQueueWeights 2 550/" simul1.tcl
	sed -i "s/exp set idle_time_.*/exp set idle_time_ $t\ms/" simul1.tcl
	sed -i "s/exp set rate_.*/exp set rate_ $r\Mb/" simul1.tcl
	t=$(( $t + 2  ))
	r=$(( $r + 60  ))
	#sed -i "s/\$q0n1 setMREDMode DROP 1//" simul1.tcl
	#sed -i "s/\$q0n1 setMREDMode DROP 2//" simul1.tcl
	cd ..
	fi
	done

