<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Mobile Number Update</title>
</head>
<body>
    <%
        String msg=request.getParameter("msg");
        if("done".equals(msg)){
        %>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%
    }if("invalid".equals(msg)){

%>
<h3 class="alert">Your Password is wrong!</h3>

<%
    }
%>
<form action="changeMobile.jsp" method="post">
 <h3>Enter Your New Mobile Number</h3>
 <input type="text" name="phone" class="input-style" placeholder="Enter the new Mobile Number"/>
 <hr>
<h3>Enter Password (For Security)</h3>
<input type="text" name="password" class="input-style" placeholder="Enter the Password"/>
<hr>
<button type="submit" class="button">Update <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>