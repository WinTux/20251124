package docker.bestpractices

# Evitar usar la imagen 'latest'
deny[msg] {
    some i
    input[i].instruction == "FROM"
    lower(input[i].value) == "eclipse-temurin:latest"
    msg := "No uses tag 'latest' en FROM"
}

# Dockerfile debería exponer al menos un puerto
deny[msg] {
    not any_expose
    msg := "Dockerfile no expone puertos"
}

any_expose[i] {
    input[i].instruction == "EXPOSE"
}
