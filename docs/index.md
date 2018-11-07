## Use !#bash scripts for writing beautiful web apps
![pageres](https://raw.githubusercontent.com/tinoschroeter/bash_on_steroids/master/static/like_a_boss.png)

![BoS](https://img.shields.io/badge/%23!Bash%20-%20on%20steroids-blue.svg)
[![Build Status](https://travis-ci.org/tinoschroeter/bash_on_steroids.svg?branch=master)](https://travis-ci.org/tinoschroeter/bash_on_steroids)
[![Gitter](https://img.shields.io/gitter/room/nwjs/nw.js.svg)](https://gitter.im/bashops/bash_on_steroids)
[![Code Climate](https://codeclimate.com/github/tinoschroeter/bash_on_steroids/badges/gpa.svg)](https://codeclimate.com/github/tinoschroeter/bash_on_steroids)
![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)

## Features
- easy to use  ``` <?bash echo "hello world" ?>```
- write fast **wabapps** in pure **#!bash** script
- **QUERY_STRING** and **POST_STRING** variables can used as normal bash **variables**
  (e.g example?var1=foo&var2=bar&var3=nase becomes to echo "${var1} ${var2} ${var3})
- Funktion for decoding URL-encoding: var_dec=$(urldecode $var1)
- Bash for Web Applications

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
git clone https://github.com/tinoschroeter/bash_on_steroids.git /var/www/newProject
cd /var/www/newProject
./bos
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
![list](https://raw.githubusercontent.com/tinoschroeter/bash_on_steroids/master/static/lists.png)

## Decode URL-encoding
```
transform this %23%21%2Fbin%2Fbash to that #!/bin/bash
example:

var_dec=$(urldecode $var)

https://en.wikipedia.org/wiki/Percent-encoding
```

## build
```shell
$ ./bos.sh 
$ index.htsh --->> /usr/lib/cgi-bin/index.cgi
```
## Vagrant
```shell
git clone https://github.com/tinoschroeter/bash_on_steroids.git
cd bash_on_steroids

vagrant up

open http://localhost:8080/
```
![STvsSW](https://raw.githubusercontent.com/tinoschroeter/bash_on_steroids/master/static/stvssw.jpg "STvsSW")

## DEMO

  * [Vote Star Trek vs Star Wars](https://vote.tino-schroeter.de) (ready) 
[source](https://github.com/tinoschroeter/bash_on_steroids/tree/master/DEMO/vote)
  * [QR Code Generator](https://qrcode.tino-schroeter.de) (ready) 
[source](https://github.com/tinoschroeter/bash_on_steroids/tree/master/DEMO/qrcode)
  * [Environment Variables](https://env.tino-schroeter.de) (ready) 
[source](https://github.com/tinoschroeter/bash_on_steroids/tree/master/DEMO/env)
  * [guestbook](https://guestbook.tino-schroeter.de) (ready)
[source](https://github.com/tinoschroeter/bash_on_steroids/tree/master/DEMO/guestbook)
  * [Markdown Wiki](https://wiki.tino-schroeter.de) (ready) 
[source](https://github.com/tinoschroeter/bash_on_steroids/tree/master/DEMO/wiki)
  * [login](https://login.tino-schroeter.de) (ready)
[source](https://github.com/tinoschroeter/bash_on_steroids/tree/master/DEMO/login)
  * [VM Management tool](https://vmtool.tino-schroeter.de) (not ready) 
[source](https://github.com/tinoschroeter/bash_on_steroids/tree/master/DEMO/vmtool)
  * [WLAN config tool](https://wlan.tino-schroeter.de) (ready) 
[source](https://github.com/tinoschroeter/bash_on_steroids/tree/master/DEMO/wlan)
  * [todo](https://todo.tino-schroeter.de) (not ready)
[source](https://github.com/tinoschroeter/bash_on_steroids/tree/master/DEMO/todo)


## Wiki

[Wiki -->](https://github.com/tinoschroeter/bash_on_steroids/wiki)
![wiki](https://raw.githubusercontent.com/tinoschroeter/bash_on_steroids/master/static/wiki.png "wiki")
