BEGIN {
    realt = 0;	# real time
    usert = 0;	# user time
    syst = 0; 	# kernel o sys time
	count = 0;	
	print "real\tuser\tsys"
}
{
	realt += $2;
	usert += $4;
	syst += $6;
    count += 1;
    print $2, "\t", $4, "\t", $6
}
END {
    avgr = realt / count;
    avgu = usert / count;
    avgs = syst / count;
    printf "Average:\n\treal %.4f user %.4f sys %.4f\n", avgr, avgu, avgs
}
