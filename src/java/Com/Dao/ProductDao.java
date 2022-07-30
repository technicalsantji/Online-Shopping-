/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Com.Dao;

import Com.Entity.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

public class ProductDao {

    Connection con;

    public ProductDao(Connection con) {
        this.con = con;
    }

    public boolean insertProduct(Product product) {
        boolean f = false;
        try {
            String q = "insert into product(pname,pcategory,pprice,pactive) values(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, product.getPname());
            ps.setString(2, product.getPcategory());
            ps.setInt(3, product.getPprice());
            ps.setString(4, product.getPacitive());
           ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int maxId() {
        int p =0;
        try {
            String q = "select max(pid) from product";
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = rs.getInt(1);
                p=p+1;
            }
        } catch (Exception e) {
        }
        return p;
    }
    public List<Product> allProductList(){
       List<Product> list=new ArrayList<>();
        try {
            String q="select * from product";
            PreparedStatement ps=con.prepareStatement(q);
         ResultSet rs= ps.executeQuery();
            while (rs.next()) {  
              int id=rs.getInt("pid");
              String name=rs.getString("pname");
              String category=rs.getString("pcategory");
              int price=rs.getInt("pprice");
              String active=rs.getString("pactive");
              Product d=new Product(id, name, category, price, active);
              list.add(d);
                      
              
                
            }
        } catch (Exception e) {
     
        }
        return list;
    }
    public Product allProductById(int id){
        Product p=null;
        try {
            String q="select * from product where pid=?";
            PreparedStatement ps=con.prepareStatement(q);
            ps.setInt(1,id);
          ResultSet rs=ps.executeQuery();
            while(rs.next()) { 
                 p=new Product();
                p.setId(rs.getInt("pid"));
                 p.setPname(rs.getString("pname"));
                  p.setPcategory(rs.getString("pcategory"));
                   p.setPprice(rs.getInt("pprice"));
                    p.setPacitive(rs.getString("pactive"));
                    
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }
    public boolean  editProductByid(Product p){
        boolean f=false;
        try {
        String q="update product set pname=?, pcategory=?,pprice=?,pactive=? where pid=?";
        PreparedStatement ps=con.prepareStatement(q);
        ps.setString(1, p.getPname());
        ps.setString(2, p.getPcategory());
        ps.setInt(3, p.getPprice());
        ps.setString(4, p.getPacitive());
        ps.setInt(5,p.getId());
        ps.executeUpdate();
        if(p.getPacitive().equals("no")){
            ps=con.prepareStatement("delete from cart where pid=? and address is null");
            ps.executeUpdate();
           
        }
         f=true;
        } catch (Exception e) {
        }
        
        
        
        return f;
    }
  
            
    
    

}
