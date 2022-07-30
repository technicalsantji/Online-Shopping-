
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<% 
   String msg=request.getParameter("msg");
   if("no".equals(msg)){
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
 <% }if("inc".equals(msg)){%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<% 
    }if("dec".equals(msg)){
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<% 
    }if("rem".equals(msg)){
%>
<h3 class="alert">Product Successfully Removed!</h3>
<% 
    }
%>
<table>
<thead>
    <% 
        int total=0;
        int s_no=0;
    try {
            Connection con=ConnectionProvider.getConnection();
            String q="select sum(total) from cart where email=? and address is null";
            PreparedStatement p=con.prepareStatement(q);
            p.setString(1, user.getUemail());
            ResultSet rs=p.executeQuery();
            while (rs.next()) {                    
                    total=rs.getInt(1);
                }
       
    %>

          <tr>
              <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%=total%> </th>
              <%if(total>0){%> <th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><%}%>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
            <%
                
            String q1="select * from product inner join cart on product.pid=cart.pid and cart.email=? and cart.address is Null";
            PreparedStatement ps=con.prepareStatement(q1);
            ps.setString(1, user.getUemail());
            ResultSet rs1=ps.executeQuery();
            while (rs1.next()) {                    
                    
                
         %>   
          <tr>
          <%s_no=s_no+1;%>
        <td><%=s_no%></td>
        <td><%=rs1.getString(2) %></td>
            <td><%= rs1.getString(3)%></td>
            <td><i class="fa fa-inr"></i> <%= rs1.getString(4)%></td>
            <td><a href="incdecquantity.jsp?id=<%= rs1.getString(1) %>&quantity=inc"><i class='fas fa-plus-circle'></i> </a> <%= rs1.getString(8)%> <a href="incdecquantity.jsp?id=<%= rs1.getString(1) %>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i> <%= rs1.getString(10)%></td>
            <td><a href="removeItemFromCart.jsp?id=<%= rs1.getString(1) %>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
<% 
   }
}catch(Exception e){
e.printStackTrace();
}
  %>      </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>