package docker.no_root

# No ejecutar como root
deny[msg] {
    some i
    input[i].instruction == "USER"
    input[i].value == "root"
    msg := "No ejecutar como root en Dockerfile"
}
