#! /bin/bash

#input:the name of the program and its nmon data, start & end time of each test case
#output the files needed by mysql for processing

PROG=$1
grep -e "$PROG" $PROG.nmon | grep "TOP" | cut -f 3,4 -d ',' > $PROG-top.log

grep -e "ZZZZ" $PROG.nmon | cut -f 2,3,4 -d ',' > $PROG-nmon-time.log 

./formatdatetime.sh $PROG-nmon-time.log > $PROG-nmon-time-format.log

paste -d ',' datetime_start.log datetime_end.log > $PROG-start-end-time.log

echo "use nmon" > mysql_proc.sql
echo "delete from nmon_zzzz;" >> mysql_proc.sql
echo "delete from nmon_top;" >> mysql_proc.sql
echo "delete from testcase;" >> mysql_proc.sql
echo "LOAD DATA LOCAL INFILE '$PROG-nmon-time-format.log' INTO TABLE nmon.nmon_zzzz FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (zzzz_tag, zzzz_date);" >> mysql_proc.sql
echo "LOAD DATA LOCAL INFILE '$PROG-top.log' INTO TABLE nmon.nmon_top FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (top_tag, top_cpu);" >> mysql_proc.sql
echo "LOAD DATA LOCAL INFILE '$PROG-start-end-time.log' INTO TABLE nmon.testcase FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (start, end);" >> mysql_proc.sql
echo "UPDATE nmon_top, nmon_zzzz SET top_date = zzzz_date WHERE top_tag = zzzz_tag;" >> mysql_proc.sql
echo "UPDATE testcase SET cpu = (select avg(nmon_top.top_cpu) from nmon_top where testcase.start < nmon_top.top_date and nmon_top.top_date < testcase.end );" >> mysql_proc.sql
echo "SELECT cpu FROM testcase ORDER BY start;" >> mysql_proc.sql

exit
