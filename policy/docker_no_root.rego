package docker.no_root

# Evita usar root
deny[msg] {
    some i
    input[i].instruction == "USER"
    input[i].value == "root"
    msg := "No se debe usar el usuario root"
}

