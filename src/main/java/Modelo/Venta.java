
package Modelo;

public class Venta {
 
  int id;
    int item;
    String Serie;
    String Fecha;
    String Servicio;
    String Tamaño;
   String Placas;
   String Modelo;
   String Lavador;
   int Precio;
   String Cliente;
   String Celular;
    int Cantidad;
    String ServicioExtra;
    int PrecioExtra;
    String Comentario;
    int Total;

    public Venta() {
    }

    public Venta(int id, int item, String Serie, String Fecha, String Servicio, String Tamaño, String Placas, String Modelo, String Lavador, int Precio, String Cliente, String Celular, int Cantidad,String ServicioExtra, int PrecioExtra, String Comentario, int Total) {
        this.id = id;
        this.item = item;
        this.Serie = Serie;
        this.Fecha = Fecha;
        this.Servicio = Servicio;
        this.Tamaño = Tamaño;
        this.Placas = Placas;
        this.Modelo = Modelo;
        this.Lavador = Lavador;
        this.Precio = Precio;
        this.Cliente = Cliente;
        this.Celular = Celular;
        this.Cantidad = Cantidad;
        this.ServicioExtra=ServicioExtra;
        this.PrecioExtra = PrecioExtra;
        this.Comentario = Comentario;
        this.Total = Total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public String getSerie() {
        return Serie;
    }

    public void setSerie(String Serie) {
        this.Serie = Serie;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public String getServicio() {
        return Servicio;
    }

    public void setServicio(String Servicio) {
        this.Servicio = Servicio;
    }

    public String getTamaño() {
        return Tamaño;
    }

    public void setTamaño(String Tamaño) {
        this.Tamaño = Tamaño;
    }

    public String getPlacas() {
        return Placas;
    }

    public void setPlacas(String Placas) {
        this.Placas = Placas;
    }

    public String getModelo() {
        return Modelo;
    }

    public void setModelo(String Modelo) {
        this.Modelo = Modelo;
    }

    public String getLavador() {
        return Lavador;
    }

    public void setLavador(String Lavador) {
        this.Lavador = Lavador;
    }

    public int getPrecio() {
        return Precio;
    }

    public void setPrecio(int Precio) {
        this.Precio = Precio;
    }

    public String getCliente() {
        return Cliente;
    }

    public void setCliente(String Cliente) {
        this.Cliente = Cliente;
    }

    public String getCelular() {
        return Celular;
    }

    public void setCelular(String Celular) {
        this.Celular = Celular;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }
    
     public String getServicioExtra() {
        return ServicioExtra;
    }

    public void setServicioExtra(String ServicioExtra) {
        this.ServicioExtra = ServicioExtra;
    }

    public int getPrecioExtra() {
        return PrecioExtra;
    }

    public void setPrecioExtra(int PrecioExtra) {
        this.PrecioExtra = PrecioExtra;
    }

    public String getComentario() {
        return Comentario;
    }

    public void setComentario(String Comentario) {
        this.Comentario = Comentario;
    }

    public int getTotal() {
        return Total;
    }

    public void setTotal(int Total) {
        this.Total = Total;
    }
}
