package docker.bestpractices

# Evita usar la imagen "latest"
deny[msg] if input[i].instruction == "FROM" {
    some i
    lower(input[i].value) == "eclipse-temurin:latest"
    msg := "No uses tag latest en FROM"
}

# Revisa que haya al menos un EXPOSE
deny[msg] if not any_expose {
    msg := "Dockerfile no expone puertos"
}

any_expose contains i if input[i].instruction == "EXPOSE" {
    some i
}
