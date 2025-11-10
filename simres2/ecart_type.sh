#!/bin/awk -f
BEGIN{ 	s1=0;
	s2=0; 
	c=0; 
	s3=0;
	print "tata:" s1, s2, c;
} 

{
vale[c]=$2;
s1=$2+s1; s2=$2^2+s2; c++;
}
END{
	average=s1/c;
	for (i=1;i<=c;i++)
	{
	ecart+=(vale[i]-average)^2;
	}
	print sqrt(ecart/c);
}
