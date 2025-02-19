package Modelo;

import Configuracion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    // Listar todos los productos
    public List<Producto> listar() {
        String sql = "SELECT * FROM producto";
        List<Producto> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto pd = new Producto();
                pd.setIdProducto(rs.getInt("IdProducto"));
                pd.setNombre(rs.getString("Nombre"));
                lista.add(pd);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Agregar un nuevo producto
    public int agregar(Producto pd) {
        String sql = "INSERT INTO producto(Nombre) VALUES (?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pd.getNombre());
            r = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    // Listar un producto por su ID
    public Producto listarId(int IdProducto) {
        Producto pdt = new Producto();
        String sql = "SELECT * FROM producto WHERE IdProducto = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, IdProducto); // ✅ Asignar el ID antes de ejecutar la consulta
            rs = ps.executeQuery();
            if (rs.next()) {
                pdt.setIdProducto(rs.getInt("IdProducto"));
                pdt.setNombre(rs.getString("Nombre"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pdt;
    }

    // Actualizar un producto
    public int actualizar(Producto pd) {
        String sql = "UPDATE producto SET Nombre = ? WHERE IdProducto = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pd.getNombre());
            ps.setInt(2, pd.getIdProducto()); // ✅ Asegurar que se está enviando el ID correcto
            r = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    // Eliminar un producto por ID
    public void delete(int IdProducto) {
        String sql = "DELETE FROM producto WHERE IdProducto = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, IdProducto); // ✅ Ahora sí se asigna el parámetro
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
