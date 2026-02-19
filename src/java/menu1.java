/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dataBase.DBConfig;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pruthvimax
 */
public class menu1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name=request.getParameter("name");
              String cid=request.getParameter("cid");
            String price=request.getParameter("price");
        
           //  out.println("Name :"+name+"<br>");
             ///out.println("email :"+email+"<br>");
               //out.println("Phno :"+phno+"<br>");
             //out.println("address:"+address+"<br>");  
             // out.println("password:"+password+"<br>");  
      
             
               try{
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con =new DBConfig().getConnection();
                  Statement stat=con.createStatement();
                  stat.executeUpdate("INSERT INTO `menu` (`name`, `id`, `price`,`cid`) VALUES ('"+name+"',NULL, '"+price+"', '"+cid+"');");
                  out.println("<script>alert(\"Added Succesfully\")</script>");
                  out.println("<meta http-equiv='refresh'content='0;menu.jsp'/>");
                  
             }
              
             catch (Exception e)
             {
                 out.println(e);
                  out.println("<script>alert(\"Error\")</script>");
             //  out.println("<meta http-equiv='refresh'content='0;menu.jsp'/>");
                 
             }
    
        }
     
    
    
    }

    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
