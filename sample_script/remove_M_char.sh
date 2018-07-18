
cat -v <inputfile

tr -d $'\r' < inputfile > outputfile
# or 
#tr -d '^M' < inputfile > outputfile

cat -v outputfile

