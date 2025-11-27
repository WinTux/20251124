package docker.bestpractices

# No usar tag latest
deny contains msg if {
    some i
    input[i].instruction == "FROM"
    lower(input[i].value) == "eclipse-temurin:latest"
    msg := "No uses tag 'latest' en FROM"
}

# Dockerfile debería exponer al menos un puerto
deny contains msg if {
    not any_expose
    msg := "Dockerfile no expone puertos"
}

# Hay al menos un EXPOSE
any_expose if {
    some i
    input[i].instruction == "EXPOSE"
}
