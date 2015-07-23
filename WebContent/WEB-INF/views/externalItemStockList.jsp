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


	
	<jsp:include page="includes/stock.jsp" />  

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
			var productCode = $(this).find('#productCode').val();
			var productName = $(this).find('#productName').val();
			var brandName = $(this).find('#brandName').val();
			var quantity = $(this).find('#quantity').val();
			var unitPrice = $(this).find('#unitPrice').val();
			
			url = "productCode="+productCode+"&productName="+productName+"&brandName="+brandName+"&quantity="+quantity+"&unitPrice="+unitPrice;
			
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
	document.getElementById('displayExternaItemsStock').click();
}
	
</script>

</body>
</html>











