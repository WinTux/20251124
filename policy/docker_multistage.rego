package docker.multistage

# Asegurarse de que se use multistage build
deny[msg] {
    not is_multistage
    msg := "Dockerfile no usa multistage build"
}

is_multistage {
    some i
    input[i].instruction == "FROM"
    input[i].stage != ""
}
