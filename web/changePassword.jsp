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
    if("nomatch".equals(msg)){
    %>
<h3 class="alert">New password and Confirm password does not match!</h3>
<% 
    }
if("wrong".equals(msg)){
%>
<h3 class="alert">Your old Password is wrong!</h3>
<% 
    }if("success".equals(msg)){
%>
<h3 class="alert">Password change successfully!</h3>
<% 
    }
if("error".equals(msg)){
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<% 
    }
%>
<form action="ChangePasswordByUser.jsp" method="post">
<h3>Enter Old Password</h3>
<input type="text" name="oldpassword" placeholder="Enter the Old Password" class="input-style"/>
  <hr>
 <h3>Enter New Password</h3>
 <input type="password" name="npassword" placeholder="Enter the new Password" class="input-style"/>
 <hr>
<h3>Enter Confirm Password</h3>
<input type="text" name="cpassword" placeholder="Enter the Confirm Password" class="input-style"/>
<hr>
<button type="submit" class="input-style">Update <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>