package docker.ports

# Validar que los puertos expuestos sean correctos
deny contains msg if {
    some i
    input[i].instruction == "EXPOSE"
    not valid_port(input[i].value)
    msg := sprintf("Puerto %v no es válido, solo se permiten 8081 y 8082", [input[i].value])
}

# Puerto válido = 8081
valid_port(p) if {
    p == "8081"
}
valid_port(p) if {
    p == "8082"
}
