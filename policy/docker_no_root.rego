package docker.no_root
import rego.v1
# No ejecutar como root
deny contains msg if {
    some i
    input[0][i].Cmd == "USER"
    lower(input[0][i].Value) == "root"
    msg := "No se permite ejecutar el contenedor como root (USER root)"
}
