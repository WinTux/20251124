package docker.multistage

# Debe ser multistage si hay build y runtime
deny[msg] if not has_multistage {
    msg := "Dockerfile debería ser multistage"
}

has_multistage contains i if input[i].instruction == "FROM" {
    some i
}
