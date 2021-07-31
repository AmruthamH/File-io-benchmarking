#!/bin/bash

throughput_logfile=throughput_fileio.log
latency_logfile=latency_fileio.log

measure='latency'
for num_threads in 1 2 4 8
do
	for latency_value in '4m' '2m' '1m' '500k'
	do
		for latency_record_size in '4k'
		do
			for latency_access_pattern in 'WR' 'RR'
			do
    			./fileio $num_threads $latency_value $latency_access_pattern $latency_record_size $measure | tee -a $latency_logfile
    		done
    	done
    done
done

measure='throughput'
for num_threads in 1 2 4 8
do
	for throughput_value in '1g' '500m' '250m' '125m'
	do
		for throughput_record_size in '64k' '1m' '16m'
		do
			for throughput_access_pattern in 'WS' 'RS' 'WR' 'RR'
			do
    			./fileio $num_threads $throughput_value $throughput_access_pattern $throughput_record_size $measure | tee -a $throughput_logfile
    		done
    	done
    done
done