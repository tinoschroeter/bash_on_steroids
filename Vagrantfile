$script = <<SCRIPT
apt-get update; apt-get install -y apache2
tee /etc/apache2/sites-enabled/000-default.conf >/dev/null <<EOF
<VirtualHost *:80>
	ServerName example.org
	ServerAdmin webmaster@example.org
	DocumentRoot /var/www/html/
 
        ScriptAlias "/index.html" "/usr/lib/cgi-bin/doku.cgi"
        ScriptAlias "/index" "/usr/lib/cgi-bin/doku.cgi"
       
        RedirectMatch 404 index.htsh

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

	Include conf-available/serve-cgi-bin.conf
</VirtualHost>
EOF
service apache2 restart
SCRIPT

Vagrant.configure("2") do |config|
config.vm.define "bos" do |bos|
  bos.vm.hostname = "bos"
  bos.vm.box = "precise64"
  bos.vm.provision "shell", inline: $script
  bos.vm.network "forwarded_port", guest: 80, host: 9090
  bos.vm.synced_folder ".", "/home/vagrant"
  end
config.vm.provider "virtualbox" do |v|
  v.memory = 1024
  v.cpus = 2
  end
end
