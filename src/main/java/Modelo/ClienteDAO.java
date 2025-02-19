
package Modelo;
import Configuracion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    
    public Cliente buscarPorNombre(String Nombres) {
    Cliente cliente = null;
    String sql = "SELECT * FROM Cliente WHERE Nombres = ?";
    try {
        con = cn.Conexion(); // Usa la conexión del atributo
        ps = con.prepareStatement(sql); // Prepara la consulta
        ps.setString(1, Nombres); // Asigna el valor del parámetro
        rs = ps.executeQuery(); // Ejecuta la consulta
        if (rs.next()) {
            cliente = new Cliente();
            cliente.setIdCliente(rs.getInt("idCliente")); // Ajusta según los nombres de tus columnas
            cliente.setNombres(rs.getString("Nombres"));
            cliente.setDireccion(rs.getString("Direccion"));
            cliente.setReferencias(rs.getString("Referencias"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return cliente;
}


    
        public List<Cliente> listar() {
    String sql = "SELECT * FROM cliente";
    List<Cliente> lista = new ArrayList<>();
    try {
        con = cn.Conexion();
        ps = con.prepareCall(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Cliente cl = new Cliente();
            cl.setIdCliente(rs.getInt(1));
            cl.setDni(rs.getString(2));
            cl.setNombres(rs.getString(3));
            cl.setDireccion(rs.getString(4));
            cl.setReferencias(rs.getString(5));
            
            lista.add(cl);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return lista;
}
    
}
