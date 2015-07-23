<%@page import="com.darshanafurniture.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Darshana Furniture</title>
	<jsp:include page="includes/header.jsp" />
</head>

<body>
<%

	session.removeAttribute("user");

%>

<% 	
	if(session.getAttribute("user") != null){
		
%>
 <h3>Session is still exist. </h3>
<%	
		
	} else {
		
%>
 <h3>You are successfully logged out.</h3>
<%
	} 
%>
</body>
</html>
