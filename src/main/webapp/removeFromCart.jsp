<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>


<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");

try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from card where email='"+email+"' and product_id='"+product_id+"' and address is NULL");
	response.sendRedirect("myCart.jsp?msg=removed");
}
catch(Exception e){
	System.out.println(e);
}

%>