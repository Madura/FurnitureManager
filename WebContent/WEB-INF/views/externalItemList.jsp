<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.darshanafurniture.model.User"%>
<%@page import="com.darshanafurniture.constant.BrandNames"%>
<%@ page import="java.util.*" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="includes/header.jsp" />

<style>

inputFieldOff {
	display: none;
} 

inputFieldOn {
	display: block;
} 



body {
    font: normal normal normal 10px/1.5 Arial, Helvetica, sans-serif;
}
.ui-dialog-osx {
    -moz-border-radius: 0 0 8px 8px;
    -webkit-border-radius: 0 0 8px 8px;
    border-radius: 0 0 8px 8px;
    border-width: 0 8px 8px 8px;
}
#msg {
    margin-top:100px;
    text-align:center;
    font-size:2em;
    color:red;
}

</style>


<script type="text/javascript">




</script>
</head>

<body>
<%
	//HttpSession s=request.getSession();
	User user = (User) session.getAttribute("user");
	
	//List<BrandNames> brandNames = pageContext.getAttribute("brandNames");
%>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		
			<!-- include slide show -->
		<!-- 	<jsp:include page="includes/slideShow.jsp" />   -->

			<!-- include nav bar -->
		 	<jsp:include page="includes/headerMenu.jsp" />  


		</div>
			
		
			<div id="alert" class="alert alert-success alert-dismissable" style="display:none">				
			</div>


	
	
	<div class="row clearfix">
		<div class="col-md-12 column" >
		<h1><%=user.getUserName() %></h1>
		<c:if test="${!empty externalItems}">
			<table class="table">
				<thead>
					<tr>
						<th>Product ID</th>
						<th>Supplier</th>
						<th>Product Code</th>
						<th>Product Name</th>
						<th>Brand Name</th>
						<th>Quantity</th>
						<th>Product Unit price</th>
						<th>Purchased Time</th>
						<th>Actions on Row</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${externalItems}" var="product">
						<form:form method="POST" action="" >
						<tr id="${product.id}" class="${(product.quantity > 20) ? 'active' : (product.quantity > 10) ? 'success' : (product.quantity > 5) ? 'warning' : 'danger'}">
							<td><div class="inputFieldOff"><c:out value="${product.id}"/></div><input id="id" style="display:none" readonly="readonly" value="${product.id}" type="text" maxlength="8" size="2" class="form-control input-md" required=""/></td>
							<td><div class="inputFieldOff"><c:out value="${product.supplierId}"/></div>
							<select id="supplierId" name="supplierId" class="form-control" style="display:none" onchange="showSaveButton('${product.id}');">
			                    <c:forEach items="${suppliers}" var="supplier">
			                    	<option value="${supplier.supplierId}"  <c:if test="${supplier.supplierId == product.supplierId}"> selected="selected" </c:if>>${supplier.supplierName}</option>
			                    </c:forEach>
			                  </select>
							</td>
							<td><div class="inputFieldOff"><c:out value="${product.productCode}"/></div><input id="productCode" style="display:none" value="${product.productCode}" type="text" maxlength="8" size="8" class="form-control input-md" required="" onkeyup= "showSaveButton('${product.id}');"  data-validation="alphanumeric"/></td>
							<td><div class="inputFieldOff"><c:out value="${product.productName}"/></div><input id="productName" style="display:none" value="${product.productName}" type="text" class="form-control input-md" size="8" required="" onkeyup= "showSaveButton('${product.id}');"  data-validation="alphanumeric"/></td>
							<td><div class="inputFieldOff"><c:out value="${product.brandName}"/></div>											                  
								<select id="brandName" name="brandName" style="display:none" class="form-control" required="required" onchange="showSaveButton('${product.id}');">
			                  		<c:forEach items="<%=BrandNames.values() %>" var="brand">	
			                    		<option value="${brand}" <c:if test="${brand == product.brandName}"> selected="selected" </c:if> >${brand}</option>
			                    	</c:forEach>
			                  	</select>
							</td>
							<td><div class="inputFieldOff"><c:out value="${product.quantity}"/></div><input id="quantity" style="display:none" value="${product.quantity}" type="text" maxlength="4" size="1" class="form-control input-md" required="" onkeyup= "showSaveButton('${product.id}');"/></td>
							<td><div class="inputFieldOff"><c:out value="${product.unitPrice}"/></div><input id="unitPrice" style="display:none" value="${product.unitPrice}" type="text" maxlength="8" size="6" class="form-control input-md" required="" onkeyup= "showSaveButton('${product.id}');" data-validation="number" data-validation-allowing="float"/></td>
							<td><div class="inputFieldOff"><c:out value="${product.purchasedTime}"/></div><input id="purchasedTime" style="display:none" value="${product.purchasedTime}" type="text" maxlength="8" size="6" class="form-control input-md" required="" onkeyup= "showSaveButton('${product.id}');" /></td>
							<td align="center"><button id="btn_edit_${product.id}" type="button" class="btn btn-primary" onclick="makeInputField(${product.id});" value="" > Edit </button> <button id="btn_save_${product.id}" type="button" class="btn btn-success" style="display:none;" onclick="editProduct(${product.id});closeInputField('${product.id}');" value="" > Save </button> |  <button id="btn_delete_${product.id}" type="button" class="btn btn-danger" onclick="deleteProduct(${product.id});" value="" > Delete </button></td>
						</tr>
						</form:form>
					</c:forEach>
				</tbody>
			</table>
			</c:if>
		</div>
	</div>

</div>

	<div class="row clearfix">
		<div class="col-md-4 column">
		
			<a id="modal-246328" href="#modal-container-246328" role="button" class="btn" data-toggle="modal">Add External Products</a>
			
			<div class="modal fade" id="modal-container-246328" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
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
		
	</div>

<script type="text/javascript">

function makeInputField(rowId){
	//alert("clicked"+rowId);
	
	$('#'+rowId+' input').css('display', 'inline-block');
	$('#'+rowId+' div').css('display', 'none');
	
	$('#'+rowId).find('select').css('display', 'inline-block');
}

function closeInputField(rowId){
	//alert("clicked"+rowId);
	
	$('#'+rowId+' input').css('display', 'none');
	$('#'+rowId+' div').css('display', 'inline-block');
	
	$('#'+rowId).find('select').css('display', 'none');

}
	
	/*
	 * This function iterate TR and find TD by Id's and count lablig price
	 */
	function showSaveButton(id) {
	    $("#"+id).each(function(){
			$(this).find('#btn_edit_'+id).hide();
			$(this).find('#btn_save_'+id).show();
	    });
	}
	
	function deleteProduct(id) {
		
		$('<div></div>').appendTo('body')
	    .html('<div><h6>Do you want to permanenly Delete this product from the system ?</h6></div>')
	    .dialog({
	    modal: true,
	    title: 'Delete Warning message for Product ID : ' + id,
	    zIndex: 10000,
	    autoOpen: true,
	    width: 'auto',
	    resizable: false,
	    buttons: {
	        Yes: function () {
	        	 $.ajax({url: "/sdnext/deleteExternalItem.html?id="+id,	        	
	     	        success: function(result){
	     	    		$('#alert').css('display', 'inline-block');
	     	            $("#alert").html("Product Id " + id + "  successfully deleted ");
	     	            $('#'+id).hide();
	     	    	}
	     	    });
	            $(this).dialog("close");
	        },
	        No: function () {
	            //doFunctionForNo();
	            $(this).dialog("close");
	        }
	    },
	    close: function (event, ui) {
	        $(this).remove();
	    }
	});
  
	}
	
	function editProduct(id) {

	var url = "";
	    $("#"+id).each(function(){
	    	var supplierId = $(this).find('#supplierId').val();
			var productCode = $(this).find('#productCode').val();
			var productName = $(this).find('#productName').val();
			var brandName = $(this).find('#brandName').val();
			var quantity = $(this).find('#quantity').val();
			var unitPrice = $(this).find('#unitPrice').val();
			var purchasedTime = $(this).find('#purchasedTime').val();
			
			url = "id="+id+"&supplierId="+supplierId+"&productCode="+productCode+"&productName="+productName+"&brandName="+brandName+"&quantity="+quantity+"&unitPrice="+unitPrice+"&purchasedTime="+purchasedTime;
			
			$(this).find('#btn_edit_'+id).show();
			$(this).find('#btn_save_'+id).hide();
	    });
	    
	    
	    $.ajax({
	    	
	    	url: "/sdnext/editExternalItem.html?"+url,
	        	
	        success: function(result) {
	        	clickProductList();
	    	}
	    });
	}
	
function clickProductList() {
	document.getElementById('displayExternaItems').click();
}
	
</script>

</body>
</html>











