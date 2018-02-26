@test "test bash is installed" {
    dpkg -l bash
}
@test "test build cgi script" {
    ./bos.sh
}
@test "test execute cgi script" {
  skip "feature coming"
  curl -s http://localhost/index | grep -q 'OK'
}
@test "test shellcheck build script" {
    shellcheck bos.sh
}
