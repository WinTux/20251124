package docker.jdk

deny contains msg if {
    input[i].instruction == "FROM"
    contains(lower(input[i].value), "openjdk")
    msg = "No se permite OpenJDK. Usa Eclipse Temurin 21."
}

deny contains msg if {
    input[i].instruction == "FROM"
    not contains(lower(input[i].value), "temurin")
    msg = "Debes usar Eclipse Temurin como runtime."
}

deny contains msg if {
    input[i].instruction == "FROM"
    contains(lower(input[i].value), "temurin")
    not contains(input[i].value, "21")
    msg = "Debes usar Java 21 como base de la imagen."
}

contains(str, substr) {
    regex.match(sprintf(".*%s.*", [regex.escape(substr)]), str)
}
