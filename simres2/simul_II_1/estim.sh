#!/bin/awk -f
BEGIN{ 	s1=0;
	s2=0; 
	s1p=0
	s2p=0
	c=0; 
	print "tata:" s1, s2, c;
	mem=0
	memp=0
} 

{
if (($3-mem)>0 && ($2-memp>=0)){

	s1=($2-memp)/($3-mem)+s1; s2=(($2-memp)/($3-mem))^2+s2; c++;
	
	mem=$3;
	memp=$2;
	}
}

END{print "toto:", s1, s2, c;
	sigma=sqrt((s2+(s1^2)/c)/(c-1));
	epsi=sigma*4.5*sqrt(1/c);
	average=s1/c
	conf=epsi/average
	#sigmap=sqrt((s2p+(s1p^2)/c)/(c-1));
	#epsip=sigmap*4.5*sqrt(1/c);
	print epsi, average, conf;

	}
