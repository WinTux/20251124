package docker.bestpractices

deny contains msg if {
    input[i].instruction == "FROM"
    endswith(lower(input[i].value), ":latest")
    msg = "No se permite usar imágenes con tag 'latest'. Usa versiones específicas."
}

deny contains msg if {
    input[i].instruction == "ADD"
    msg = "No se permite 'ADD'. Usa 'COPY' a menos que sea estrictamente necesario."
}

deny contains msg if {
    input[i].instruction == "COPY"
    count(split(input[i].value, " ")) < 2
    msg = "COPY debe tener al menos dos argumentos."
}
