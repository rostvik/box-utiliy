#!/bin/bash

# arr=()


for file in $(git diff --cached --name-only); do
    changed=$(echo $file | awk -F '/' '{print $1 "/" $2}')
    [[ $changed == roles/* ]] && dir_changed+="-r $changed\n"
done

dir_changed=$(echo -en $dir_changed | uniq)

docsible --comments --append --graph --no-backup --no-docsible $dir_changed
