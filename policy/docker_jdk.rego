package docker.jdk
import rego.v1
deny contains msg if {
    some i
    input[0][i].Cmd == "FROM"
    contains(lower(input[0][i].Value), "jdk-8")
    msg := "No se permite usar JDK 8"
}

deny contains msg if {
    some i
    input[0][i].Cmd == "FROM"
    contains(lower(input[0][i].Value), "jdk-11")
    msg := "No se permite usar JDK 11"
}

deny contains msg if {
    some i
    input[0][i].Cmd == "FROM"
    contains(lower(input[0][i].Value), "jdk-17")
    msg := "No se permite usar JDK 17"
}

deny contains msg if {
    some i
    input[0][i].Cmd == "FROM"
    not contains(lower(input[0][i].Value), "jdk-21")
    msg := sprintf("La imagen base debe ser JDK 21, encontrada: %v", [input[0][i].Value])
}
