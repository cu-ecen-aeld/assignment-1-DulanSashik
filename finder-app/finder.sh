#!/bin/bash


if [ $# -lt 2 ]; then
    echo "Error: Missing Argument"
    exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d $filesdir ]; then
    echo "Error: ${filesdir} is not a valid directory"
    exit 1
fi

file_count=$(find $filesdir -type f | wc -l)

Number_of_matching_lines=0

while IFS= read -r file; do
    match_count=$(grep -c $searchstr $file)
    ((Number_of_matching_lines += match_count))
done < <(find "$filesdir" -type f)

echo "The number of files are ${file_count} and the number of matching lines are ${Number_of_matching_lines}"

