
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/forgotpassword.css">
</head>

<body>
	<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
    <div class="container">
        <h1>Change Password</h1>
        <form action="forgotPasswordAction.jsp" method="post">
            <div class="input">
                    <input type="submit" value="Save">
                <div id="text">
                    <input id="userid" type="email" required name="email">
                    <label for="userid">User ID</label>
                    <span></span>
                </div>
                 <div class="input">
                <div id="text">
                    <input id="userid" type="number" required name="number">
                    <label for="Phone no.">Phone no.</label>
                    <span></span>
                </div>
                 <div class="box">
                  <label for="securityQuestion">select security question:</label>
                        <select name="squestion" id="District">
                            <option value="What was your first car?">What was your first car?</option>
                            <option value="What is the name of your first friend?">What is the name of your first friend?</option>
                            <option value="What is the name of your first pet?">What is the name of your first pet?</option>
                            <option value="What elementry school did you attend?">What elementry school did you attend?</option>
                            <option value="What is the name of the town where you were born">What is the name of the town where you were born</option>
                        </select>
                </div>
                <div id="text">
                    <input id="Password" type="text" required name="answer" >
                    <label for="answer">Answer</label>
                    <span></span>
                </div>
                <div id="text">
                    <input id="Password" type="password" required name="newpassword" >
                    <label for="Password">New Password</label>
                    <span></span>
                </div>
            </div>
            
    
         
        </form>
         <script src="vendor/jquery/jquery.min.js"></script>
  <script src="js/main.js"></script>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
  <script type="text/javascript">
    </div>
    <div class="input">
    	<%
    	String msg=request.getParameter("msg");
         if("done".equals(msg))
         {
       	%>
         <h1>successfull</h1>
         <%} %>
         <%
         	if("invalid".equals(msg))
         	{
         %>
         <h1>failed.</h1>
         <%} %>
                    		
    </div>
   
</body>

</html>