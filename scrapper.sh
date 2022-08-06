#!/bin/bash

echo "<---------------------------"Starting Scrapping propakistani"------------------------------------->"

wget -r -l1 --no-parent -A ".html" https://propakistani.pk/

#Copying the index file to our current directory where our scrapping script resides.
cp propakistani.pk/index.html . && rm -rf propakistani.pk

#Extracting all headings urls
cat index.html | grep "nav-link" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" | head -n 9 > url

#Extracting all headings
cat index.html | grep "nav-link" | sed 's/<[^>]*>//g' > heading
sed -n '1,4p;6,10p' heading  > FILENAME

#extracting artict titles againts each url in the headings.
while IFS= read -r file1 && IFS= read -r file2 <&3; do
    curl "$file1" | grep "entry-title" | sed 's/<[^>]*>//g' | sed 's/&.....;\|&....;//g' | head -n 15 > "$file2"
done < url 3<FILENAME
sed -n '3,$p' Perspective > perspective && rm Perspective

echo "<---------------------------"Starting Scrapping propakistani"------------------------------------->"
exit 0