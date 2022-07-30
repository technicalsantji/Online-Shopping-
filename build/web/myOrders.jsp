
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">category</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Status</th>
              
          </tr>
        </thead>
        <tbody>
            
          <tr>
              <%
                  int sno=0;
               try {
                     
            Connection con=ConnectionProvider.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from cart inner join product where cart.pid=product.pid and cart.email=? and cart.orderdate is not Null");
            ps.setString(1, user.getUemail());
             ResultSet rs=ps.executeQuery();
             while (rs.next()) {
                 sno=sno+1;
            %>
            <td><%=sno %></td>
            <td><%=rs.getString(18)%></td>
            <td><%=rs.getString(17)%></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString("pprice")%></td>
            <td><%=rs.getString("quantity")%></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString("total")%></td>
             <td><%=rs.getString("orderdate")%></td>
              <td><%=rs.getString("deliverydate")%></td>
               <td><%=rs.getString("paymentmethod")%></td>
               <td><%=rs.getString("status")%></td>
            </tr>
            <% 
                }  
                   } catch (Exception e) {
                   }%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>