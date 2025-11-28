package docker.ports
import rego.v1
# Validar que los puertos expuestos sean correctos
deny contains msg if {
    some i
    input.dockerfile[0][i].Cmd == "EXPOSE"
    not valid_port(input.dockerfile[0][i].Value)
    msg := sprintf("Puerto %v no es válido, solo se permiten 8081 y 8082", [input.dockerfile[0][i].Value])
}

# Puerto válido = 8081
valid_port(p) if {
    p == "8081"
}
valid_port(p) if {
    p == "8082"
}
