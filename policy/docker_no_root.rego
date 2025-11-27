package docker.noroot

deny contains msg if {
    not user_defined
    msg = "Se debe definir un usuario no root con USER."
}

deny contains msg if {
    user_root
    msg = "El Dockerfile no debe utilizar el usuario root."
}

user_defined {
    some i
    input[i].instruction == "USER"
}

user_root {
    some i
    input[i].instruction == "USER"
    input[i].value == "root"
}
