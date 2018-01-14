#!/bin/bash



dump=$(curl -s https://dumps.wikimedia.org/enwiki/ | tac | grep '<a href='  )


# Begining identifying string for the dump.
begining='<a href="'

# Ending identifying string for the dump.
ending='/">'

while read -r line; do
    item=$(echo "$line" | awk -F "$begining" '{print $2}' | awk -F "$ending" '{print $1}')
    if [[ "$item" != "latest" && ! -z $item && $item != ".." ]]; then
        echo "https://dumps.wikimedia.org/enwiki/${item}/enwiki-${item}-pages-articles-multistream.xml.bz2"
    fi

done <<< "$dump"


