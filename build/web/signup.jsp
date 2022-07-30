<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/signup-style.css">
        <title>Signup</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="mycard">
                <div class="row align-items-center">
                    <div class='signup col-md-6'data-aos="flip-left" >
                        <div class="mylfcard">
                            <form id="reg" action="SignUp" method="post" class="myform text-center">
                                <header>Create new account</header>  
                                <div class="form-group">
                                  <i class="fa fa-user-o" aria-hidden="true"></i>
                                    <input class="myinput" type="text" placeholder="Name" name="name" id="name" required>
                                </div>

                                <div class="form-group">
                                    <i class="fa fa-envelope-o" aria-hidden="true"></i>
                                    <input class="myinput" type="email" placeholder="Email" name="email" id="email" required>
                                </div>

                                <div class="form-group">
                                    <i class="fa fa-phone-square" aria-hidden="true"></i>
                                    <input class="myinput" type="text" placeholder="Mobile Number" name="phone" id="phone" required>
                                </div>

                                <div class="form-group">
                                  
                                    <select name="sequrity" class="myinput" required>
                                        <option  class="myinput" disabled selected>---Select Question---</option>
                                        <option  class="myinput"> What was your first car?</option>
                                        <option  class="myinput" >What is the name of your first pet?</option>
                                        <option  class="myinput">What elementary school did you attend?</option>
                                        <option  class="myinput">What is the name of the town where you were born?</option>

                                    </select>
                                </div>
                                <div class="form-group">
                                    <i class="fa fa-question" aria-hidden="true"></i>
                                    <input class="myinput" type="text" placeholder="Answer" name="answer" id="answer" required>
                                </div>
                                <div class="form-group">
                                   <i class="fa fa-lock" aria-hidden="true"></i>
                                    <input class="myinput" type="password" placeholder="Password" name="password" id="password" required>
                                </div>

                                <div class="form-group">
                                    
                                    <label class="form-check-label" for="gridCheck1">
                                        <input name="check" class="form-check-input" type="checkbox" id="gridCheck1" >  <small>I read and agree to Term & Condition</small><div class="invalid-feedback">You must check the box.</div>
                                    </label>
                                   
                                </div>
                               
                                <input id="btn-sum" type="submit" class="butt"  value="Create Account">
                            </form>
                        </div>
                    </div>
                    <div class='col-md-6'>
                        <div class="myrtcard pl-md-4">

                            <header>Online Shopping</header>
                            <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
                            <a href="login.jsp"class="butt_out" type="submit">Login</a>
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
   
         <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
        $(document).ready(function () {
            console.log("loaded")
            $('#reg').on('submit', function (event) {
                event.preventDefault();

                let form = new FormData(this);
                
                $.ajax({
                    url: "SignUp",
                    type: 'post',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        
                        if(data.trim()==='done')
                        {
                        swal("Register Successfully")
                                .then((value) => {
                                    window.location="login.jsp";
                                });
                            }else{
                                swal(data);
                            }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                       
                       
                       swal("Something went Wrong.. Please Try again");
                    },
                    processData: false,
                    contentType: false
                });

            });
        });
    </script>
        
        <script>
  AOS.init();
  
</script>

    </body>
</html>