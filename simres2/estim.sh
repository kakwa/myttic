#!/bin/awk -f
BEGIN{ 	s1=0;
	s2=0; 
	c=0; 
	print "tata:" s1, s2, c;
} 

{
s1=$2+s1; s2=$2^2+s2; c++;
}

END{print "toto:", s1, s2, c;
	sigma=sqrt((s2+(s1^2)/c)/(c-1));
	average=s1/c;
	epsi=sigma*4.5*sqrt(1/c);
	conf=epsi/average
	print epsi, average, conf;}
