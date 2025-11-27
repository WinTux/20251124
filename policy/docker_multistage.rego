package docker.multistage

# Debe ser un Dockerfile multistage si hay build y runtime
deny[msg] {
    not has_multistage
    msg := "Dockerfile debería ser multistage"
}

has_multistage {
    some i
    some j
    i != j
    input[i].instruction == "FROM"
    input[j].instruction == "FROM"
}
