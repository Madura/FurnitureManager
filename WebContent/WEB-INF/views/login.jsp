<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Insert title here</title>
		<jsp:include page="includes/header.jsp" />
	</head>
	
	<body>
	
	
<%

	session.removeAttribute("user");
	String referrer = request.getHeader("referer");
	

%>

<% 	
	if(session.getAttribute("user") != null){
		
%>
 <h3>Session is still exist. </h3>
<%	
		
	} else if( "http://localhost:8080/sdnext/login.html".equalsIgnoreCase(referrer) && session.getAttribute("user") == null ){
		
%>
 <h3>You are successfully logged out.</h3>
<%
	} 
%>

		<form class="form-horizontal" action="/sdnext/login.html" method="POST">
			<fieldset>

				<!-- Form Name -->
				<legend>User Login</legend>

				<!-- Text input-->
				<div class="form-group">
  					<label class="col-md-4 control-label" for="userName">User Name</label>  
  					<div class="col-md-4">
  						<input id="userName" name="userName" type="text" placeholder="" class="form-control input-md" required="">
    
  					</div>
				</div>

				<!-- Password input-->
				<div class="form-group">
  					<label class="col-md-4 control-label" for="password">Password</label>
  					<div class="col-md-4">
    					<input id="password" name="password" type="password" placeholder="" class="form-control input-md" required="">
    
  					</div>
				</div>

				<!-- Button -->
				<div class="form-group">
  					<label class="col-md-4 control-label" for="login_button"></label>
  					<div class="col-md-4">
    					<input id="login_button" name="login_button" type="submit" class="btn btn-primary" value="Login"/>
  					</div>
				</div>

			</fieldset>
		</form>
	</body>
</html> 