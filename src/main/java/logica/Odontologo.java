
package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Odontologo extends Persona implements Serializable{
    
    //private int id_odontologo;
    private String especialidad;
    @OneToOne
    private Horario horario;
    @OneToOne
    private Usuario usuario;
    @OneToMany (mappedBy="odonto") // mapeado del otro lado de la relacion
    private List<Turno> turnos;
    
    
    public Odontologo() {
    } 

    public Odontologo(String especialidad, Horario horario, Usuario usuario, List<Turno> turnos, int id, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nac) {
        super(id, dni, nombre, apellido, telefono, direccion, fecha_nac);
        this.especialidad = especialidad;
        this.horario = horario;
        this.usuario = usuario;
        this.turnos = turnos;
    }

    

    

    /*public int getId_odontologo() {
        return id_odontologo;
    }*/

    /*public void setId_odontologo(int id_odontologo) {
        this.id_odontologo = id_odontologo;
    }*/

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public Horario getHorario() {
        return horario;
    }

    public void setHorario(Horario horario) {
        this.horario = horario;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public List<Turno> getTurnos() {
        return turnos;
    }

    public void setTurnos(List<Turno> turnos) {
        this.turnos = turnos;
    }
    
    
    
    
    
    
}
