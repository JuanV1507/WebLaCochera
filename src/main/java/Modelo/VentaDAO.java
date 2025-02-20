
package Modelo;

import Configuracion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class VentaDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
    public String GenerarSerie (){
       String NumeroSerie="";
       String sql="select max(NumSerie)* from ventas";
       try{
           con=cn.Conexion();
           ps=con.prepareStatement(sql);
           rs=ps.executeQuery();
           while (rs.next()){
               NumeroSerie=rs.getString(1);
           }
       } catch (Exception e){
           
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
           
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return lista;
}

}
