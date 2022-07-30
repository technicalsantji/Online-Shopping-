<%-- 
    Document   : AddNewProduct
    Created on : Jul 19, 2022, 12:49:20 PM
    Author     : SANT JI
--%>

<%@page import="Com.Entity.Message"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="Com.Dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="adminHeader.jsp" %>
<%@include file="footer.jsp" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> New product</title>
        <link rel="stylesheet" href="css/addNewProduct-style.css"/>
       
    </head>
    <body>
        <% 
        ProductDao pd=new ProductDao(ConnectionProvider.getConnection());
       Message m=(Message)session.getAttribute("msg");
        if(m!=null){
       
        %>
        <h2 class="alert<%= m.getCssclass() %>" style="text-align:center;color:greenyellow" role="alert">
                                    <%= m.getContent() %>
         </h2>
                                <%
                                    session.removeAttribute("msg");
                                    }
                                 %>

<form action="productInsert" method="post">
<h3 style="color: yellow;">Product ID: <%= pd.maxId()%></h3>
<input type="hidden" name="id" value="<%= pd.maxId()%>"/>

<div class="left-div">
 <h3>Enter Name</h3>
 <input type="text" class="input-style" name="name" placeholder="Enter the product Name" required=""/>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input type="text" class="input-style" name="category" placeholder="Enter the product Category" required=""/>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input type="number" class="input-style" name="price" placeholder="Enter the product price" required=""/>
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active">
    <option>yes</option>
     <option>no</option>
</select>
<hr>
</div>

<button class="button"> <i class='far fa-arrow-alt-circle-right'></i> Save</button>
</form>
    </body>
</html>
