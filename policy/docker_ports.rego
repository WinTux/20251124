package docker.ports

required_port["8081"] {
    contains(input_path, "producto-service")
}

required_port["8082"] {
    contains(input_path, "orden-service")
}

deny contains msg if {
    some port
    required_port[port]
    not port_exposed(port)
    msg = sprintf("El microservicio requiere exponer el puerto %s", [port])
}

port_exposed(port) {
    some i
    input[i].instruction == "EXPOSE"
    contains(input[i].value, port)
}

contains(str, substr) {
    regex.match(sprintf(".*%s.*", [regex.escape(substr)]), str)
}
