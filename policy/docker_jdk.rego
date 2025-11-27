package docker.jdk

# Solo permitir imágenes basadas en JDK 21
deny contains msg if {
    some i
    input[i].instruction == "FROM"
    not es_jdk21(input[i].value)
    msg := sprintf(
        "La imagen base debe usar JDK 21. Imagen encontrada: %v",
        [input[i].value]
    )
}

# Función que valida JDK 21
es_jdk21(image) if {
    # ejemplo esperado:
    # eclipse-temurin:21
    startswith(lower(image), "eclipse-temurin:21")
}
