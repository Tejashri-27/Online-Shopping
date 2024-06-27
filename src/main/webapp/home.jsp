<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body bgcolor="#2196F3">
<div style="colo0r: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>

<%
String msg=request.getParameter("msg");
if("added".equals(msg)){
	
%>
<h3 class="alert">Product added successfully!</h3>
<%} %>
<%

if("exist".equals(msg)){
	
%>

<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%} %>
<%

if("invalid".equals(msg)){
	
%>
<h3 class="alert">Something went Wrong! Try Again</h3>
<%} %>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
           
        </thead>
        <tbody>
<%
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where active='Yes'");
	while(rs.next()){
		
%>
          <tr>
            <td><%= rs.getString(1) %></td>
             <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            
            <td><i class="fa fa-inr"></i> <%= rs.getString(4) %></td>
            <td><a href="addToCartAction.jsp?id=<%= rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
            
          </tr>
<%
	}
	}
catch(Exception e){
	System.out.println(e);
}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>
<div>
<h3>Our Products</h3>
<img src="image/pexels-pixabay-161559.jpg" alt="Orange" height="300px" width="300px" >
<img src="image/pexels-pixabay-159711.jpg" height="300px" width="300px" >
<img src="image/pexels-morningtrain-18105.jpg" height="300px" width="300px" >
<img src="image/pexels-arunbabuthomas-1156684.jpg" height="300px" width="300px" >
<img src="image/pexels-david-bartus-43782-297933.jpg" height="300px" width="300px" >
<img src="image/pexels-geyonk-1152077.jpg" height="300px" width="300px" >
<img src="image/pexels-jessbaileydesign-788946.jpg" height="300px" width="300px" >
<img src="image/pexels-vishven-solanki-1441477-2861929.jpg" height="300px" width="300px" >
<img src="image/pexels-wearelivingart-7559058.jpg" height="300px" width="300px" >




</div>
</body>
</html>