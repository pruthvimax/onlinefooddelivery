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
import javax.servlet.http.HttpSession;

/**
 *
 * @author pruthvimax
 */
public class update extends HttpServlet {

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
           String phno=null;
            try{
           
           HttpSession hs=request.getSession();
 phno=hs.getAttribute("username").toString();
String password=hs.getAttribute("password").toString();
if(phno.equals("") || password.equals("") || phno.equals(null) ||password.equals(null))
{
    response.sendRedirect("admin.jsp");
}
}
catch(Exception e){
    out.println(e);
}
            String id=request.getParameter("id");
             try{
               Class.forName("com.mysql.jdbc.Driver");
               Connection con=new DBConfig().getConnection();
               Statement stat=con.createStatement();
               //out.println("UPDATE order SET status='supllied' WHERE id='"+id+"';");
               stat.executeUpdate("UPDATE `order` SET status='supllied' WHERE id='"+id+"';");
               out.println("<script>alert(\"Order Supplied Successfully\")</script>");
               out.println("<meta http-equiv='refresh' content='0;order.jsp'/>");
                         }                           
           catch(Exception e){
               out.println(e);
               out.println("<script>alert(\"Error Updating DATA\")</script>");
               out.println("<meta http-equiv='refresh' content='0;order.jsp'/>");
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
