# ![pageres](https://raw.githubusercontent.com/tinoschroeter/BaschOnRails/master/static/logo.png)
Use bash CGI style scrpts for writing beautiful web apps.

## Install
```
$ git clone https://github.com/tinoschroeter/BaschOnRails.git /var/www/newProject
$ cd /var/www/newProject
$ ./install
```
## Usage:
All bash codes are to be enclosed within <?bash ... ?> or in short, <? ... ?> tags. 
```
$:/var/www/newProject vim template/example.htsh
$:/var/www/newProject./build.sh 
generate www/example.cgi file...
```
### list example_
```sh

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
![screenshot](https://raw.githubusercontent.com/tinoschroeter/BaschOnRails/master/static/lists.png)

### form example_
```sh
<form>
  First name:<br>
  <input type="text" name="firstname"><br>
  Last name:<br>
  <input type="text" name="lastname">
  <br><br>
  <input type="submit" value="Submit">
 <select name="cars">
  <option value="volvo">Volvo</option>
  <option value="saab">Saab</option>
  <option value="fiat">Fiat</option>
  <option value="audi">Audi</option>
</select>
</form>
<?bash
      if [ ! -z ${firstname} ];then
        echo "<p>Dein Name ist $firstname $lastname und du hast $cars gewaehlt. </p>"
      fi
?>
```
![screenshot](https://raw.githubusercontent.com/tinoschroeter/BaschOnRails/master/static/form.png)
### nginx config
```
server {
        listen 80;
        location / {
        fastcgi_index index.cgi;
        try_files $uri $uri/ $uri.html $uri.cgi?$query_string;
        gzip off;
        root /var/www/newProject/www
        fastcgi_pass  unix:/var/run/fcgiwrap.socket;
        include /etc/nginx/fastcgi_params;
        fastcgi_param \SCRIPT_FILENAME  $document_root$fastcgi_script_name;
                   }
                   location ~* \.(js|jpg|png|css)$ {
                   root /var/www/newProject/;
                   expires 30d;
                   }
        }  

```
## Thanks

Thanks to [Tiny Bash Server](https://github.com/sayanriju/Tiny-Bash-Server) 

# License

The MIT License (MIT)

Copyright (c) 2013-2016 Petka Antonov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
