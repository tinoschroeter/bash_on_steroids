@test "test bash is installed" {
    dpkg -l bash
}
@test "test build cgi script" {
    ./bos.sh
}
@test "test execute cgi script" {
  curl -s http://localhost/cgi-bin/index.cgi | grep -q 'OK'
}
