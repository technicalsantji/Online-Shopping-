
<%@page import="java.sql.ResultSet"%>
<%@page import="Com.Entity.User"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
   if(window.history.forward(1)!=null){
       window.history.forward(1);
   }
       
</script>
</head>
<body>
<br>
<table>
<thead>
     <% 
         User user=(User)session.getAttribute("currentuser");
         String cid=request.getParameter("id");
        int total=0;
        int s_no=0;
      try {
            Connection con=ConnectionProvider.getConnection();
            String q="select sum(total) from cart where email=? and address is Null";
            PreparedStatement p=con.prepareStatement(q);
            p.setString(1, user.getUemail());
            ResultSet rs=p.executeQuery();
            while (rs.next()) {                    
                    total=rs.getInt(1);
                }
       
    %>


          <tr>
              <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
              <th scope="col" style="background-color: yellow;">Total: <%= total %><i class="fa fa-inr"></i> </th>
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
            <td><i class="fa fa-inr"></i><%= rs1.getString(4)%></td>
            <td> <%= rs1.getString(8)%></td>
            <td><i class="fa fa-inr"></i> <%= rs1.getString(10)%> </td>
            </tr>
            <%
            }

            %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="AddressOtherDetailsForBill" method="post">
 <div class="left-div">
 <h3>Enter Address</h3>
 <input type="text" class="input-style" name="address" required placeholder="Enter the Address" value="<%= user.getAddress()%>"/>
 </div>

<div class="right-div">
<h3>Enter city</h3>
<input type="text" name="city" class="input-style" required placeholder="Enter the city" value="<%= user.getCity() %>"/>
</div> 

<div class="left-div">
<h3>Enter State</h3>
<input type="text" name="state" class="input-style" placeholder="Enter the state" required value="<%= user.getState() %>"/>
</div>

<div class="right-div">
<h3>Enter country</h3>
<input type="text" name="country" class="input-style" placeholder="Enter the Country" required value="<%= user.getCountry() %>"/>
</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
<select class="input-style" name="payment">
    <option value="cash on delivery" > Cash On Delivery</option>
    <option value="online payment">Online Payment</option>
</select>
</div>

<div class="right-div">
<h3>Pay online Technical Santji</h3>
<input type="text" name="taxid" class="input-style" placeholder="Enter the Transaction Id" required />
<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input type="text" name="phone" class="input-style" placeholder="Enter the Mobile No. " required value="<%= user.getUphone() %>"/>
<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button type="submit" class="button"> Procced to Generate Bill and Save <i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
} catch (Exception e) {
        }%>
      <br>
      <br>
      <br>

</body>
</html>