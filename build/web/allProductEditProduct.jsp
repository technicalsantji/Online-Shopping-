<%@page import="Com.Entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@page import="Com.Dao.ProductDao"%>
<%@page import="Com.Entity.Message"%>
<%@include file="adminHeader.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
<% 
Message m=(Message)session.getAttribute("msg");
if(m!=null){
%>
<h2 style="text-align:center; color:greenyellow"><%= m.getContent()%></h2>
<% 
    session.removeAttribute("msg");
    }
%>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th>Status</th>
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
          </tr>
        </thead>
        <tbody>
            <%
            ProductDao d=new ProductDao(ConnectionProvider.getConnection());
           List<Product>li= d.allProductList();
           for (Product a:li) {
                   
                   
              
            %>
          <tr>
              <td><%=a.getId()%></td>
            <td><%=a.getPname()%></td>
            <td><%=a.getPcategory()%></td>
            <td><i class="fa fa-inr"></i><%=a.getPprice()%></td>
            <td><%=a.getPacitive()%></td>
            <td><a href="editProduct.jsp?id=<%=a.getId()%>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
          <%
              }
          %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>