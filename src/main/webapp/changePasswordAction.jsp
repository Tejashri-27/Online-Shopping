<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>

<%

String email=session.getAttribute("email").toString();
String oldPassword=request.getParameter("oldPassword");
String newPassword=request.getParameter("newPassword");
String confirmPassword=request.getParameter("confirmPassword");

if(!confirmPassword.equals(newPassword)){
	response.sendRedirect("changePassword.jsp?msg=notmatch");
}
else{
	int check=0;
	try{
		Connection con=ConnectionProvider.getcon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from user where email='"+email +"'");
		while(rs.next()){
			check=1;
			st.executeUpdate("update user set password='"+newPassword+"' where email='"+email+"'"); 
			response.sendRedirect("changePassword.jsp?msg=done");
		}
		if(check==0){
			response.sendRedirect("changePassword.jsp?msg=wrong");
		}
	}
	catch(Exception e){
		System.out.println(e);
		
	}
}

%>