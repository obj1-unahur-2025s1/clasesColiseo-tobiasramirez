object coliseo {
 method curar(unGladiador) {
  unGladiador.vida(100) 
 }
 
}
class Grupo {
  var gladiadores
  var property cantidadPeleas = 0
  method agregarA(unGladiador) {
    gladiadores.add(unGladiador)
  }
  method sacarA(unGladiador) {
    gladiadores.remove(unGladiador)
  }
  method campeon() = gladiadores.filter({g=>g.vida() > 0}).max({g=>g.poderDeAtaque()})

}
class Arma {
 method valorAtaque()
}
class ArmaFilo  inherits Arma{
 var filo
 var longitud
 method initialize() {
  if (longitud < 0 or longitud > 1) {
    self.error("el filo debe ser un valor entre 0 y 1")
  }
 }
 override method valorAtaque() = filo * longitud
}
class ArmaContundente inherits Arma {
 var peso 
 override method valorAtaque() = peso
}
class Armadura {
  method armadura()
}
class Casco inherits Armadura {
  override method armadura() = 10
}
class Escudo inherits Armadura {
  
   override method armadura() = 5 
}
class Gladiador {
  var property vida = 100
  
  method defensa()
   method recibirAtaqueMirmillon(unMirmillon) {
    vida -= unMirmillon.poderDeAtaque() - self.defensa()
  }
  method poderDeAtaque()

  method atacar(unGladiador) {
    unGladiador.recibirAtaque(self)
  }
  method recibirAtaque(atacante) {
    vida -= atacante.poderDeAtaque() - self.defensa()
  }
  method crearGrupo(unGladiador)

}
class Mirmillones inherits Gladiador {
  const destreza = 15
  var property arma
  var property armadura
  var fuerza
  method fuerza() = fuerza
  override method defensa() = if (armadura==Escudo) armadura.armadura() + destreza / 10 + destreza else armadura.armadura()
  override method poderDeAtaque() = fuerza +  arma.valorAtaque()
  override method crearGrupo(unGladiador) {
    var mirmillolandia = new Grupo(gladiadores  = [self, unGladiador])
  }
 
 

}
class Dimachaerus inherits Gladiador {
  var property armas
  var destreza
  method fuerza() = 10
  override method defensa() = destreza/2
  override method poderDeAtaque() = self.fuerza() + armas.sum({a=>a.valorAtaque()})
  override method atacar(unGladiador){
    super(unGladiador)
    destreza+= 1
  }
  override method crearGrupo(unGladiador) {
    var D = new Grupo(gladiadores  = [self, unGladiador])
  }
}
