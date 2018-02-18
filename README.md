## Use bash CGI style scrpts for writing beautiful web apps.
![pageres](https://raw.githubusercontent.com/tinoschroeter/bash_on_steroids/master/static/like_a_boss.png)

### Features
- easy to use  ``` <?bash echo "Hello" ?>```
- write fast wabapps in simpe bash script style
- QUERY_STRING variables can used as normal bash variables 
- (e.g example?var1=foo&var2=bar&var3=nase becomes to echo "${var1} ${var2} ${var3})

### Install
```
$ git clone https://github.com/tinoschroeter/bash_on_steroids.git /var/www/newProject
$ cd /var/www/newProject
$ ./bos
```

### Usage:
All bash codes are to be enclosed within ``` <?bash ... ?> or in short, <? ... ?>``` tags. 
```
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

## buld
```
$ /var/www/newProject vim index.htsh
$ /var/www/newProject./bos.sh 
$ index.htsh --->> /usr/lib/cgi-bin/index.cgi
```
### Vagrant
```
vagrant up
vagrant ssh
cd /var/www/html/
sudo ./bos.sh

open http://localhost:8080/
```
