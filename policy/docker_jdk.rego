package docker.jdk

deny contains msg if {
    some i
    input[i].instruction == "FROM"
    contains(lower(input[i].value), "jdk-8")
    msg := "No se permite usar JDK 8"
}

deny contains msg if {
    some i
    input[i].instruction == "FROM"
    contains(lower(input[i].value), "jdk-11")
    msg := "No se permite usar JDK 11"
}

deny contains msg if {
    some i
    input[i].instruction == "FROM"
    contains(lower(input[i].value), "jdk-17")
    msg := "No se permite usar JDK 17"
}

deny contains msg if {
    some i
    input[i].instruction == "FROM"
    not contains(lower(input[i].value), "jdk-21")
    msg := sprintf("La imagen base debe ser JDK 21, encontrada: %v", [input[i].value])
}
