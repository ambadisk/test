#input file containing texts to parse
filename="test.txt"
#lexicon
lexicon="english-conll-5000.xml"
exe="exe_sentences.txt"
success=0
failure=0
total=0
echo "Start" $(date) > out.txt
while read -r line
do 
	#Parsing each sentence with time constraint
	timeout 3s java -jar JTIG-0.0.3-jar-with-dependencies.jar -lexicon "$lexicon" -input_sentence "$line"
	
	#if [ $?  == 124 ]; then 
	#	echo "$line" >> exe_sentences.txt
	
	done < "$filename"
	echo "End" $(date) >> out.txt
RUNDIR="/cygdrive/c/Users/sampath/Desktop/JTIG-master/bin/data/runs"
cd $RUNDIR
RUNS=$(ls -1 $RUNDIR)
#cd $RUNDIR;rm -rf;cd ..
for A in $(ls -1)
do
	X=$(ls -1 $A/derivedtree* 2> /dev/null | wc -l)
	if (( $X >= 1 )); then
		success=$(expr $success + 1)
	else
		failure=$(expr $failure + 1)
	fi
	total=$(expr $total + 1)
done
echo "Success = $success" > out.txt   #total number of sentences parsed
echo "failure = $failure" >> out.txt   #total number of sentences not parsed
echo "Total = $total" >> out.txt      
