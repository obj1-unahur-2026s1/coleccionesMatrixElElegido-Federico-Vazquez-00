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
    method vitalidad() = 2
    method esElElegido() = false

    method saltar(){
    }
}

object nave{
    const pasajeros = [neo, morfeo, trinity]

    method subirPasajero(pasajero){
        pasajeros.add(pasajero)
    }

    method bajarPasajero(pasajero){
        pasajeros.add(pasajero)
    }

    method cantidadPasajeros(){
        return pasajeros.size()
    }

    method mayorVitalidad(){
        return pasajeros.max({p => p.vitalidad()})
    }

    method estaEquilibrada(){
        //
    }

    method estaElElegido(){
        return pasajeros.any({p => p.esElElegido()})
    }

    method chocar(){
        pasajeros.forEach({p => p.saltar()
                                self.bajarPasajero(p)
                            })
    }

    method acelerar(){
        self.pasajerosSinElElegido().forEach({p => p.saltar()})
    }

    method pasajerosSinElElegido(){
        return pasajeros.filter({p => not p.esElElegido()})
    }

    method pasajerosValiosos(){
        return pasajeros.filter({p => p.vitalidad() > 5})
    }

    method pasajeroAlHorno(){
        return pasajeros.any({p => p.vitalidad() == 0})
    }

    method pasajerosEnCondiciones(){
        return pasajeros.all({p => p.vitalidad() > 2})
    }

    method promedioVitalidad(){
        return pasajeros.sum({p => p.vitalidad()}) / self.cantidadPasajeros()
    }

    method simulacroDeCombate(){
        pasajeros.forEach({p => p.saltar()})
        pasajeros.forEach({p => p.saltar()})
        pasajeros.forEach({p => p.saltar()})
    }

    method listaVitalidad(){
        pasajeros.map({p => p.vitalidad()})
    }

    method pasajerosMenorAMayor(){
        pasajeros.sortBy({a, b => a.vitalidad() < b.vitalidad()})
    }

    method pasajeroParaLimpiarElBaño(){
        pasajeros.randomized().first()
    }

    method cantidadDeElegidos(){
        return pasajeros.count({p => p.esElElegido()})
    }

    method potenciaVital(){
        var potencia = 1
        pasajeros.forEach({p => potencia *= p.vitalidad()})
        return potencia
    }
}