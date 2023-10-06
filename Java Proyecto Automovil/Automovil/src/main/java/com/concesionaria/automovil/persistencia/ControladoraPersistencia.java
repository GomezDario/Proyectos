package com.concesionaria.automovil.persistencia;

import com.concesionaria.automovil.logica.Automovil;
import com.concesionaria.automovil.persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {

    AutomovilJpaController autoJPA = new AutomovilJpaController();
    
    public void agregarAutomovil(Automovil auto) {
        
        autoJPA.create(auto);
                
        
    }

    public List<Automovil> traerAutos() {

        return autoJPA.findAutomovilEntities();
        
    }

    public void borrarAuto(int idAuto) throws NonexistentEntityException {

        // salvo el caso en que pase un id que no exista
        
        autoJPA.destroy(idAuto);
        
      
        
        
    }

    public Automovil traerAuto(int idAuto) {

        return autoJPA.findAutomovil(idAuto);
        
    }

    public void modificarAuto(Automovil auto) throws Exception {

        autoJPA.edit(auto);
        
    }
 
        
    
    
}
