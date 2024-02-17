
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>


        <!--css-->
        <link href="css/signup.css" rel="stylesheet">
       

    </head>
    <body>

       
      <div class="container">
        <h1>Signup</h1> 
 <form id="reg-form" action="RegisterServlet" method="post">
            <div class="input">
                <div id="text">
                    <input id="firstname" type="text" required name="name">
                    <label for="firstname">Name</label>
                    <span></span>
                </div>
                


                <!-- <div id="text">
                    <input type="tel" >
                    <label for="Phone">Phone</label>
                    <span></span>
                </div>  -->

                <div id="text">
                    <input type="Email-ID" required name="email">
                    <label for="Email-ID">Email-ID</label>
                    <span></span>
                </div>
                 <div id="text">
                    <input type="number" required name="mobilrNumber">
                    <label for="Phone no.">Phone no.</label>
                    <span></span>
                </div>

                <div id="text">
                    <input id="Password" type="password" required name="password">
                    <label for="Password">Password</label>
                    <span></span>
                </div>
                <div class="box">
                  <label for="securityQuestion">select security question:</label>
                        <select name="securityQuestion" id="District">
                            <option value="What was your first car?">What was your first car?</option>
                            <option value="What is the name of your first friend?">What is the name of your first friend?</option>
                            <option value="What is the name of your first pet?">What is the name of your first pet?</option>
                            <option value="What elementry school did you attend?">What elementry school did you attend?</option>
                            <option value="What is the name of the town where you were born">What is the name of the town where you were born</option>
                        </select>
                </div>
                <div id="text">
                    <input id="confirmPassword" type="answer" required name="answer">
                    <label for="Answer">Your answer</label>
                    <span></span>
                </div>
              
                <div>
                    <input type="submit" value="Signup">

                </div>
                <div class="login_link">
                    Already have an account? <a href="./login_page.jsp">Login</a>
                </div>

            </div>
        </form>

                        </div>


                    </div>




                </div>
            </div>

        </main>

</body>
        <!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded........")

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();



                    let form = new FormData(this);

                    $("#sumbimt-btn").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)

                            $("#sumbimt-btn").show();
                            $("#loader").hide();

                            if (data.trim() === 'done')
                            {

                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "login_page.jsp"
                                        });
                            } else
                            {

                                swal(data);
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");

                        },
                        processData: false,
                        contentType: false

                    });



                });


            });



        </script>


  
</html>
