<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.darshanafurniture.model.User"%>
<%@page import="com.darshanafurniture.constant.BrandNames"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:useBean id="enumBrandNames" class="com.darshanafurniture.bean.BrandNameBean" />

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
		<c:if test="${!empty supplierList}">
			<table class="table">
				<thead>
					<tr>
						<th>Supplier ID</th>
						<th>Supplier Name</th>
						<th>Brand Name</th>
						<th>Contact Number 1</th>
						<th>Contact Number 2</th>
						<th>Actions on Row</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${supplierList}" var="supplier">
						<form:form method="POST" action="" >
						<tr id="${supplier.supplierId}" class="active">
							<td><div class="inputFieldOff"><c:out value="${supplier.supplierId}"/></div><input id="supplierId" style="display:none" readonly="readonly" value="${supplier.supplierId}" type="text" maxlength="8" size="2" class="form-control input-md" required=""/></td>
							<td><div class="inputFieldOff"><c:out value="${supplier.supplierName}"/></div><input id="supplierName" style="display:none" value="${supplier.supplierName}" type="text" maxlength="4" size="1" class="form-control input-md" required="" onkeyup="showSaveButton('${supplier.supplierId}');" /></td>
							<td><div class="inputFieldOff"><c:out value="${supplier.brandName}"/></div>
				                  <select id="brandName" name="brandName" style="display:none" class="form-control" required="required" onchange="showSaveButton('${supplier.supplierId}');">
				                    <c:forEach items="<%=BrandNames.values() %>" var="brand">	
				                    	<option value="${brand}" <c:if test="${brand == supplier.brandName}"> selected="selected" </c:if> >${brand}</option>
				                    </c:forEach>
				                  </select>
				            </td>
							<td><div class="inputFieldOff"><c:out value="${supplier.contactNumber1}"/></div><input id="contactNumber1" style="display:none" value="${supplier.contactNumber1}" type="text" maxlength="10" size="10" class="form-control input-md" required="" onkeyup="showSaveButton('${supplier.supplierId}');" data-validation="number" /></td>
							<td><div class="inputFieldOff"><c:out value="${supplier.contactNumber2}"/></div><input id="contactNumber2" style="display:none" value="${supplier.contactNumber2}" type="text" maxlength="10" size="10" class="form-control input-md" onkeyup= "showSaveButton('${supplier.supplierId}');"  data-validation="number"/></td>
		
							<td align="center"><button id="btn_edit_${supplier.supplierId}" type="button" class="btn btn-primary" onclick="makeInputField(${supplier.supplierId});" value="" > Edit </button> <button id="btn_save_${supplier.supplierId}" type="button" class="btn btn-success" style="display:none;" onclick="editSupplier(${supplier.supplierId});closeInputField('${supplier.supplierId}');" value="" > Save </button> |  <button id="btn_delete_${supplier.supplierId}" type="button" class="btn btn-danger" onclick="deleteSupplier(${supplier.supplierId});" value="" > Delete </button></td>
						</tr>
						</form:form>
					</c:forEach>
				</tbody>
			</table>
			</c:if>
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
	
	
	function deleteSupplier(id) {
		
		$('<div></div>').appendTo('body')
	    .html('<div><h6>Do you want to permanenly Delete this Supplier from the system ?</h6></div>')
	    .dialog({
	    modal: true,
	    title: 'Delete Warning message for Supplier ID : ' + id,
	    zIndex: 10000,
	    autoOpen: true,
	    width: 'auto',
	    resizable: false,
	    buttons: {
	        Yes: function () {
	        	 $.ajax({url: "/sdnext/deleteSupplier.html?supplierId="+id,	        	
	     	        success: function(result){
	     	    		$('#alert').css('display', 'inline-block');
	     	            $("#alert").html("Supplier Id " + id + "  successfully deleted ");
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
	
	function editSupplier(id) {

	var url = "";
	    $("#"+id).each(function(){
	    	var supplierId = $(this).find('#supplierId').val();
			var supplierName = $(this).find('#supplierName').val();
			var brandName = $(this).find('#brandName').val();
			var contactNumber1 = $(this).find('#contactNumber1').val();
			var contactNumber2 = $(this).find('#contactNumber2').val();

			
			//var labelingPrice = buyingPrice * (profitPercentage*1 + 100.00) / 100;
			
			url = "supplierId="+supplierId+"&supplierName="+supplierName+"&brandName="+brandName+"&contactNumber1="+contactNumber1+"&contactNumber2="+contactNumber2;
			//$(this).find('#labelingPrice').val(lablingPrice);
			
			$(this).find('#btn_edit_'+id).show();
			$(this).find('#btn_save_'+id).hide();
	    });
	    
	    
	    $.ajax({
	    	
	    	url: "/sdnext/editSupplier.html?"+url,
	        	
	        success: function(result) {
	        	clickSupplierList();
	    	}
	    });
	}
	
	/*
	 * This function show save button and hide edit button
	 */
	function showSaveButton(id) {
	    $("#"+id).each(function(){
			$(this).find('#btn_edit_'+id).hide();
			$(this).find('#btn_save_'+id).show();
	    });
	}
	
function clickSupplierList() {
	document.getElementById('displaySuppliers').click();
}
	
</script>

</body>
</html>











