class EnfermedadInfecciosa{
	var celulasQueAmenaza 
	
	method agravarOAtenuar(celulasAfectadas){
		celulasQueAmenaza = celulasAfectadas
		
	}
	
	method celulasQueAmenaza() = celulasQueAmenaza
	
	method producirEfecto(persona){
		if(persona.temperaturaQueTiene() < 45){ // si es menor a 45 se la puedo subir.No chequeo que pase los 45 pq eso es responsabilidad de la persona
			persona.aumentarTemperatura(celulasQueAmenaza / 1000 ) //es el aumento
		}
	}
	
	method reproducirse(){
		celulasQueAmenaza *= 2 //duplica la cantidad que amenaza
	}
	
	method esAgresiva(personaAtacada){
		return celulasQueAmenaza > (personaAtacada.celulasQueTiene() * 0.01) //si supera el 0.1% es agresiva
	}
}


class EnfermedadAutoInmune{
	var celulasQueAmenaza
	var vecesQueAfectoAPersona = 0
	
	method celulasQueAmenaza() = celulasQueAmenaza
	
	method agravarOAtenuar(celulasAfectadas){
		celulasQueAmenaza = celulasAfectadas
		
	}
	
	method producirEfecto(persona){
		persona.reducirCelulasSanas(celulasQueAmenaza)
		vecesQueAfectoAPersona += 1 //cada dia que la persona vive, se suma un dia que tuvo la enfermedad
	}
	
	method esAgresiva(personaAtacada){
		return vecesQueAfectoAPersona > 30 //si produjo su efecto mas de 30 veces es agresiva
	}
	
}

