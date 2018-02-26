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
    grep -q 'serve-cgi-bin.conf' /etc/apache2/sites-enabled/default.conf 
}
@test "test execute cgi script" {
  skip "skip test"
  curl -s http://localhost/index | grep -q 'OK'
}
@test "test shellcheck build script" {
  skip "skip shellcheck" 
  shellcheck bos.sh
}
