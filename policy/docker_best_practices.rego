package main
import rego.v1
# No usar tag latest
deny contains msg if {
    some i
    lower(input.dockerfile[0][i].Cmd) == "from"
    endswith(lower(input.dockerfile[0][i].Value), ":latest")
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
    lower(input.dockerfile[0][i].Cmd) == "expose"
}
