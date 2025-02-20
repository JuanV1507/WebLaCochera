package Controlador;

import Config.StripeConfig;
import Configuracion.GenerarSerie;
import Modelo.Empleado;
import Modelo.EmpleadoDAO;
import Modelo.Producto;
import Modelo.ProductoDAO;
import Modelo.Venta;
import Modelo.VentaDAO;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Controlador extends HttpServlet {

    Empleado em = new Empleado();
    Producto pd = new Producto();
    EmpleadoDAO edao = new EmpleadoDAO();
    ProductoDAO pdao = new ProductoDAO();
    VentaDAO vdao= new VentaDAO();
    
    int ide;
    int idp;

    Venta v = new Venta();
    List<Venta> lista = new ArrayList<>();
    int item;
    String Servicio;
    String Tamaño;
    String Placas;
    String Modelo;
    String Lavador;
    int Precio;
    int Cantidad;
    String ServicioExtra;
    int PrecioExtra;
    String Comentarios;
    int Total;
    int TotalPagar;
    String numeroserie;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        

         //Manejo de pagos con Stripe
        String stripeToken = request.getParameter("stripeToken");
       if (stripeToken != null && !stripeToken.isEmpty()) {
          procesarPago(request, response, stripeToken);
        return; // Detenemos la ejecución aquí para evitar más redirecciones
        }
        if (menu == null)
        {
            response.sendRedirect("index.jsp"); // Redirige al login si "menu" es null
            return;
        }

        switch (menu)
        {

            case "Principal":
                request.getRequestDispatcher("Principal.jsp").forward(request, response);
                break;

            case "Empleado":
                if (accion == null)
                {
                    accion = "default"; // Acción predeterminada si no se especifica
                }
                switch (accion)
                {
                    case "Listar":
                        List<Empleado> lista = edao.listar();
                        request.setAttribute("Empleados", lista); // Enviar datos al JSP

                        break;

                    case "Agregar":
                        String dni = request.getParameter("txtDni");
                        String nom = request.getParameter("txtNombres");
                        String tel = request.getParameter("txtTel");
                        int pagoD = Integer.parseInt(request.getParameter("txtPagoDiario"));
                        int diasT = Integer.parseInt(request.getParameter("txtDiasTrabajo"));
                        String user = request.getParameter("txtUsuario");

                        em.setDni(dni);
                        em.setNom(nom);
                        em.setTel(tel);
                        em.setPagoDiario(pagoD);
                        em.setDiasTrabajo(diasT);
                        em.setUser(user);
                        edao.agregar(em);
                        request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                        break;

                    case "Editar":
                        ide = Integer.parseInt(request.getParameter("id"));
                        Empleado e = edao.listarId(ide);
                        request.setAttribute("empleado", e);
                        request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                        break;
                    case "Actualizar":
                        String dniAc = request.getParameter("txtDni");
                        String nomAc = request.getParameter("txtNombres");
                        String telAc = request.getParameter("txtTel");
                        int pagoAc = Integer.parseInt(request.getParameter("txtPagoDiario"));
                        int diasAc = Integer.parseInt(request.getParameter("txtDiasTrabajo"));
                        String userAc = request.getParameter("txtUsuario");

                        em.setDni(dniAc);
                        em.setNom(nomAc);
                        em.setTel(telAc);
                        em.setPagoDiario(pagoAc);
                        em.setDiasTrabajo(diasAc);
                        em.setUser(userAc);
                        em.setId(ide);
                        edao.actualizar(em);
                        request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                        break;

                    case "Delete":
                        ide = Integer.parseInt(request.getParameter("id"));
                        edao.delete(ide);
                        request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                        break;

                    default:
                        throw new AssertionError("Acción no válida: " + accion);
                }
                request.getRequestDispatcher("Empleado.jsp").forward(request, response); // Redirige al JSP después de manejar el caso
                break;
               
            case "Producto":
                switch (accion)
                {
                    case "Listar":
                        List<Producto> lista = pdao.listar();
                        request.setAttribute("Productos", lista);
                        break;

                    case "Agregar":
                        String Nombre = request.getParameter("txtNombre");
                        if (Nombre != null && !Nombre.isEmpty())
                        {
                            pd.setNombre(Nombre);
                            pdao.agregar(pd);
                        } else
                        {
                            System.out.println("Error: Nombre del producto es nulo o vacío");
                        }
                        request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                        break;

                    case "Editar":
                        String idEditar = request.getParameter("idProducto");
                      

                        if (idEditar != null && !idEditar.isEmpty())
                        {
                            idp = Integer.parseInt(idEditar);
                            Producto p = pdao.listarId(idp);
                            request.setAttribute("producto", p);
                        } else
                        {
                            System.out.println("Error: idProducto es nulo o vacío");
                        }
                        request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                        break;

                    case "Actualizar":
                        String idActualizar = request.getParameter("idProducto");
                        String NombreP = request.getParameter("txtNombre");
                   

                        if (idActualizar != null && !idActualizar.isEmpty() && NombreP != null && !NombreP.isEmpty())
                        {
                            idp = Integer.parseInt(idActualizar);
                            pd.setIdProducto(idp);
                            pd.setNombre(NombreP);
                            pdao.actualizar(pd);
                        } else {
                            System.out.println("Error: idProducto o Nombre es nulo o vacío");
                        }
                        request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                        break;

                    case "Delete":
                        String idEliminar = request.getParameter("idProducto");
                       

                        if (idEliminar != null && !idEliminar.isEmpty()) {
                            idp = Integer.parseInt(idEliminar);
                            pdao.delete(idp);
                        } else {
                            System.out.println("Error: idProducto es nulo o vacío");
                        }
                        request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                        break;

                    default:
                        throw new AssertionError("Acción no válida: " + accion);
                }
                request.getRequestDispatcher("Producto.jsp").forward(request, response);
                break;

            case "NuevaVenta":
                    HttpSession session = request.getSession();
                    lista = (List<Venta>) session.getAttribute("lista");

                    if (lista == null) { // Si la lista no está en la sesión, inicialízala
                        lista = new ArrayList<>();
                    }

                    if (accion == null || accion.equals("default")) {
                        request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
                    } else {
                        switch (accion) {
                               
                        case "Agregar":
                            TotalPagar=0;
                            item = item + 1;
                            Servicio = request.getParameter("Servicio");
                            Tamaño = request.getParameter("Tamanio");
                            Placas = request.getParameter("Placas");
                            Modelo = request.getParameter("Modelo");
                            Lavador = request.getParameter("Lavador");
                            Precio = Integer.parseInt(request.getParameter("Precio"));
                            Cantidad=Integer.parseInt(request.getParameter("Numero"));
                            ServicioExtra=request.getParameter("ServicioAdicional");
                            PrecioExtra=Integer.parseInt(request.getParameter("PrecioAdicional"));
                            Comentarios = request.getParameter("Comentario");
                            Total=Precio+PrecioExtra;
                            
                            v = new Venta();
                            v.setItem(item);
                            v.setServicio(Servicio);
                            v.setTamaño(Tamaño);
                            v.setPlacas(Placas);
                            v.setModelo(Modelo);
                            v.setLavador(Lavador);
                            v.setPrecio(Precio);
                            v.setCantidad(Cantidad);
                            v.setServicioExtra(ServicioExtra);
                            v.setPrecioExtra(PrecioExtra);
                            v.setTotal(Total);
                            v.setComentario(Comentarios);

                            lista.add(v); // Agrega la venta a la lista
                            session.setAttribute("lista", lista); // Guarda la lista en la sesión
                            for (int i=0; i<lista.size(); i++){
                                TotalPagar=TotalPagar+lista.get(i).getTotal();
                                
                            }
                            request.setAttribute("TotalPagar", TotalPagar);
                            break;
                        case "GenerarVenta":
                            v.setServicio(Servicio);
                            v.setTamaño(Tamaño);
                            v.setPlacas(Placas);
                            v.setSerie(numeroserie);
                            v.setModelo(Modelo);
                            v.setLavador(Lavador);
                            v.setPrecio(Precio);
                            v.setCantidad(Cantidad);
                            v.setPrecioExtra(PrecioExtra);
                            v.setTotal(Total);
                            v.setComentario(Comentarios);
                            
                        default:
                            numeroserie=vdao.GenerarSerie();
                            if (numeroserie==null || numeroserie.isEmpty()){
                                numeroserie="00000001";
                                request.setAttribute("nserie", numeroserie );
                            }
                            else {
                               int Incrementar= Integer.parseInt(numeroserie);
                               GenerarSerie gs= new GenerarSerie();
                               numeroserie=gs.NumeroSerie(Incrementar);
                                request.setAttribute("nserie", numeroserie);  
                     
                            } 
                         
                            request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
                    }
                }
                request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
                break;

 
            case "ReporteVentas":
                if (accion == null)
                {
                    accion = "default"; // Acción predeterminada si no se especifica
                }
                 request.getRequestDispatcher("ReporteVentas.jsp").forward(request, response);
                break;

            //default:
            //throw new ServletException("Acción no válida para NuevaVenta: " + accion);
            default:
                response.sendRedirect("index.jsp"); // Redirige al login si "menu" no coincide con ningún caso

        }
    }



        //  Declaro el metodo y le pongo 3 parametros la solicitud,la respuesta y el token de la API    
         private void procesarPago(HttpServletRequest request, HttpServletResponse response, String stripeToken)
            throws IOException, ServletException {

        // Asegurar que Stripe está configurado
        StripeConfig.configure();

        try
        {
            Map<String, Object> chargeParams = new HashMap<>();// Almaceno los parametros de la transaccion
            chargeParams.put("amount", 2000);  
            chargeParams.put("currency", "mxn");
            chargeParams.put("source", stripeToken); //La tarjeta del cliente
            chargeParams.put("description", "Pago por productos");

            Charge charge = Charge.create(chargeParams);//usa la API para procesar el pago y devuelve Charge(la transaccion)
            request.getSession().setAttribute("message", "Pago realizado con éxito");
            response.sendRedirect("success.jsp");

        } catch (StripeException e)
        {
            System.out.println("Error en Stripe: " + e.getMessage());
            request.getSession().setAttribute("message", "Error en Stripe: " + e.getMessage());
            response.sendRedirect("error.jsp");
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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    

}
