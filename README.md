# ![pageres](https://raw.githubusercontent.com/tinoschroeter/BaschOnRails/master/static/logo.png)
Use bash CGI style scrpts for writing beautiful web apps.

## Install
```
$ git clone https://github.com/tinoschroeter/BaschOnRails.git /var/www/newProject
$ cd /var/www/newProject
$ ./install
```
## Features
- easy to use
- write fast wabapps in simpe bash script style
- QUERY_STRING variables can used as normal bash variables 
- (e.g example?var1=foo&var2=bar&var3=nase becomes to echo "${var1} ${var2} ${var3})

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
### WLAN configuration Webapp_
```sh
.
.
.
<form class="form-horizontal">
<fieldset>
<legend></legend>

 <!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="ssid">SSID</label>
  <div class="col-md-6">
   <select id="ssid" name="selectbasic" class="form-control">
   <?bash
      iwlist wlan0 scan|grep ESSID| cut -d "\"" -f 2|while read i;do
        echo "<option value="$i">$i</option>"
        done
        echo "</select>"
   ?>

  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="password">Password</label>
  <div class="col-md-6">
  <input id="password" name="password" placeholder="Password" class="form-control input-md" required="" type="password">

  </div>
</div>
<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="enter"></label>
  <div class="col-md-4">
    <button id="submit" name="" class="btn btn-success">Submitt</button>
    <a id="rescan" class="btn btn-info" href="/wlan">Rescan</a>
  </div>
</div>

<?bash
   if [ ! -z ${selectbasic} ];then
     sudo tee /etc/network/interfaces >/dev/null <<EOF
     source-directory /etc/network/interfaces.d

     auto lo 
     iface lo inet loopback

     iface eth0 inet dhcp

     allow-hotplug wlan0
     iface wlan0 inet dhcp
     wpa-ap-scan 1
     wpa-scan-ssid 1
     wpa-ssid "$selectbasic"
     wpa-psk "$password"
     EOF
     echo "sudo ifdown wlan0 && sleep 1 && ifup wlan0"| at now
   fi
?>

</fieldset>
</form>
.
.
.
```
## nginx config
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
## use sudo in your CGI scripts
```sh
$sudo visudo
```
and put this to your sudoers file "www-data ALL=(ALL) NOPASSWD: ALL"

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
