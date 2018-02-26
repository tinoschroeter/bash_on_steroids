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
@test "test shellcheck build script" {
  skip "skip shellcheck" 
  shellcheck bos.sh
}
