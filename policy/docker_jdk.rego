package docker.jdk

# Evitar usar JDK con versión no segura
deny[msg] {
    some i
    input[i].instruction == "FROM"
    contains(lower(input[i].value), "jdk-8")  # ejemplo: no permitir JDK8
    msg := "Evita usar JDK8, usa versión más reciente"
}
