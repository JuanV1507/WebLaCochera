
package Modelo;

public class Venta {
 
    int id;
    int item;
    String Serie;
    String Servicio;
    String Tamaño;
    String Descripcion;
    String Placas;
    String Modelo;
    String Lavador;
    int Precio;
    String Comentario;
    int Cantidad;
    String ServicioExtra;
    int PrecioExtra;
    int total;

    public Venta() {
    }

    public Venta(int id, int item, String Serie, String Servicio, String Tamaño, String Descripcion, String Placas, String Modelo, String Lavador, int Precio, String Comentario, int Cantidad, String ServicioExtra, int PrecioExtra, int total) {
        this.id = id;
        this.item = item;
        this.Serie = Serie;
        this.Servicio = Servicio;
        this.Tamaño = Tamaño;
        this.Descripcion = Descripcion;
        this.Placas = Placas;
        this.Modelo = Modelo;
        this.Lavador = Lavador;
        this.Precio = Precio;
        this.Comentario = Comentario;
        this.Cantidad = Cantidad;
        this.ServicioExtra = ServicioExtra;
        this.PrecioExtra = PrecioExtra;
        this.total = total;
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

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
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

    public String getComentario() {
        return Comentario;
    }

    public void setComentario(String Comentario) {
        this.Comentario = Comentario;
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

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}

    