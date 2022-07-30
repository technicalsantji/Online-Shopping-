/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Com.Dao;

import Com.Entity.User;
import java.sql.*;
import java.sql.PreparedStatement;


public class UserDao {
    Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
   public boolean insertUser(User user){
       boolean f=false;
       try {
           String q="insert into user(uname,uemail,uphone,uquestion,uanswer,upassword) values(?,?,?,?,?,?)";
           PreparedStatement pst=con.prepareStatement(q);
           pst.setString(1, user.getUname().trim());
           pst.setString(2, user.getUemail().trim());
           pst.setString(3, user.getUphone().trim());
           pst.setString(4, user.getUsecurity().trim());
           pst.setString(5, user.getUanswer().trim());
           pst.setString(6, user.getUpassword().trim());
           pst.executeUpdate();
           f=true;
       } catch (Exception e) {
           e.printStackTrace();
       }
       return f;
   }
   public User loginByemailAndpassword(String email,String password){
      User user=null;
       try {
           String q="select * from user where uemail=? and upassword=?";
           PreparedStatement ps=con.prepareStatement(q);
           ps.setString(1, email);
           ps.setString(2, password);
      ResultSet rs=ps.executeQuery();
      while(rs.next()){
          user=new User();
          user.setUid(rs.getInt("uid"));
           user.setUname( rs.getString("uname"));
            user.setUemail( rs.getString("uemail"));
             user.setUphone(rs.getString("uphone"));
              user.setUsecurity( rs.getString("uquestion"));
             user.setUanswer(rs.getString("uanswer"));
               user.setUpassword( rs.getString("upassword"));
               user.setAddress(rs.getString("address"));
               user.setCity(rs.getString("city"));
               user.setState(rs.getString("state"));
               user.setCountry(rs.getString("country"));
                  
      }
       } catch (Exception e) {
           e.printStackTrace();
       }
       return user;
   }
   public boolean forgotpassword(String email,String phone,String question,String answer,String password){
      boolean f=false;
       try {
           String q="select * from user where uemail=? and uphone=? and uquestion=? and uanswer=?";
           PreparedStatement ps=con.prepareStatement(q);
           ps.setString(1,email);
           ps.setString(2,phone);
           ps.setString(3,question);
           ps.setString(4,answer);
           ResultSet rs=ps.executeQuery();
           while (rs.next()) { 
                        ps=con.prepareStatement("UPDATE user SET upassword = ? WHERE uemail = ?");
                       ps.setString(1,password);
                       ps.setString(2,email);
                       ps.executeUpdate();
                       f=true;
           }
       } catch (Exception e) {
           e.printStackTrace();
       }
       return f;
   } 
   
}
