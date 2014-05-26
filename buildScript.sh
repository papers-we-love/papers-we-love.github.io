#!/bin/bash

echo "BuildScript.sh started"

###################################

#---
#layout: default
#title: Papers We Love
#---
#
#<div id="home">
#
#{% directory path: assets exclude: ^*.md$ %}
#  <h2><a href="/categories/{{ category | first }}"> {{ file.name | capitalize | replace:'_',' '  }} </a></h2>
#    <ul class="posts">
#        {% directory path: assets/android %}
#                <li><span>&gt; </span><a href="{{ file.url_no_ext }}.pdf" >{{ file.name }}</a></li>
#        {% enddirectory %}
#    </ul>
#
#{% enddirectory %}
#</div>

cd assets
git clone https://github.com/papers-we-love/papers-we-love .
cd ..

echo "Building index.html"
cd assets
index="../index.html"

#Header

echo -e "---
layout: default
title: Papers We Love
---

<div id=\"home\">" > "$index"

for item in *
do
	#If it's a folder
	if [[ -d "$item" ]]; then
		echo -e "\t<h2><a href=\"/categories/$item\">$(echo ${item^} | sed 's/_/ /g')</a></h2>\n" >> "$index"
		#Going inside the folder
		cd "$item"
		index="../$index"
		echo -e "\t\t<ul class=\"posts\">" >> "$index"
		for file in *
		do
			#If it's a README.md parse it
			if [[ `echo $file | cut -f2 -d'.'` = "md" ]]; then
				#cat README.md | egrep '\[' | cut -f2 -d'[' | cut -f1 -d']'
				IFS=$'\n'
				for line in $(cat README.md | egrep '\[')
				do
					title=$(echo $line | cut -f2 -d'[' | cut -f1 -d']')
					link=$(echo $line | cut -f2 -d'(' | cut -f1 -d')')
					echo -e "<li><span>&gt; </span><a href=\"$link\" >$(echo ${title^})</a></li>" >> "$index"
				done
			fi
			#If it's a PDF show it
			if [[ `echo $file | cut -f2 -d'.'` = "pdf" ]]; then
                        	echo -e "<li><span>&gt; </span><a href=\"/assets/$item/$file\" >$(echo ${file^} | sed 's/-/ /g')</a></li>" >> "$index"
                        fi
		done
		cd ..
		index="../index.html"
		echo -e "\t\t</ul>" >> "$index"
	fi
done
echo -e "</div>" >> "$index"

###################################

jekyll build

echo "BuildScript.sh completed"
