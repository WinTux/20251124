package docker.ports

# Validar que los puertos expuestos sean correctos
deny[msg] {
    some i
    input[i].instruction == "EXPOSE"
    not valid_port(input[i].value)
    msg := sprintf("Puerto %v no es válido", [input[i].value])
}

valid_port(p) {
    p == "8081"
} {
    p == "8082"
}
