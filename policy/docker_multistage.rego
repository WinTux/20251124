package docker.multistage

# Asegurarse de que se use multistage build
deny contains msg if {
    not es_multistage
    msg := "Dockerfile no usa multistage build (se requiere más de un FROM)"
}

# Hay más de un FROM con stage
es_multistage if {
    count([x | x := input[_]; x.instruction == "FROM"]) > 1
}
