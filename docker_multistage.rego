package docker.multistage

deny[msg] {
    not builder
    msg = "Debe existir un stage de build utilizando Maven."
}

deny[msg] {
    not runtime
    msg = "Debe existir un stage de runtime utilizando Eclipse Temurin."
}

deny[msg] {
    not copies_from_builder
    msg = "Debe existir COPY --from=builder en el stage final."
}

builder {
    some i
    input[i].instruction == "FROM"
    startswith(lower(input[i].value), "maven:")
}

runtime {
    some i
    input[i].instruction == "FROM"
    startswith(lower(input[i].value), "eclipse-temurin:")
}

copies_from_builder {
    some i
    input[i].instruction == "COPY"
    contains(input[i].value, "--from=builder")
}

contains(str, substr) {
    index_of(str, substr) != -1
}
