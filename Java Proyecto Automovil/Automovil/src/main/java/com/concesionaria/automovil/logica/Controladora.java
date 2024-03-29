package com.concesionaria.automovil.logica;

import com.concesionaria.automovil.persistencia.ControladoraPersistencia;
import com.concesionaria.automovil.persistencia.exceptions.NonexistentEntityException;
import java.util.List;

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

    public List<Automovil> traerAutos() {

       return controlPersis.traerAutos();
         
    }

    public void borrarAuto(int idAuto) throws NonexistentEntityException{

         controlPersis.borrarAuto(idAuto);
        
        
    }

    public Automovil traerAuto(int idAuto) {
  
        return controlPersis.traerAuto(idAuto);
        
    }

    public void modificarAuto(Automovil auto, String modelo, String marca, String motor, String color, String patente, int cantPuertas) {

        auto.setColor(color);
        auto.setMarca(marca);
        auto.setModelo(modelo);
        auto.setMotor(motor);
        auto.setPatente(patente);
        auto.setCantPuertas(cantPuertas);
        
        controlPersis.modificarAuto(auto);
        
    }
 
    
    
    
}
