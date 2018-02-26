@test "test bash is installed" {
    dpkg -l bash
}
@test "test build cgi script" {
    ./bos.sh
}
