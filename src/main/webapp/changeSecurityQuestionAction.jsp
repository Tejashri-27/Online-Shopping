<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>

<%
String email=session.getAttribute("email").toString();
String securityQuetion=request.getParameter("securityQuetion");
String Password=request.getParameter("Password");
String newAnswer=request.getParameter("newAnswer");

int check=0;
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from user where email='"+email+"' and password='"+Password+"'");
	while(rs.next()){
		check=1;
		st.executeUpdate("update user set securityQuetion='"+securityQuetion+"',answer='"+newAnswer+"' where email='"+email+"'");
		response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
	
	}
	if(check==0){
		response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
	}
}
catch(Exception e){
	System.out.println(e);
}

%>