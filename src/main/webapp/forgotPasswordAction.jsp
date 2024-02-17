<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String mobilrNumber=request.getParameter("number");
String securityQuestion=request.getParameter("squestion");
String answer=request.getParameter("answer");
String newPassword=request.getParameter("newpassword");

int check=0;
try {
	
	Connection con= ConnectionProvider.getConnection();
	Statement pst= con.createStatement();
	
	
	ResultSet bc = pst.executeQuery("select*from users2 where email='"+email+"'and mobilrNumber='"+mobilrNumber+"' and securityQuestion='"+securityQuestion+"' and answer='"+answer+"'");
	while(bc.next()) {
		check=1;
		pst.executeUpdate("update users2 set password='"+newPassword+"'where email='"+email+"'");
		response.sendRedirect("forgotPassword.jsp?msg=done");
		
	}
	if(check==0)
	{
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
		
	}

}
catch(Exception e){
	e.printStackTrace();
}

%>