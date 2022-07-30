<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@include file="adminHeader.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>

<title>Deliver Item</title>
<link rel="stylesheet" href="css/ordersReceived-style.css">
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Delivered Orders <i class='fas fa-dolly'></i></div>

<table id="customers">
          <tr>
          <th>Mobile Number</th>
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Country</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">T-ID</th>
              <th scope="col">Status</th>
          </tr>
        <% 
        try {
                Connection con=ConnectionProvider.getConnection();
                PreparedStatement ps=con.prepareStatement("select * from cart inner join product where cart.pid=product.pid and cart.status='deliver'");
             ResultSet rs= ps.executeQuery();
             while (rs.next()) {                     
                
        %>
          <tr>
              <td><%= rs.getString(10) %></td>
            <td><%= rs.getString(17) %></td>
            <td><%= rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%= rs.getString(5) %> </td>
                <td><%= rs.getString(6) %></td>
               <td><%= rs.getString(7) %></td>
                <td><%= rs.getString(8) %></td>
                 <td><%= rs.getString(9)%></td>
             <td><%= rs.getString(11) %></td>
              <td><%= rs.getString(12) %></td>
               <td><%= rs.getString(13) %></td>
               <td><%= rs.getString(14) %></td>
               <td><%= rs.getString(15) %></td>
              </tr>
              
           <%      }
            } catch (Exception e) {
            }
        
        %>
        </table>
      <br>
      <br>
      <br>

</body>
</html>