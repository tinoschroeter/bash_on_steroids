@test "test bash is installed" {
    dpkg -l bash
}
@test "test build cgi script" {
    ./bos.sh
}
@test "test execute cgi script" {
  curl -s http://localhost/index | grep -q 'OK'
}
@test "test shellcheck build script" {
  skip "skip shellcheck" 
  shellcheck bos.sh
}
