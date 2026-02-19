/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author pruthvimax
 */
public class DBConfig {
     public Connection getConnection() throws SQLException
    {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefooddelivery","root","");
            return con;
        }
        catch(ClassNotFoundException | SQLException e){
            System.out.println(e);
        }
        return null;
    }

}
