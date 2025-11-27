package docker.no_root

# Evita usar root
deny[msg] if input[i].instruction == "USER" {
    some i
    input[i].value == "root"
    msg := "No se debe usar el usuario root"
}
