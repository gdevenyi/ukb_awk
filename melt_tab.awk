#!/usr/bin/awk -f
BEGIN {
    FS="\t"
    OFS="\t"
    print "SubjectID", "FieldID", "InstanceID", "ArrayID", "FieldValue"
}

NR==1 {
    for (i=1;i<=NF;i++){
	split($(i),a,".")
	h[i]=a[2]"\t"a[3]"\t"a[4]
    }
    printf "       " > "/dev/stderr"
}

NR>1 {
    for (i=2;i<=NF;i++){
	if ($(i) != "NA") {
	    print $1, h[i], $(i)
	}
    }
    if ((NR % 10) == 0){
	printf "\b\b\b\b\b\b\b%7d", NR > "/dev/stderr"
    }
}

END {
    print "DONE" > "/dev/stderr"
}
