<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>

<%
String email=session.getAttribute("email").toString();
String subject=request.getParameter("subject");
String body=request.getParameter("body");

try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement ps=con.prepareStatement("insert into message(email,subject,body) values(?,?,?)");
	ps.setString(1,email);
	ps.setString(2,subject);
	ps.setString(3,body);
	ps.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=valid");
	
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("messageUs.jsp?msg=invalid");
	}


%>