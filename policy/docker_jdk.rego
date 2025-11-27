package docker.jdk

# Solo permite JDK 21
deny[msg] if input[i].instruction == "FROM" {
    some i
    contains(input[i].value, "jdk")
    not contains(input[i].value, "21")
    msg := "Solo se permite JDK 21 en FROM"
}
