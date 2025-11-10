#!/bin/awk -f
BEGIN{ 	s1=0;
	s2=0; 
	s1p=0
	s2p=0
	s11=0
	s21=0
	s12=0
	s22=0
	s13=0
	s23=0

	c=0; 
	print "tata:" s1, s2, c;
	mem=0
	memp=0
	mem1=0
	memp1=0
	mem2=0
	memp2=0
	mem3=0
	memp3=0

} 

{
if (($3-mem)>0 && ($2-memp>=0)){

	s1=($2-memp)/($3-mem+$2-memp)+s1; s2=(($2-memp)/($3-mem+$2-memp))^2+s2; c++;
	
	s11=($4-memp1)/($5-mem1+$4-memp1)+s11; s21=(($4-memp1)/($5-mem1+$4-memp1))^2+s21

	s12=($6-memp2+$8-memp3)/($7-mem2+$6-memp2+$9-mem1+$8-memp3)+s11; s22=(($6-memp2+$8-memp3)/($7-mem2+$6-memp2+$9-mem1+$8-memp3))^2+s22
	s13=($8-memp3)/($9-mem1+$8-memp3)+s13; s23=(($8-memp3)/($9-mem3+$6-memp3))^2+s23
	mem=$3;
	memp=$2;
	mem1=$3;
	memp1=$2;
	mem2=$3;
	memp2=$2;
	mem3=$3;
	memp3=$2;
	}
}

END{print "toto:", s1, s2, c;
	sigma=sqrt((s2+(s1^2)/c)/(c-1));
	epsi=sigma*4.5*sqrt(1/c);
	average=s1/c
	conf=epsi/average
	sigma1=sqrt((s21+(s11^2)/c)/(c-1));
	epsi1=sigma1*4.5*sqrt(1/c);
	average1=s11/c
	conf1=epsi1/average1
	sigma2=sqrt((s22+(s12^2)/c)/(c-1));
	epsi2=sigma2*4.5*sqrt(1/c);
	average2=s12/c
	conf2=epsi2/average2
	sigma3=sqrt((s23+(s13^2)/c)/(c-1));
	epsi3=sigma3*4.5*sqrt(1/c);
	average3=s13/c
	conf3=epsi3/average3

	#sigmap=sqrt((s2p+(s1p^2)/c)/(c-1));
	#epsip=sigmap*4.5*sqrt(1/c);
	print "gloable:" epsi, average, conf;
	print "donnees" epsi1, average1, conf1;
	print "video&voix:" epsi2, average2, conf2;
	}
