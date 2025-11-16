input = $1
output = $2

cat input | cut -f1 -d | sort >> $output.txt 

