<%@page import="com.darshanafurniture.model.User"%>
<%@page import="com.darshanafurniture.constant.BrandNames"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Darshana Furniture</title>
	<jsp:include page="includes/header.jsp" />
		<script type="text/javascript">
	

	  function search() {
		var productName = document.getElementById("w-input-search").value;
		alert(productName);
		
	    $.ajax({
		  	  url: "${pageContext.request.contextPath}/searchProduct.html",
		  	  type: "get", //send it through get method
		  	  async: false,
		  	  data:{"productName" : productName },
		  	  success: function(response) {
		  		  alert("res");
		  		//$('#bill').empty();
	            for (var x = 0; x < response.length; x++) {
	            	content = "<div>";
	                content += response[x].productCode;
	                content += "</div><div>";
	                content += response[x].productName;
	                content += "</div>";
	                $(content).appendTo("#bill");
	               // updateListing(data[x]);
	            };
		  	  },
		  	  error: function(xhr) {
		  	  }
		  	});	
	  }
	    
/* 	$(document).ready(function() {

		$('#w-input-search').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/searchProduct.html',
			paramName: "productName", // ?tagName='user input'
			delimiter: ",",
		    transformResult: function(response) {
		    	
		        return {
		        	
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	
		                return { value: item.tagName, data: item.id };
		            })
		            
		        };
		        
		    }
		    
		});
		
		
	}); */
	</script>
</head>

<body>
<%
	//String userStr = (String) pageContext.getRequest().getParameter("user");
	User user = (User)request.getAttribute("user");
	
	String userType = user.getUserType();
	List<BrandNames> brands = new ArrayList<BrandNames>(Arrays.asList(BrandNames.values()));

	pageContext.setAttribute("brandNames", brands);
	//application.setAttribute("brandList", arg1)
	//User user = new User();
	//HttpSession s=request.getSession();
	
	if(user != null && !user.getUserName().isEmpty()) {	
/* 		s.setAttribute("userId", user.getUserId());
		s.setAttribute("userName", user.getUserName());
		s.setAttribute("userRole", user.getUserType());
		s.setAttribute("user", user); */
		session.setAttribute("user", user);
%>

 
 
<div class="container">



	<div class="row clearfix">
		<div class="col-md-12 column">


			<!-- include nav bar -->
			<jsp:include page="includes/navBar.jsp" />
			

			



		<div class="col-md-3 column">
			<!-- include nav bar -->
			<jsp:include page="includes/leftNavBar.jsp" />
		</div>
	
			
			
		<div class="col-md-9 column">
		
					<div class="alert alert-success alert-dismissable">
				 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">�</button>
				<h4>
					Alert!
				</h4> <strong>Warning!</strong> Best check yo self, you're not looking too good. <a href="#" class="alert-link">alert link</a>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		
		<h3><%=user.getUserName() %> (<%=user.getUserType() %> ) |  <a href="<c:url value="/logout.html" />" > Logout</a></h3>

			<!-- Sell Extranal Product Modal Link -->
			<a id="modal-642839" href="#modal-container-642839" role="button" class="btn btn-danger" data-toggle="modal">Sell Product</a>
			
			<!-- Add external products link -->
			<a id="modal-246328" href="#modal-container-246328" role="button" class="btn btn-success" data-toggle="modal">Add External Products</a>
			
			<!-- Add user Modal link -->
			<a id="modal-750511" href="#modal-container-750511" role="button" class="btn btn-warning" data-toggle="modal">Add User</a>

			<!-- Add External Item Modal Link -->
			<a id="modal-750512" href="#modal-container-750512" role="button" class="btn btn-warning" data-toggle="modal">Add External Items</a>
			
			<!-- Add Supplier Modal Link -->
			<a id="modal-750513" href="#modal-container-750513" role="button" class="btn btn-success" data-toggle="modal">Add Supplier Items</a>
		</div>	
			
			<div class="col-md-4 column">
			<!-- Sell Extranal Product Modal -->
			<div class="modal fade" id="modal-container-642839" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
							<h4 class="modal-title" id="myModalLabel">
								Sell Product Form
							</h4>
						</div>
						<div class="modal-body">

						<!-- include sell product form -->
						<jsp:include page="includes/sellExtranalProductForm.jsp" />



						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> <button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
		<div class="col-md-4 column">

			
			<!-- Add external products -->
			<div class="modal fade" id="modal-container-246328" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
							<h4 class="modal-title" id="myModalLabel">
								Add Products
							</h4>
						</div>
						<div class="modal-body">
						
						<!-- include buyExtranalProduct form -->
						<jsp:include page="includes/buyExtranalProductForm.jsp" />


						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> <button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
		<div>
			
		
		<div class="col-md-4 column">
			
			<!-- Add user Modal -->
			<div class="modal fade" id="modal-container-750511" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
							<h4 class="modal-title" id="myModalLabel">
								Modal title
							</h4>
						</div>
						<div class="modal-body">
						
						
						<!-- include sell product form -->
						<jsp:include page="includes/addUser.jsp" />
						
						
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> <button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
					
				</div>
				
			</div>
			</div>
			
		<div class="col-md-4 column">
			
			<!-- Add External Item Modal -->
			<div class="modal fade" id="modal-container-750512" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
							<h4 class="modal-title" id="myModalLabel">
								Modal title
							</h4>
						</div>
						<div class="modal-body">
						
						
						<!-- include sell product form -->
						<jsp:include page="includes/addExtranalItemPopup.jsp" />
						
						
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> <button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
			<div class="col-md-4 column">
			
			<!-- Add Supplier Modal -->
			<div class="modal fade" id="modal-container-750513" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
							<h4 class="modal-title" id="myModalLabel">
								Add Supplier
							</h4>
						</div>
						<div class="modal-body">
						
						
						<!-- include sell product form -->
						<jsp:include page="includes/addSupplier.jsp" />
						
						
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> <button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
			<div>
				<h3>Search</h3>
		
				<input type="text"  id="w-input-search" value="">
				<span>
					<button id="w-button-search" type="button" onclick="search();">Search</button>
				</span>
			</div>
			
			<br>
			<% if("Admin".equalsIgnoreCase(user.getUserType())) {
				%>
				<h2>Admin</h2>
				<%
			} else if("Manager".equalsIgnoreCase(user.getUserType())) {
				%>
				<h2>Manager</h2>
				<% 
			} else {
				%>
				<h2>User</h2>
				<%
			}
			
			
			%>
			
			<div id="bill">
				
			</div>

		
		</div>
			
		</div>
	</div>
</div>
 
<% 	
	} else {
		
%>
 <h3>This user session is expired. Please log in again..</h3>
 <a href="<c:url value="/index.html" />" > Login</a></h1>
<%
	} 
%>
</body>
</html>
