#!/bin/bash
echo "=== Log Monitoring Script ==="
logfile="sample.log"
error_count=$(grep -c "ERROR" $logfile)
echo "Total errors found: $error_count"

if [ $error_count -gt 2 ]
then
    echo "WARNING: High number of errors detected!"
else 
    echo "Error count is normal."
fi

echo "=== Error Details ==="
grep "ERROR" $logfile | awk '{print $1, $3 ,$4}'
