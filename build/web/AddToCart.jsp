



<%@page import="Com.Entity.User"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
   
    try {
        User u =(User)session.getAttribute("currentuser");
    String p_id= request.getParameter("id");
    int pid=Integer.parseInt(p_id);
    int quantity=1;
    int pprice=0;
    int ptotal=0;
    int ctotal=0;
    int a=0;
           Connection con=ConnectionProvider.getConnection();
          PreparedStatement ps=con.prepareStatement("select * from product where pid=?");
          ps.setInt(1, pid);
          ResultSet rs=ps.executeQuery();
          while (rs.next()) {                  
                  pprice=rs.getInt(4);
                  ptotal=pprice;
              }
          PreparedStatement ps1=con.prepareStatement("select * from cart where pid=? and email=? and address is Null");
         ps1.setInt(1, pid);
         ps1.setString(2,u.getUemail());
         ResultSet rs1=ps1.executeQuery();
         while (rs1.next()) {
                ctotal=rs1.getInt(5);
                ctotal=ctotal+ptotal;
                quantity=rs1.getInt(3);
                quantity=quantity+1;
                a=1;
                 
             }
         if (a==1) {
              String q="update cart set total=? ,quantity=? where pid=? and email=? and address is Null";
                PreparedStatement ps2=con.prepareStatement(q);
                ps2.setInt(1,ctotal);
                ps2.setInt(2, quantity);
                ps2.setInt(3, pid);
                ps2.setString(4,u.getUemail());
                 ps2.executeUpdate();
                 response.sendRedirect("home.jsp?msg=exit");
             } 
             if(a==0){
                 String q="insert into cart (email,pid,quantity,price,total) values (?,?,?,?,?)";
             PreparedStatement ps3=con.prepareStatement(q);
             ps3.setString(1,u.getUemail());
             ps3.setInt(2, pid);
             ps3.setInt(3, quantity);
             ps3.setInt(4, pprice);
             ps3.setInt(5,ptotal);
             ps3.executeUpdate();
             response.sendRedirect("home.jsp?msg=add");
             }
        } catch (Exception e) {
             response.sendRedirect("home.jsp?msg=invalid");
        }
%>