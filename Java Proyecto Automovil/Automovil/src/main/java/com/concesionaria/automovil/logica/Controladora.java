package com.concesionaria.automovil.logica;

import com.concesionaria.automovil.persistencia.ControladoraPersistencia;

public class Controladora {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public void agregarAutomovil(String modelo, String marca, String motor, String color, 
                                 String patente, int cantPuertas) {
        
        Automovil auto = new Automovil();
        auto.setModelo(modelo);
        auto.setMarca(marca);
        auto.setColor(color);
        auto.setPatente(patente);
        auto.setMotor(motor);
        auto.setCantPuertas(cantPuertas);
        
        
        controlPersis.agregarAutomovil(auto);
        
        
        
        
        
    }
 
    
    
    
}
