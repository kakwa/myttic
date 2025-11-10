#!/bin/awk -f
BEGIN{ 
	s1=0;
	s2=0; 
	c=0; 
	s1_vid=0;
	s2_vid=0; 
	s1_vx=0;
	s2_vx=0; 
	s1_d=0;
	s2_d=0;
}
{
s1=$2+s1; s2=$2^2+s2; c++;
s1_vid=$3+s1_vid; s2_vid=$3^2+s2_vid;
s1_vx=$4+s1_vx; s2_vx=$4^2+s2_vx;
s1_d=$5+s1_d; s2_d=$5^2+s2_d;
}

END{
	sigma=sqrt((s2+(s1^2)/c)/(c-1));
	average=s1/c;
	epsi=sigma*4.5*sqrt(1/c);
	conf=epsi/average

	sigma_vid=sqrt((s2_vid+(s1_vid^2)/c)/(c-1));
	average_vid=s1_vid/c;
	epsi_vid=sigma_vid*4.5*sqrt(1/c);
	conf_vid=epsi_vid/average_vid

	sigma_vx=sqrt((s2_vx+(s1_vx^2)/c)/(c-1));
	average_vx=s1_vx/c;
	epsi_vx=sigma_vx*4.5*sqrt(1/c);
	conf_vx=epsi_vx/average_vx

	sigma_d=sqrt((s2_d+(s1_d^2)/c)/(c-1));
	average_d=s1_d/c;
	epsi_d=sigma_d*4.5*sqrt(1/c);
	conf_d=epsi_d/average_d


	print "trafic epsilonne  moyenne  confiance";
	print "globale:"  epsi, average, conf;
	print "video:"  epsi_vid, average_vid, conf_vid;
	print "voix:"  epsi_vx, average_vx, conf_vx;
	print "donnees:"  epsi_d, average_d, conf_d;
	
	}
