<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
    <%
    String msg=request.getParameter("msg");
if("done".equals(msg)){
    %>
<h3 class="alert">Address Successfully Updated !</h3>
<%
    }if("wrong".equals(msg)){
%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%
    }
%>

<form action="ChangeAddress.jsp" method="post">
<h3>Enter Address</h3>
<input type="text" name="address" class="input-style" placeholder="Enter the Adresss" value="<%=user.getAddress() %>"/>
 <hr>
 <h3>Enter city</h3>
 <input type="text" name="city" class="input-style" placeholder="Enter the city" value="<%=user.getCity()%>"/>
<hr>
<h3>Enter State</h3>
<input type="text" name="state" class="input-style" placeholder="Enter the state" value="<%=user.getState()%>"/>
<hr>
<h3>Enter country</h3>
<input type="text" name="country" class="input-style" placeholder="Enter the country" value="<%=user.getCountry()%>"/>
<hr>
<button type="submit" class="button" >Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>