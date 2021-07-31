#!/bin/bash


record_size='4k'


#calculating latency
for num_threads in 1 2 4 8
do	
	for file_size in '4m' '2m' '1m' '500k'
	do
		iozone -T -t $num_threads -s$file_size -r$record_size -i 0 -i 2 -l O_DIRECT -+z -O -b latency_file.xlsx
	done

done


#caculating throughput

for num_threads in 1 2 4 8
do	
	for file_size in '1g' '500m' '250m' '125m'
	do
		for records in '64k' '1m' '16m'
		do
			iozone -T -t $num_threads -s$file_size -r$records -i 0 -i 1 -i 2 -l O_DIRECT -+z -b throughput.xlsx
		done	
	done

done



