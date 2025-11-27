package docker.jdk

# Solo permite JDK 21
deny[msg] {
    some i
    input[i].instruction == "FROM"
    contains(input[i].value, "jdk") 
    not contains(input[i].value, "21")
    msg := "Solo se permite JDK 21 en FROM"
}

