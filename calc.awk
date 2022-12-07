#!/usr/bin/awk

function std_dev(data, count, avg) {
    sum = 0;
    for (i = 0; i < count; ++i) {
        sum += (data[i] - avg) ^ 2;
    }
    return sqrt(sum/(count - 1))
}

BEGIN {
    realt = 0;	# real time
    usert = 0;	# user time
    syst = 0; 	# kernel o sys time
    count = 0;
    print "\033[1;32mData:\033[0m"
    print "-------------------------"
    print "\033[1;34mreal\tuser\tsys\033[0m"
}
{
    # Sums for calculate average:
    realt += $2;
    usert += $4;    
    syst += $6;
    # Save the values in the array for std:
    r_data[count] = $2;
    u_data[count] = $4;
    s_data[count] = $6;
    # Count rows in file:
    count += 1;
    # Print row:
    print $2, "\t", $4, "\t", $6
}
END {
    print "--------------------------"
    avgr = realt / count;
    avgu = usert / count;
    avgs = syst / count;
    print "\033[1;32mAverage:\033[0m"
    printf "\t\033[1;34mreal\033[0m %.4f", avgr
    printf "\t\033[1;34muser\033[0m %.4f", avgu
    printf "\t\033[1;34msys\033[0m %.4f\n", avgs
    stdr = std_dev(r_data, count, avgr);
    stdu = std_dev(u_data, count, avgu);
    stds = std_dev(s_data, count, avgs);
    print "\033[1;32mStandard deviation:\033[0m"
    printf "\t\033[1;34mreal\033[0m %.4f", stdr
    printf "\t\033[1;34muser\033[0m %.4f", stdu
    printf "\t\033[1;34msys\033[0m %.4f\n", stds
}
