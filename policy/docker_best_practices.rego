package docker.bestpractices

# No usar tag latest
deny[msg] {
    some i
    input[i].instruction == "FROM"
    endswith(lower(input[i].value), ":latest")
    msg := "No uses tag 'latest' en la instrucción FROM"
}

# Dockerfile debería exponer al menos un puerto
deny[msg] {
    not any_expose
    msg := "Dockerfile no expone ningún puerto (EXPOSE)"
}

any_expose {
    some i
    input[i].instruction == "EXPOSE"
}
