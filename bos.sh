#!/bin/bash
# config
cgi_path="/usr/lib/cgi-bin/"

bos() {
tee $2 >>/dev/null <<EOF
#!/bin/bash 
echo Content-type: text/html
echo ""
## make POST and GET stings 
## as bash variables available
if [ ! -z \$CONTENT_LENGTH ] && [ "\$CONTENT_LENGTH" -gt 0 ]; then
read -n \$CONTENT_LENGTH POST_STRING <&0
eval \`echo "\${POST_STRING}"|tr '&' ';'\`
fi
eval \`echo "\${QUERY_STRING}"|tr '&' ';'\`
EOF

flag=0
lc=0
txt=''
while read -r line;do
	let lc=lc+1
	# Start and end tags in same line
	echo "$line"| grep -qe "<?.*?>"  -qe "<?bash.*?>"
	if [ $? -eq 0 ];then
		if [ $flag -eq 0 ];then
			line=${line//<?bash/<?}
			pre=`echo -e "$line" |  sed -e 's/<?.*//'`
			comm=`echo -e "$line" | sed -e 's/^.*<? //' | sed -e 's/?>.*//'`
			post=`echo -e "$line" | sed -e 's/^.*?>//'`
			
			if [ -n "$pre" ];then
				pre=${pre//\\/\\\\}
				mod_pre=`echo -e "$pre" | sed "s/'/\\\'/g" | sed 's/"/\\\"/g'`
				mod_pre=${mod_pre//\$/\\$}
				echo -e "echo  \"$mod_pre\"" >>"$2"
			fi
			echo -e "$comm" >> "$2"
			if [ -n "$post" ];then
				post=${post//\\/\\\\}
				mod_post=`echo -e "$post" | sed "s/'/\\\'/g" | sed 's/"/\\\"/g'`
				mod_post=${mod_post//\$/\\$}
				echo -e "echo  \"$mod_post\"" >>"$2"
			fi
			continue
		else
			echo -e "\n\n<br/><br/>  ERROR : Non-terminated &lt;?bash or &lt;? in file $1 (Line $lc) "
			exit 1
		fi	
	fi
	# Start tag
	echo "$line" | sed 's/^ *//'| grep -q "^<?bash\|^<?"
	if [ $? -eq 0 ];then
		if [ $flag -eq 0 ];then
			flag=1
			line=${line/<?bash}
			echo -e "${line/<?}" >> "$2"
		else
			echo -e "\n\n<br/><br/>  ERROR : Non-terminated &lt;?bash or &lt;? in file $1 (Line $lc) "
			exit 1
		fi
		continue;
	fi
	# End tag
	echo "$line"|grep -q "?>$"
	if [ $? -eq 0 ];then
		if [ $flag -eq 1 ];then
			flag=0
			echo -e"${line/?>}" >> "$2"
		else
			echo -e "\n\n<br/><br/>  ERROR : Unmatched ?&gt; in file $1 (Line $lc) "
			exit 1
		fi
		continue;
	fi
	# Take action on current line based on flag
	if [ $flag -eq 0 ];then
		line=${line//\\/\\\\}
		modline=`echo  "$line" |sed "s/'/\\\'/g" | sed 's/"/\\\"/g'`
		modline=${modline//\$/\\$}
		echo -e "echo  \"$modline\"" >>"$2"
	else
		echo -e "${line}" >> "$2"
	fi
done < "$1"
}
for file in $(ls |grep 'htsh$');do
if [ $file -nt ${cgi_path}$(echo $file|sed 's/htsh/cgi/g') ];then
echo "$file --->> ${cgi_path}$(echo $file|sed 's/htsh/cgi/g')"
for command in  "bos" "chmod +x";do
$command $file ${cgi_path}$(echo $file|sed 's/htsh/cgi/g')
done
fi
done
