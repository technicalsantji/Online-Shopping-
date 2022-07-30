/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Com.Helper;

import java.sql.*;

public class ConnectionProvider {
 private static Connection con;
    
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3308/shopping","root","");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
      return con;
    }
    
}
