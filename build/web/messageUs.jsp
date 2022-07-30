<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<%@page errorPage="error.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%
    String msg=request.getParameter("msg");
    if("done".equals(msg)){
    %>
<h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
<%
    } if("invalid".equals(msg)){
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%
    
    }

%>

 
<form action="sendMessage.jsp" method="post">
  
    <br><br>
<input type="text" name="subject" class="input-style" placeholder="Enter the Subject"><br><br>
<textarea id="w3review" name="message" rows="4" cols="50" class="input-style" placeholder="Enter the message"></textarea>
 <button type="submit" class="button">Send</button>
</form>
<br><br><br>
</body>
</html>