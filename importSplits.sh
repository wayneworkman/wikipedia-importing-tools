#!/bin/bash
splitDir="/root/splits"
completeDir="/root/completed"
mkdir -p $completeDir
log="/root/importSplitLog.log"
preImportScript="/root/wikipedia-importing-tools/preimport.sql"
postImportScript="/root/wikipedia-importing-tools/postimport.sql"
stopFile="/root/stop"  #If the stop file exists, exit. This allows you to do touch /root/stop so you can reboot to speed things up.
cd $splitDir


source $preImportScript

for i in $(ls /root/splits/x*.sql.zst); do
    echo "Processing $i" >> $log
    #Decompress the splits & import.
    zstd -dc preimport.sql.zst $i postimport.sql.zst | mysql -f -D wikipedia >> $log
    mv $i $completeDir
    echo "Done with $i" >> $log
    if [[ -f $stopFile ]]; then
        exit
    fi
done

source $postImportScript

