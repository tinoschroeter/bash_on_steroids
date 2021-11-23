## Use !#bash scripts for writing beautiful web apps  :sparkles:
![pageres](https://raw.githubusercontent.com/tinoschroeter/bash_on_steroids/master/static/like_a_boss.png)

• [DEMO bos.tino.sh](https://bos.tino.sh)

![BoS](https://img.shields.io/badge/%23!Bash%20-%20on%20steroids-blue.svg)
![MIT](https://img.shields.io/badge/license-MIT-blue.svg)
[![Build Status](https://travis-ci.com/tinoschroeter/bash_on_steroids.svg?branch=master)](https://travis-ci.com/tinoschroeter/bash_on_steroids)
[![Gitter](https://img.shields.io/gitter/room/nwjs/nw.js.svg)](https://gitter.im/bashops/bash_on_steroids)
[![GitHub issues](https://img.shields.io/github/issues/tinoschroeter/bash_on_steroids.svg?style=popout)](https://github.com/tinoschroeter/bash_on_steroids/projects/1)
![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)
[![k3s](https://img.shields.io/badge/run%20on%20-Raspberry%20Pi-red)](https://gist.github.com/tinoschroeter/fd4c254e93b2fd0c0b584bdcf756e95f)

<p align="left"> •
  <a href="#Features">Features</a> •
  <a href="#Install-Apache2">Install Apache2</a> •
  <a href="#install-BoS">install BoS</a> •
  <a href="#Usage">Usage</a> 
</p>




## Features
- easy to use  ``` <?bash echo "hello world" ?>```
- write fast **wabapps** in pure **#!bash** script
- **QUERY_STRING** and **POST_STRING** variables can used as normal bash **variables**
  (e.g example?var1=foo&var2=bar&var3=nase becomes to echo "${var1} ${var2} ${var3})
- Funktion for decoding URL-encoding: var_dec=$(urldecode $var1)
- Bash for Web Applications

## Why?
- Because there's nothing you can't fix with a #!Bash Script.

## Install Apache2
```shell
apt-get update; apt-get install -y apache2
tee /etc/apache2/sites-enabled/000-default.conf >/dev/null <<EOF
<VirtualHost *:80>
	ServerName example.org
	ServerAdmin webmaster@example.org
	DocumentRoot /var/www/html/
 
        ScriptAlias "/index.html" "/usr/lib/cgi-bin/index.cgi"
        ScriptAlias "/index" "/usr/lib/cgi-bin/index.cgi"
        RedirectMatch 404 .*\.htsh
        <Directory /var/www/html/>
          AllowOverride none
          Options -Indexes
          Require all granted
        </Directory>
	ErrorLog /var/log/apache2/error.log
	CustomLog /var/log/apache2/access.log combined
	Include conf-available/serve-cgi-bin.conf
</VirtualHost>
EOF
a2enmod cgid
service apache2 restart
```
## install BoS
```shell
cd /var/www/html # your html folder
wget https://raw.githubusercontent.com/tinoschroeter/bash_on_steroids/master/build.sh
wget https://raw.githubusercontent.com/tinoschroeter/bash_on_steroids/master/index.htsh # example file
chmod +x build.sh
./build.sh

# index.cgi can be found in  /usr/lib/cgi-bin
```

## Usage
All bash codes are to be enclosed within ``` <?bash ... ?> or in short, <? ... ?>``` tags. 
```html
<!DOCTYPE html>
<html>
 <body>
 <ul>
    <?bash
      for i in Buzz Rex Bo Hamm Slink Potato; do
        echo "<li>$i</li>"
      done
      ?>
</ul>
</body>
</html>
```

**The Template Enginge will create this cgi script out of it**

```
#!/bin/bash 
echo "X-Bash-On-Steroids: Because there's nothing you can't fix with a #!Bash Script."
echo Content-type: text/html
echo ""
## make POST and GET stings 
## as bash variables available
if [ ! -z $CONTENT_LENGTH ] && [ "$CONTENT_LENGTH" -gt 0 ] && [ $CONTENT_TYPE != "multipart/form-data" ]; then
read -n $CONTENT_LENGTH POST_STRING <&0
eval $(echo "${POST_STRING//;}"|grep '='|tr '&' ';')
fi
eval $(echo "${QUERY_STRING//;}"|grep '='|tr '&' ';')
## decode URL-encoding
urldecode() { : "${*//+/ }"; echo -e "${_//%/\x}"; }
echo  "<!DOCTYPE html>"
echo  "<html>"
echo  " <body>"
echo  " <ul>"
    
      for i in Buzz Rex Bo Hamm Slink Potato; do
        echo "<li>$i</li>"
      done
      
echo  "</ul>"
echo  "</body>"
echo  "</html>"
```

![list](https://github.com/tinoschroeter/bash_on_steroids/blob/master/static/lists.png)

## Decode URL-encoding
```
transform this %23%21%2Fbin%2Fbash to that #!/bin/bash
example:

var_dec=$(urldecode $var)

https://en.wikipedia.org/wiki/Percent-encoding
```

## build
```shell
$ ./build.sh 
$ index.htsh --->> /usr/lib/cgi-bin/index.cgi
```
## Vagrant
```shell
git clone https://github.com/tinoschroeter/bash_on_steroids.git
cd bash_on_steroids

vagrant up

open http://localhost:8090/
```
![STvsSW](https://github.com/tinoschroeter/bash_on_steroids/blob/master/static/stvssw.jpg)

## DEMO

  * [Vote Star Trek vs Star Wars](https://github.com/tinoschroeter/bash_on_steroids/tree/master/DEMO/vote)
  * [QR Code Generator](https://github.com/tinoschroeter/bash_on_steroids/tree/master/DEMO/qrcode)
  * [Environment Variables](https://github.com/tinoschroeter/bash_on_steroids/tree/master/DEMO/env)
  * [guestbook](https://github.com/tinoschroeter/bash_on_steroids/tree/master/DEMO/guestbook)
  * [Markdown Wiki](https://github.com/tinoschroeter/bash_on_steroids/tree/master/DEMO/wiki)
  * [login](https://github.com/tinoschroeter/bash_on_steroids/tree/master/DEMO/login)
  * [WLAN config tool](https://github.com/tinoschroeter/bash_on_steroids/tree/master/DEMO/wlan)

## Wiki

[Wiki -->](https://github.com/tinoschroeter/bash_on_steroids/wiki)
![wiki](https://raw.githubusercontent.com/tinoschroeter/bash_on_steroids/master/static/wiki.png "wiki")

## License

[MIT](http://choosealicense.com/licenses/mit/)
