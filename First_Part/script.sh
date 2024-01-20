# Solution 1
cat event_history.csv | grep -i paul | grep TerminateInstances | grep -Eo "i-.{17}" | sort | uniq | tee result1.txt

# Solution 2
cat event_history.csv | grep -i paul | grep TerminateInstances | grep -Eo "i-.{17}" | sort | uniq  >  result2.txt

# Solution 3
cat event_history.csv | grep -i paul | grep TerminateInstances | grep -Eo “i-.[a-zA-Z0-9]{17}” | sort | uniq  >  result3.txt