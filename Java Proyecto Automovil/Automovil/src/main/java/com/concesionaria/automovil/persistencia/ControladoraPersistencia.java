package com.concesionaria.automovil.persistencia;

import com.concesionaria.automovil.logica.Automovil;

public class ControladoraPersistencia {

    AutomovilJpaController autoJPA = new AutomovilJpaController();
    
    public void agregarAutomovil(Automovil auto) {
        
        autoJPA.create(auto);
                
        
    }
 
        
    
    
}
