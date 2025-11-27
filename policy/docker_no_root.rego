package docker.no_root

# No ejecutar como root
deny contains msg if {
    some i
    input[i].instruction == "USER"
    input[i].value == "root"
    msg := "No ejecutar como root en Dockerfile"
}
