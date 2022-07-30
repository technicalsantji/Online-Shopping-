
<%@page import="Com.Entity.Message"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
</head>
<body>
   <div class="container-fluid">
            <div class="row align-items-center">

                <div class="col-md-4 offset-md-4"> 
                    <div class="card m-5 gradiant-colors-1 border-success rounded-lg" data-aos="fade-right" style="box-shadow:1px 4px 4px 4px #9a9c99">
                        <div class="card-body mx-auto text-center">
                            <!--form start-->
                            <form action="Login" method="post" autocomplete="off">
                                <i class="fa fa-user-plus" aria-hidden="true" style="font-size:32px;color:#ffffff"></i>
                                <h6 class="card-title cti text-white">Login here</h6>
                               
                                <% 
                              Message m=(Message)session.getAttribute("ms");
                              if(m!=null){
                                
                                %>
                                 <div class="alert <%= m.getCssclass() %>" role="alert">
                                    <%= m.getContent() %>
                                </div>
                                <%
                                    session.removeAttribute("ms");
                                    }
                                 %>
                                <div class="input-group mb-3 mt-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
                                    </div>
                                    <input type="email" name="email" class="form-control" placeholder="Enter the Email " required aria-label="Username" aria-describedby="basic-addon1">
                                </div>


                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1"><i class="fa fa-lock" aria-hidden="true"></i></span>
                                    </div>
                                    <input type="password" class="form-control" name="password" required placeholder="Enter the Password" aria-label="Username" aria-describedby="basic-addon1">
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input position-static" required type="checkbox" id="blankCheckbox" value="option1" aria-label="...">
                                    <span class="text-white" >I agree with term and condition</span>
                                </div>
                                <input href="#" class="btn btn-block gradiant-colors-2" type="submit" value="Login"/>
                                <a href="forgotPassword.jsp" class="btn btn-block btn-danger" >Forgot Password</a>
                                <p>Not a member ? <a href="signup.jsp" class="text-white" >Create New Account</a></p>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
           <script>
  AOS.init();
  
</script>
        </body>
</html>