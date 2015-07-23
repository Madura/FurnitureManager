<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.darshanafurniture.model.User"%>
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
		<c:if test="${!empty products}">
			<table class="table">
				<thead>
					<tr>
						<th>Product ID</th>
						<th>Product Code</th>
						<th>Product Name</th>
						<th>Brand Name</th>
						<th>Quantity</th>
						<th>Product Buying Price</th>
						<th>Purchasing Time</th>
						<th>Profit percentage</th>
						<th>Product Labling Price</th>
						<th>Min Stock</th>
						<th>Max Stock</th>
						<th>Actions on Row</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${products}" var="product">
						<form:form method="POST" action="" >
						<tr id="${product.productId}" class="${(product.quantity > 20) ? 'active' : (product.quantity > 10) ? 'success' : (product.quantity > 5) ? 'warning' : 'danger'}">
							<td><div class="inputFieldOff"><c:out value="${product.productId}"/></div><input id="productId" style="display:none" readonly="readonly" value="${product.productId}" type="text" maxlength="8" size="2" class="form-control input-md" required=""/></td>
							<td><div class="inputFieldOff"><c:out value="${product.productCode}"/></div><input id="productCode" style="display:none" value="${product.productCode}" type="text" maxlength="8" size="8" class="form-control input-md" required="" onkeyup= "countLabldingPrice('${product.productId}');"  data-validation="alphanumeric"/></td>
							<td><div class="inputFieldOff"><c:out value="${product.productName}"/></div><input id="productName" style="display:none" value="${product.productName}" type="text" class="form-control input-md" size="8" required="" onkeyup= "countLabldingPrice('${product.productId}');"  data-validation="alphanumeric"/></td>
							<td><div class="inputFieldOff"><c:out value="${product.brandName}"/></div><input id="brandName" style="display:none" value="${product.brandName}" type="text" class="form-control input-md" size="8" required="" onkeyup= "countLabldingPrice('${product.productId}');" /></td>
							<td><div class="inputFieldOff"><c:out value="${product.quantity}"/></div><input id="quantity" style="display:none" value="${product.quantity}" type="text" maxlength="4" size="1" class="form-control input-md" required="" onkeyup= "countLabldingPrice('${product.productId}');"/></td>
							<td><div class="inputFieldOff"><c:out value="${product.buyingPrice}"/></div><input id="buyingPrice" style="display:none" value="${product.buyingPrice}" type="text" maxlength="8" size="6" class="form-control input-md" required="" onkeyup= "countLabldingPrice('${product.productId}');" data-validation="number" data-validation-allowing="float"/></td>
							<td><div class="inputFieldOff"><c:out value="${product.purchasingTime}"/></div><input id="purchasingTime" style="display:none" value="${product.purchasingTime}" type="text" maxlength="8" size="6" class="form-control input-md" required="" onkeyup= "countLabldingPrice('${product.productId}');" /></td>
							<td><div class="inputFieldOff"><c:out value="${product.profitPercentage}"/></div><input id="profitPercentage" style="display:none" value="${product.profitPercentage}" type="text" maxlength="4" size="1" class="form-control input-md" required="" onkeyup="countLabldingPrice('${product.productId}');" data-validation="number" data-validation-allowing="float"/></td>
							<td><div class="inputFieldOff"><c:out value="${product.labelingPrice}"/></div><input id="labelingPrice" readonly="readonly" style="display:none" value="${product.labelingPrice}" type="text" size="8" class="form-control input-md" data-validation="number" data-validation-allowing="float" /></td>
							<td><div class="inputFieldOff"><c:out value="${product.minStock}"/></div><input id="minStock" style="display:none" value="${product.minStock}" type="text" maxlength="8" size="6" class="form-control input-md" required="" onkeyup= "countLabldingPrice('${product.productId}');" data-validation="number" /></td>
							<td><div class="inputFieldOff"><c:out value="${product.maxStock}"/></div><input id="maxStock" style="display:none" value="${product.maxStock}" type="text" maxlength="8" size="6" class="form-control input-md" required="" onkeyup= "countLabldingPrice('${product.productId}');" data-validation="number" /></td>
							
							<td align="center"><button id="btn_edit_${product.productId}" type="button" class="btn btn-primary" onclick="makeInputField(${product.productId});" value="" > Edit </button> <button id="btn_save_${product.productId}" type="button" class="btn btn-success" style="display:none;" onclick="editProduct(${product.productId});closeInputField('${product.productId}');" value="" > Save </button> |  <button id="btn_delete_${product.productId}" type="button" class="btn btn-danger" onclick="deleteProduct(${product.productId});" value="" > Delete </button></td>
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
	}
	
	function closeInputField(rowId){
		//alert("clicked"+rowId);
		
		$('#'+rowId+' input').css('display', 'none');
		$('#'+rowId+' div').css('display', 'inline-block');
	}
	
	/*
	 * This function iterate TR and find TD by Id's and count lablig price
	 */
	function countLabldingPrice(productId) {
	    $("#"+productId).each(function(){
			var buyingPrice = $(this).find('#buyingPrice').val();
			var profitPercentage = $(this).find('#profitPercentage').val();
			var lablingPrice = buyingPrice * (profitPercentage*1 + 100.00) / 100;
			$(this).find('#labelingPrice').val(lablingPrice);
			$(this).find('#btn_edit_'+productId).hide();
			$(this).find('#btn_save_'+productId).show();
	    });
	}
	
	function deleteProduct(productId) {
		
		$('<div></div>').appendTo('body')
	    .html('<div><h6>Do you want to permanenly Delete this product from the system ?</h6></div>')
	    .dialog({
	    modal: true,
	    title: 'Delete Warning message for Product ID : ' + productId,
	    zIndex: 10000,
	    autoOpen: true,
	    width: 'auto',
	    resizable: false,
	    buttons: {
	        Yes: function () {
	        	 $.ajax({url: "/sdnext/deleteBuyingAndSellingProduct.html?productId="+productId,	        	
	     	        success: function(result){
	     	    		$('#alert').css('display', 'inline-block');
	     	            $("#alert").html("Product Id " + productId + "  successfully deleted ");
	     	            $('#'+productId).hide();
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
	
	function editProduct(productId) {

	var url = "";
	    $("#"+productId).each(function(){
			var productCode = $(this).find('#productCode').val();
			var productName = $(this).find('#productName').val();
			var brandName = $(this).find('#brandName').val();
			var quantity = $(this).find('#quantity').val();
			var buyingPrice = $(this).find('#buyingPrice').val();
			var profitPercentage = $(this).find('#profitPercentage').val();
			var labelingPrice = $(this).find('#labelingPrice').val();
			
			//var labelingPrice = buyingPrice * (profitPercentage*1 + 100.00) / 100;
			
			url = "productId="+productId+"&productCode="+productCode+"&productName="+productName+"&brandName="+brandName+"&quantity="+quantity+"&buyingPrice="+buyingPrice+"&profitPercentage="+profitPercentage+"&labelingPrice="+labelingPrice;
			//$(this).find('#labelingPrice').val(lablingPrice);
			
			$(this).find('#btn_edit_'+productId).show();
			$(this).find('#btn_save_'+productId).hide();
	    });
	    
	    
	    $.ajax({
	    	
	    	url: "/sdnext/editBuyingAndSellingProduct.html?"+url,
	        	
	        success: function(result) {
	        	clickProductList();
	    	}
	    });
	}
	
function clickProductList() {
	document.getElementById('displayBuyingAndSellingProducts').click();
}
	
</script>

</body>
</html>











