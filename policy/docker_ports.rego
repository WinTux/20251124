package docker.ports

# Valida que puerto de producto-service sea 8081 y orden-service 8082
deny[msg] if input[i].instruction == "EXPOSE" {
    some i
    not input[i].value in {"8081","8082"}
    msg := sprintf("Puerto %v no permitido. Debe ser 8081 o 8082", [input[i].value])
}
