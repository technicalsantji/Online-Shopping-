<%@include file="adminHeader.jsp" %>
<%@include file="footer.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Com.Helper.ConnectionProvider"%>
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
<div style="color: white; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
           
            <th scope="col">Mobile No.</th>
             <th scope="col">Subject</th>
              <th scope="col">Message Box</th>
            
            
          </tr>
        </thead>
        <tbody>
            
            
            <%
            try {
                    Connection con=ConnectionProvider.getConnection();
                    PreparedStatement ps=con.prepareStatement("select * from message");
                    ResultSet rs=ps.executeQuery();
                    while (rs.next()) {    
                    
              %>              
                       
       
          <tr>
              <td><%= rs.getString(1)   %></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
          </tr>
          
             <% }  } catch (Exception e) {
                }

            %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>