#statistics
#execute this file from bin
success=0
failure=0
total=0
cd ./data/runs/
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
success=$(expr $success - 1)
failure=$(expr $failure - 1)
total=$(expr $total - 1)
#find the result in out.txt saved in bin
echo "Success = $success" > ../../out.txt   #total number of sentences parsed
echo "failure = $failure" >> ../../out.txt   #total number of sentences not parsed
echo "Total = $total" >> ../../out.txt      
cd ../../