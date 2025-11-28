package docker.bestpractices
import rego.v1
# No usar tag latest
deny contains msg if {
    some i
    input[i].instruction == "FROM"
    endswith(lower(input[i].value), ":latest")
    msg := "No uses tag 'latest' en la instrucción FROM"
}

# Dockerfile debería exponer al menos un puerto
deny contains msg if {
    not any_expose
    msg := "Dockerfile no expone ningún puerto (EXPOSE)"
}

# Hay al menos un EXPOSE
any_expose if {
    some i
    input[i].instruction == "EXPOSE"
}
