<%@page import="Com.Entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="Com.Dao.ProductDao"%>
<%@include file="adminHeader.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
    
    <%
       String id=request.getParameter("id");
       Integer uid=Integer.parseInt(id);
    ProductDao d=new ProductDao(ConnectionProvider.getConnection());
   Product p=d.allProductById(uid);
    %>
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
 
 <form action="EditProduct" method="post">
     <input type="hidden" class="input-style" name="id" value="<%=uid %>" />
<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" name="name" value="<%=p.getPname()  %>" />
        
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
  <input class="input-style" name="category" value="<%=p.getPcategory() %>" />
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
<input class="input-style" name="price" value="<%=p.getPprice() %>" />
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
 <input class="input-style" name="active" value="<%=p.getPacitive() %>" />
 <hr>
</div>
 <button type="submit" class="input-style"> <i class='far fa-arrow-alt-circle-right'></i>Save</button>

</form>

</body>
<br><br><br>
</body>
</html>