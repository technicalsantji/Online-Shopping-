<%@include file="changeDetailsHeader.jsp" %>
<%@include  file="footer.jsp" %>

<html>
    <head>
        <link rel="stylesheet" href="css/changeDetails.css">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <title>Change Security Question</title>
    </head>
    <body>
        <%        String msg = request.getParameter("msg");
            if ("done".equals(msg)) {
        %>
        <h3 class="alert">Your security Question successfully changed !</h3>
        <%}
            if ("invalid".equals(msg)) {
        %>
        <h3 class="alert">Your Password is wrong!</h3>
        <%
            }
                 if ("exe".equals(msg)) {
        
        %>
        
        <h3 class="alert">only exee</h3>
        <%
            }
        %>
        <form action="securityChange.jsp" method="post">
        <h3>Select Your New Securtiy Question</h3>
        <select name="sequrity" class="input-style" required>
            <option  class="myinput" disabled selected>---Select Question---</option>
            <option  class="myinput"> What was your first car?</option>
            <option  class="myinput" >What is the name of your first pet?</option>
            <option  class="myinput">What elementary school did you attend?</option>
            <option  class="myinput">What is the name of the town where you were born?</option>

        </select>
        <hr>
        <h3>Enter Your New Answer</h3>
        <input type="text" name="answer" class="input-style" placeholder="Enter the New Question"/>
        <hr>
        <h3>Enter Password (For Security)</h3>
        <input type="password" name="password" class="input-style" placeholder="Enter your the password" />
        <hr>
        <button type="submit" class="button" >Update<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
    </body>
    <br><br><br>
</html>