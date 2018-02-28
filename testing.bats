@test "test bash is installed" {
    dpkg -l bash
}
@test "test build cgi script" {
    ./bos.sh
}
@test "test apache2 is installed" {
    which apache2
}
@test "test apache2 config is correct" {
    grep -q 'serve-cgi-bin.conf' /etc/apache2/sites-enabled/000-default.conf 
}
@test "test Website" {
  curl -s http://localhost/index | grep -q 'Star Trek vs Star Wars'
}
@test "test voting system" {
  curl -d "vote=a" -X POST http://localhost/index
  curl -s http://localhost/index | grep -q 'Star Trek 1 vote'
}
@test "check error log" {
    if grep -q '/usr/lib/cgi-bin\|cgid:error' /var/log/apache2/error.log; then
       false
    else
       true
    fi
}
@test "test shellcheck build script" {
  shellcheck bos.sh
}
