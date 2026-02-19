/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dataBase.DBConfig;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pruthvimax
 */
public class supply extends HttpServlet {

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
            String foodid=request.getParameter("id");
           // Get the current date and time
        LocalDateTime currentDateTime = LocalDateTime.now();

        // Define a formatter to format the date and time
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

        // Format the current date and time using the formatter
        String time = currentDateTime.format(formatter);
           
            try{             
            HttpSession hs=request.getSession();
       phno=hs.getAttribute("phno").toString();
        String password=hs.getAttribute("password").toString();
        if(phno.equals("")|| password.equals("")||phno.equals("null")|| password.equals("null"))
        {
            response.sendRedirect("admin1.jsp");           
        }        
        }
    catch (Exception e){
        out.println(e);
        response.sendRedirect("admin1.jsp");
    }
         try{
                  
              Connection con1 =new DBConfig().getConnection();
                      Statement stat1=con1.createStatement();
             ResultSet res1=stat1.executeQuery("SELECT * FROM menu WHERE id='"+foodid+"';");
               // out.println("SELECT * FROM menu WHERE cid='"+cid+"';");
                 String price=null;
                 String name=null;
                    while(res1.next())
                  {
                     
                        price=res1.getString("price");
                        name=res1.getString("name");
                  }
            
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con =new DBConfig().getConnection();
                  Statement stat=con.createStatement();                  
                  stat.executeUpdate("INSERT INTO `supply` (`foodid`, `foodname`, `price`, `time`, `status`, `uid`) VALUES ('"+foodid+"', '"+name+"', '"+price+"', '"+time+"', 'supplaied', '"+phno+"');");
                  out.println("<script>alert(\"order Placed sucussfully\")</script>");
                  out.println("<meta http-equiv='refresh'content='0;history.jsp'/>");
             }
        
             catch (Exception e)
             {
                 out.println(e);
                  out.println("<script>alert(\"Error\")</script>");
             //  out.println("<meta http-equiv='refresh'content='0;category.jsp'/>");
                 
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
