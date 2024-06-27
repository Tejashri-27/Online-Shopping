<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>


<%
String email=session.getAttribute("email").toString();
String status="processing";
try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement ps=con.prepareStatement("update card set status=? where email=? and status='bill'");
	ps.setString(1,status);
	ps.setString(2,email);
	ps.executeUpdate();
	response.sendRedirect("home.jsp");
	
	
}
catch(Exception e){System.out.println(e);}


%>