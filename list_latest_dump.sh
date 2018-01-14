#!/bin/bash



dump=$(curl -s https://dumps.wikimedia.org/enwiki/ | tac | grep '<a href='  )


# Begining identifying string for the dump.
begining='<a href="'

# Ending identifying string for the dump.
ending='/">'

latest="0"
latestURL=""

while read -r line; do
    item=$(echo "$line" | awk -F "$begining" '{print $2}' | awk -F "$ending" '{print $1}')
    if [[ ! -z $item && "$item" != "latest" && $item != ".." ]]; then
        if [[ "$item" -gt "$latest" ]]; then
            latest=$item
            latestURL="https://dumps.wikimedia.org/enwiki/${item}/enwiki-${item}-pages-articles-multistream.xml.bz2"
        fi
    fi
done <<< "$dump"

echo $latestURL


