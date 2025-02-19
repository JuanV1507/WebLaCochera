
package Controlador;

import Modelo.Empleado;
import Modelo.EmpleadoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Validar extends HttpServlet {
    EmpleadoDAO edao= new EmpleadoDAO();
    Empleado em=new Empleado();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter())
        {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        
        // Verificar si 'accion' es nulo para evitar NullPointerException
        if (accion == null) {
            response.sendRedirect("index.jsp"); // Redirecciona al login si 'accion' es nulo
            return;
        }

        // Validar el valor de 'accion'
        if (accion.equalsIgnoreCase("Ingresar")) {
            String user = request.getParameter("txtuser");
            String pass = request.getParameter("txtpass");
            em = edao.Validar(user, pass);
            
            if (em.getUser() != null) {
                // Redirige al controlador principal si el usuario es válido
                request.setAttribute("usuario", em);
                request.getRequestDispatcher("Controlador?menu=Principal").forward(request, response);
            } else {
                // Redirige al login en caso de datos incorrectos
                request.setAttribute("errorMessage", "Usuario o contraseña incorrectos");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else {
            // Acción no válida, redirige a la página de login
            response.sendRedirect("index.jsp");
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
