
package Modelo;

import Configuracion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
  public Empleado Validar(String user, String dni) {
    Empleado em = new Empleado();
    String sql = "SELECT * FROM empleado WHERE User = ? AND Dni = ?";
    try {
        con = cn.Conexion();
        ps = con.prepareStatement(sql); 
        ps.setString(1, user);
        ps.setString(2, dni);
        rs = ps.executeQuery();
        
        if (rs.next()) { // Solo necesitamos esto si el primer resultado si existe
            em.setId(rs.getInt("IdEmpleado"));
            em.setUser(rs.getString("User"));
            em.setDni(rs.getString("Dni"));
            em.setNom(rs.getString("Nombres"));
            em.setTel(rs.getString("Telefono"));
            em.setPagoDiario(rs.getInt("PagoDiario"));
            em.setDiasTrabajo(rs.getInt("DiasTrabajo"));
            em.setsueldoSemanal(rs.getInt("sueldoSemanal"));
        }
        
    } catch (Exception e) {
        e.printStackTrace(); 
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    return em;
}

    public List<Empleado> listar() {
    String sql = "SELECT * FROM empleado";
    List<Empleado> lista = new ArrayList<>();
    try {
        con = cn.Conexion();
        ps = con.prepareCall(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Empleado em = new Empleado();
            em.setId(rs.getInt("IdEmpleado"));
            em.setDni(rs.getString("Dni"));
            em.setNom(rs.getString("Nombres"));
            em.setTel(rs.getString("Telefono"));
            em.setPagoDiario(rs.getInt("PagoDiario"));
            em.setDiasTrabajo(rs.getInt("DiasTrabajo"));
            em.setsueldoSemanal(rs.getInt("sueldoSemanal"));
            em.setUser(rs.getString("User"));
            lista.add(em);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return lista;
}

  
  public int agregar(Empleado em){
     
        String sql = "insert into empleado(Dni,Nombres,Telefono,PagoDiario,DiasTrabajo,sueldoSemanal,User) values(?,?,?,?,?,?,?)"; // Corregido la consulta SQL
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, em.getDni());
            ps.setString(2, em.getNom());
            ps.setString(3, em.getTel());
            ps.setInt(4, em.getPagoDiario());
            ps.setInt(5, em.getDiasTrabajo());
            ps.setInt(6, em.getsueldoSemanal());
            ps.setString(7, em.getUser());
            ps.executeUpdate();
       
        } catch (Exception e) {
            e.printStackTrace();
        }
        return r;
  }
  
    public Empleado listarId(int id) {
    Empleado emp = new Empleado();
    String sql = "SELECT * FROM empleado WHERE IdEmpleado = " + id;
    try {
        con = cn.Conexion();
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        if (rs.next()) {
            emp.setId(rs.getInt("IdEmpleado"));
            emp.setDni(rs.getString("Dni"));
            emp.setNom(rs.getString("Nombres"));
            emp.setTel(rs.getString("Telefono"));
            emp.setPagoDiario(rs.getInt("PagoDiario"));
            emp.setDiasTrabajo(rs.getInt("DiasTrabajo"));
            emp.setsueldoSemanal(rs.getInt("sueldoSemanal"));
            emp.setUser(rs.getString("User"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return emp;
}


   public int actualizar(Empleado em){
       String sql = "update empleado set Dni=?,Nombres=?,Telefono=?,PagoDiario=?,DiasTrabajo=?,sueldoSemanal=?,User=? where idEmpleado=?"; // Corregido la consulta SQL
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, em.getDni());
            ps.setString(2, em.getNom());
            ps.setString(3, em.getTel());
            ps.setInt(4, em.getPagoDiario());
            ps.setInt(5, em.getDiasTrabajo());
            ps.setInt(6, em.getsueldoSemanal());
            ps.setString(7, em.getUser());
            ps.setInt(8, em.getId());
            ps.executeUpdate();
       
        } catch (Exception e) {
            e.printStackTrace();
        }
        return r;
  }
   
  public void delete (int id){
      String sql = "delete from empleado where IdEmpleado="+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
  }
}
