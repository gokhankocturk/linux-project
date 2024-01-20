# Solution
# "-c" flagi "count" anlamina geliyor. Unique olarak ciktida sunulan degerlerin yaninda
# kac tane olduklari da yaziyor.
cat auth.log | grep "Failed password for invalid user" | awk '{print $11}' | sort | uniq -c > result.txt