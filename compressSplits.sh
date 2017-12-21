#!/bin/bash
splitDir="/root/splits"
log="/root/importSplitLog.log"
cd $splitDir
for i in $(ls /root/splits/*); do
    echo "Processing $i" >> $log
    #Compress the splits.
    zstd -z $i >> $log
    echo "Done with $i" >> $log
done
