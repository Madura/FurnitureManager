<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.darshanafurniture.model.User"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="includes/header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	//HttpSession s=request.getSession();
	User user = (User) session.getAttribute("user");
%>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		
			<!-- include slide show -->
		<!-- 	<jsp:include page="includes/slideShow.jsp" />   -->

			<!-- include nav bar -->
		 	<jsp:include page="includes/headerMenu.jsp" />  


		</div>
		<h1><%=user.getUserName() %></h1>

		<c:if test="${!empty listOfUsers}">
			<table class="table">
				<thead>
					<tr>
						<th>User ID</th>
						<th>User Name</th>
						<th>Password</th>
						<th>User Type</th>
						<th>User Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listOfUsers}" var="user">

						<tr>
							<td><c:out value="${user.userId}"/></td>
							<td><c:out value="${user.userName}"/></td>
							<td><c:out value="${user.password}"/></td>
							<td><c:out value="${user.userType}"/></td>
							<td><c:out value="${user.userStatus}"/></td>
							<td align="center"><a href="editBuyingAndSellingProduct.html?id=${user.userId}" class="icon-pencil">Edit</a> | <a href="deleteBuyingAndSellingProduct.html?id=${user.userId}" class="close">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</c:if>
		</div>
		
	</div>
		

</body>
</html>