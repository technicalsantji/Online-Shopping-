<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<title>Change Details</title>
<style>
hr
{width:70%;}</style>
</head>
<body>
    <%
      
    
    %>
    <h3>Name:<%=user.getUname()%> </h3>

<hr>
 <h3>Email:<%=user.getUemail() %> </h3>

 <hr>
 <h3>Mobile Number:<%=user.getUphone() %> </h3>
 
 <hr>
<h3>Security Question:<%= user.getUsecurity() %> </h3>
<hr>
      <br>
      <br>
      <br>

</body>
</html>