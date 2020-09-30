class Persona{
	var enfermedadesContraidas = #{} //no tiene repetidos y no tiene orden
	var temperatura
	var celulasSanas
	
	
	method mostrarTemperatura() = temperatura
	
	method contraerEnfermedad(enfermedad){
		if(enfermedadesContraidas.size() >= 5){
			self.error("No puede contraer mas enfermedades") //no puede tener mas de 5 enfermedades	
		}else{
			enfermedadesContraidas.add(enfermedad)
		}
	}
	
	method vivir(){
			enfermedadesContraidas.forEach({enfermedad => enfermedad.producirEfecto(self)}) //cada dia que vive, cada enfermedad contraida causa su efecto en la persona
	}
	
	method temperaturaQueTiene() = temperatura
	
	method cambiarTemperatura(nuevaTemp){
		temperatura = nuevaTemp
	}
	
	method aumentarTemperatura(aumentoTemp){
		temperatura = 45.min(temperatura + aumentoTemp) //no puede superar los 45 entonces tomo el minimo entre 45 y el aumento
	}
	
	method reducirCelulasSanas(celulasDestruidas){
		celulasSanas -= celulasDestruidas //pierde x celulas
	}
	
	method tieneEnfermedad(enfermedad) = enfermedadesContraidas.contains(enfermedad)
	
	method celulasQueTiene() = celulasSanas
	
	method cambiarCelulasQueTiene(celulas){
		celulasSanas = celulas
	}
	
	method estaEnComa(){
		return (temperatura == 45) || celulasSanas <= 1000000 // || es lo mismo que poner or pero mas fachero
	}
	
	//agrego extras que no lo pide pero puede ser util tener
	
	method enfermedadesAgresivasContraidas() {
		return enfermedadesContraidas.filter({enfermedad => enfermedad.esAgresiva(self)})
		
		}
	
	method cantDeCelulasAmenazadasPorEnfermedadesAgresivas(){
		return self.enfermedadesAgresivasContraidas().sum({enfermedad => enfermedad.celulasQueAmenaza()})
		
		}
	
}


