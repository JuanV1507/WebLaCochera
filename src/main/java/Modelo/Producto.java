package Modelo;

public class Producto {
    int idProducto;
    String Nombre;
    
    // Constructor vacío
    public Producto() {
    }

    // Constructor con parámetros
    public Producto(int idProducto, String Nombre) {
        this.idProducto = idProducto;
        this.Nombre = Nombre; 
       
     
    }

    // Getter y Setter para idProducto
    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    // Getter y Setter para Nombre
    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

}