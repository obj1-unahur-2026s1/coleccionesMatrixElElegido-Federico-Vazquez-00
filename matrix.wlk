object neo{
    var energia = 100

    method esElElegido() = true

    method saltar(){
        energia = energia / 2
    }

    method vitalidad() = energia / 10
}

object morfeo{
    var vitalidad = 8
    var estaCansado = false

    method esElElegido() = false

    method saltar(){
        /*if (estaCansado) {
            estaCansado = false
        }
        else {
            estaCansado = true
        }
        */
        estaCansado = not estaCansado
        vitalidad -= 1
    }

    method vitalidad() = vitalidad
}

object trinity{
    method vitalidad() = 0
    method esElElegido() = false

    method saltar(){
    }
}

object nave{
    const pasajeros = [neo, morfeo, trinity]

    method subirPasajero(pasajero) {
        pasajeros.add(pasajero)
    }

    method bajarPasajero(pasajero) {
        pasajeros.add(pasajero)
    }

    method cantidadPasajeros() = pasajeros.size()

    method mayorVitalidad() = pasajeros.max({p => p.vitalidad()})

    method estaEquilibrada() {
        //
    }

    method estaElElegido() = pasajeros.any({p => p.esElElegido()})

    method chocar() {
        pasajeros.forEach({p => p.saltar()
                                self.bajarPasajero(p)
                            })
    }

    method acelerar() {
        self.pasajerosSinElElegido().forEach({p => p.saltar()})
    }

    method pasajerosSinElElegido() {
        return pasajeros.filter({p => not p.esElElegido()})
    } 
}