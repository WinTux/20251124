package docker.multistage

# Asegurarse de que se use multistage build
deny contains msg if {
    not is_multistage
    msg := "Dockerfile no usa multistage build"
}

# Hay más de un FROM con stage
is_multistage if {
    some i
    input[i].instruction == "FROM"
    input[i].stage != ""
}
