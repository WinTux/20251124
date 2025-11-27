package docker.bestpractices
# Evita usar eimagenes latest
deny[msg] {
    some i
    input[i].instruction == "FROM"
    endswith(lower(input[i].value), ":latest")
    msg := "No se permite usar imágenes con tag 'latest'. Usa versiones específicas."
}

deny[msg] {
    input[i].instruction == "ADD"
    msg := "No se permite 'ADD'. Usa 'COPY' a menos que sea estrictamente necesario."
}

deny[msg] {
    input[i].instruction == "COPY"
    count(split(input[i].value, " ")) < 2
    msg := "COPY debe tener al menos dos argumentos."
}

# Revisa que cada Dockerfile tenga al menos un EXPOSE
deny[msg] {
    not any_expose
    msg := "Dockerfile no expone puertos"
}

any_expose {
    some i
    input[i].instruction == "EXPOSE"
}
