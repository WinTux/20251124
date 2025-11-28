package main
import rego.v1

# Asegurarse de que se use multistage build
deny contains msg if {
    not es_multistage
    msg := "Dockerfile no usa multistage build (se requiere más de un FROM)"
}

# Hay más de un FROM con stage
es_multistage if {
    count([1 |
        some stage
        some i
        stage := input.dockerfile[_]
        instr := stage[i]
        lower(instr.Cmd) == "from"
    ]) > 1
}
