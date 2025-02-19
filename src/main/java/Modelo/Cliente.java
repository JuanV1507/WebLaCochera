
package Modelo;

public class Cliente {
    int idCliente;
    String dni;
    String nombres;
    String Direccion;
    String Referencias;
    
    public Cliente(){
        
    }

    public Cliente(int idCliente, String dni, String nombres, String Direccion, String Referencias) {
        this.idCliente = idCliente;
        this.dni = dni;
        this.nombres = nombres;
        this.Direccion = Direccion;
        this.Referencias = Referencias;
    }
    
    

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getReferencias() {
        return Referencias;
    }

    public void setReferencias(String Referencias) {
        this.Referencias = Referencias;
    }
    
    
}

    
