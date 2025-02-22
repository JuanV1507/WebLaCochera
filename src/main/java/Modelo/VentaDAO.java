
package Modelo;

import Configuracion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class VentaDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
 
    public String GenerarSerie() {
        String NumeroSerie = "";
        String sql = "SELECT MAX(NumSerie) FROM ventas";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) { // Solo entra si hay resultados
                NumeroSerie = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Muestra el error en la consola
        }
        return NumeroSerie;
    }

    
    public List<Venta> listar() {
    String sql = "SELECT * FROM ventas";
    List<Venta> lista = new ArrayList<>();
    try {
        con = cn.Conexion();
        ps = con.prepareCall(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Venta vt = new Venta();
            vt.setId(rs.getInt("idVenta"));
            vt.setSerie(rs.getString("NroSerie"));
            vt.setFecha(rs.getString("Fecha"));
            vt.setServicio(rs.getString("Servicio"));
            vt.setTamaño(rs.getString("Tamano"));
            vt.setPlacas(rs.getString("Placas"));
            vt.setModelo(rs.getString("Modelo"));
            vt.setLavador(rs.getString("Lavador"));
            vt.setPrecio(rs.getInt("Precio"));
            vt.setCliente(rs.getString("Cliente"));
            vt.setCelular(rs.getString("Celular"));
            vt.setCantidad(rs.getInt("CantidadAdicional"));
            vt.setPrecioExtra(rs.getInt("PrecioAdicional"));
            vt.setComentario(rs.getString("Comentarios"));
            vt.setTotal(rs.getInt("Total"));
        
            lista.add(vt);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return lista;
}
    
    public int guardarVenta(Venta vt) {
    String sql = "INSERT INTO ventas (NroSerie, Fecha, Servicio, Tamano, Placas, Modelo, Lavador, Precio, Cliente, Celular, CantidadAdicional, PrecioAdicional, Comentarios, Total) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    try {
        con = cn.Conexion();
        ps = con.prepareStatement(sql);

        // Establecer los valores de los nuevos campos en la consulta SQL
        ps.setString(1, vt.getSerie());
        ps.setString(2, vt.getFecha());
        ps.setString(3, vt.getServicio());
        ps.setString(4, vt.getTamaño());
        ps.setString(5, vt.getPlacas());
        ps.setString(6, vt.getModelo());
        ps.setString(7, vt.getLavador());
        ps.setInt(8, vt.getPrecio());
        ps.setString(9, vt.getCliente());
        ps.setString(10, vt.getCelular());
        ps.setInt(11, vt.getCantidad());
        ps.setInt(12, vt.getPrecioExtra());
        ps.setString(13, vt.getComentario());
        ps.setInt(14, vt.getTotal());

        // Ejecutar la consulta
        ps.executeUpdate();

    } catch (SQLException e) {
        System.out.println("Error: " + e);
    }
    return r;
}

    


}
