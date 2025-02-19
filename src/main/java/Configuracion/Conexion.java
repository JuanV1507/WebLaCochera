
package Configuracion;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    String url="jdbc:mysql://localhost:3306/bd_ventas";
    String user="root";
    String pass="";
    
    public Connection Conexion(){
         Connection con = null;
               try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
            System.out.println("Conexión exitosa a la base de datos.");
        } catch (Exception e){
            System.out.println("Error al conectar a la base de datos: " + e.getMessage());
        }
        return con;

    }
}
