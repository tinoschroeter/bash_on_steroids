#!/bin/bash
for i in $(ls template/);do
output=$(echo "$i"|sed 's/.htsh//')
if [ template/$i -nt www/$output.cgi ];then
echo "generate www/$output.cgi file..."
./bin/htsh template/$i www/$output.cgi
chmod +x www/$output.cgi
mkdir www
fi
done
