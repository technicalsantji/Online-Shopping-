<%@page import="Com.Entity.User"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>
    
     <% 
         User user=(User)session.getAttribute("currentuser");
        int total=0;
        int s_no=0;
    try {
            Connection con=ConnectionProvider.getConnection();
            String q="select sum(total) from cart where email=? and status='bill'";
            PreparedStatement p=con.prepareStatement(q);
            p.setString(1, user.getUemail());
            ResultSet rs=p.executeQuery();
            while (rs.next()) {                    
                    total=rs.getInt(1);
                }
            


                
            String q1="select * from user inner join cart where cart.email=? and cart.status='bill'";
            PreparedStatement ps=con.prepareStatement(q1);
            ps.setString(1, user.getUemail());
            ResultSet rs1=ps.executeQuery();
            while (rs1.next()) {                    
                    
                
         %>   
       
   

<h3>Online shopping Bill</h3>
<hr>
<div class="left-div"><h3>Name: <%=user.getUname() %> </h3></div>
<div class="right-div-right"><h3>Email: <%=user.getUname() %>  </h3></div>
<div class="right-div"><h3>Mobile Number: <%=rs1.getString("mobileno") %> </h3></div>  

<div class="left-div"><h3>Order Date: <%=rs1.getString("orderdate") %> </h3></div>
<div class="right-div-right"><h3>Payment Method: <%=rs1.getString("paymentmethod") %> </h3></div>
<div class="right-div"><h3>Expected Delivery:<%=rs1.getString("deliverydate") %>  </h3></div> 

<div class="left-div"><h3>Transaction Id: <%=rs1.getString("transactionid") %> </h3></div>
<div class="right-div-right"><h3>City:<%=rs1.getString("city") %>  </h3></div> 
<div class="right-div"><h3>Address: <%=rs1.getString("address") %> </h3></div> 

<div class="left-div"><h3>State:<%=rs1.getString("state") %>  </h3></div>
<div class="right-div-right"><h3>Country: <%=rs1.getString("country") %> </h3></div>  

<hr>

<%
   
break;
 } 
%>
	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
   <%
          
      
        PreparedStatement ps1=con.prepareStatement("select * from cart inner join product where cart.pid=product.pid and cart.email=? and cart.status='bill'");
        ps1.setString(1, user.getUemail());
       
        ResultSet rs2= ps1.executeQuery();
        while (rs2.next()) {                
                s_no=s_no+1;
            
      %>
  <tr>
     
      <td><%= s_no %></td>
      <td><%= rs2.getString(17) %></td>
    <td><%= rs2.getString(18) %></td>
    <td><%= rs2.getString(4) %></td>
    <td><%= rs2.getString(3) %></td>
     <td><%= rs2.getString(5) %></td>
     
    
  </tr>
   <%  }
     }
catch(Exception e){

}

     %>
  <tr>

</table>
     <h3>Total:<%=total %> </h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>

</body>
</html>