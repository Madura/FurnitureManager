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
	<style>

inputFieldOff {
	display: none;
} 

inputFieldOn {
	display: block;
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
			
		
		/* 
		var i = 1;
	  function search() {
	    //alert("serach");
		var productName = document.getElementById("searchProduct").value;
		//alert(productName);
		 
	    $.ajax({
		  	  url: "${pageContext.request.contextPath}/searchProduct.html",
		  	  type: "get", //send it through get method
		  	  async: false,
		  	  data:{"productName" : productName },
		  	  success: function(response) {
		  		  //alert("res");
		  		//$('#bill').empty();
		  		
	            for (var x = 0; x < response.length; x++) {
 	            	content = "<div>";
	                content += response[x].productCode;
	                content += "</div><div>";
	                content += response[x].productName;
	                content += "</div>"; 
	                
	            	content = "<tr id=" + i + " ><td>";
	                content += response[x].productCode;
	                content += "</td><td>";
	                content += response[x].productName;
	                content += "</td><td>";
	                content += response[x].brandName;
	                content += "</td><td>";
	                content += '<div class="inputFieldOff">1</div><input id="' + i + '" style="display:none" value="1" type="text" maxlength="4" size="2" class="form-control input-md" required="required" onkeyup= "showSaveButton(' + i + ');" />';
	                content += "</td><td>";
	                content += '<button id="btn_edit_'+i+'" type="button" class="btn btn-primary" onclick="makeInputField(' + i + ')" > Edit </button> <button id="btn_save_'+i+'" type="button" class="btn btn-success" style="display:none;" onclick="editProduct(' + i + '); closeInputField(' + i + ');" > Save </button> ';
	                content += "<button type='button' class='removebutton' title='Remove this row'>X</button>";
	                content += "</td></tr>";
	                
	                
	                $(content).appendTo("#sellingTable");
	                i ++;
	                
	               // updateListing(data[x]);
	            };
		  	  },
		  	  error: function(xhr) {
		  	  }
		  	});	 
	  }
		
		*/
	
	  var i = 1;
	  var items = {};
	  function search() {
	    //alert("serach");
		var productName = document.getElementById("searchProduct").value;
		//alert(productName);
		 
	    $.ajax({
		  	  url: "${pageContext.request.contextPath}/searchProduct.html",
		  	  type: "get", //send it through get method
		  	  async: false,
		  	  data:{"productName" : productName },
		  	  success: function(response) {
		  		  //alert("res");
		  		//$('#bill').empty();
		  		 //console.log(response);
		  		 
		  		
	            for (var x = 0; x < response.length; x++) {
	                var quantity = response[x].quantity;
	                var unitPrice = response[x].unitPrice;
	                var labelingPrice = response[x].labelingPrice;
	            	content = "<tr id=" + i + " class='item' >";
	            	content += '<td id="productCode_'+i+'">';
	                content += response[x].productCode;
	                content += '</td><td id="productName_'+i+'">';
	                content += response[x].productName;
	                content += '</td><td id="brandName_'+i+'">';
	                content += response[x].brandName;
	                content += '</td><td>';
	                content += '<input id="quantity_' + i + '" value="1" type="text" maxlength="4" size="2" class="form-control input-md" required="required" onkeyup="validateQuantity(' + i + ');updateTable();" availableQuantity="' + quantity + '" />';
	                content += '</td><td id="labledPrice_' + i + '">';
	                content += labelingPrice;
	                content += '</td><td>';
	                content += '<input id="discount_' + i + '" type="text" maxlength="4" size="2" class="form-control input-md" unitPrice="' + unitPrice + '" labelingPrice="' + labelingPrice + '"  onkeyup="validateDiscount(' + i + '); updateTable();"/>';
	                content += '</td><td>';
	                content += '<button id="btn_remove" type="button" class="btn btn-danger removebutton" > Remove </button>';
	                content += '</td></tr>';
	                
/* 			         items ["ProductCode"] = response[x].productCode;
			         items ["Product"] = response;
			         console.log(items); */
	                
	                $(content).appendTo("#sellingTable > tbody:first");
	                i ++;
	                
	                
	            }; updateTable();
		  	  },
		  	  error: function(xhr) {
		  	  }
		  	});	 
	  }
	  
	  function updateTable() {
		  var j = 1;
		  var totalLabelingPrice = 0;
		  var totalItemCount = 0;
		  var totalDiscountPrice = 0;
		  $("tr.item").each(function() {
			  $this = $(this);
			  var count = $this.find("#quantity_"+j).val()*1;
			  totalLabelingPrice += $this.find("#labledPrice_"+j).html()*1*count;
			  totalItemCount += count;
			  totalDiscountPrice += $this.find("#discount_"+j).val()*1*count;
			  j++;
			});
		  $("#total").removeClass("inputFieldOn"); 
		  $("#total").addClass("inputFieldOn");
		  $("#totalQuantity").text(totalItemCount);
		  $("#totalDiscount").text(totalDiscountPrice);
		  $("#totalAmount").text(totalLabelingPrice);
	  }
	  
	  function validateQuantity(id) {
		 
		  var maxStock = $('#quantity_'+id).attr('availableQuantity')*1;
		  var quantity = $('#quantity_'+id).val()*1;
		  //alert(maxStock);
		  if( maxStock < quantity) {
			 alert("Maximum stock is : " + maxStock);
			 $('#quantity_'+id).val(maxStock);
		  } 
	  }
	  
	  function validateDiscount(id) {
		  //alert(id);
		  var unitPrice = $('#discount_'+id).attr('unitPrice')*1;
		  var labelingPrice = $('#discount_'+id).attr('labelingPrice')*1;
		  var discountAmount = $('#discount_'+id).val()*1;
		  var margin = labelingPrice - unitPrice;
		  //alert(unitPrice);
		  //alert(labelingPrice);
		  //alert(discountAmount);
		  $('#discount_'+id).css("background","#FFFFFF");
		  if( discountAmount <= margin / 4 ) {
			 //alert("Max margins : " + margin/4);
			 $('#discount_'+id).css("background","#98FF98");
		  } else if((discountAmount > margin / 4 ) && (discountAmount <= margin / 2)) {
			  //alert("red");
			  $('#discount_'+id).css("background","#FFF380");
		  } else if((discountAmount >= margin / 2)){
			  //alert("you cannot give this amount as discount");
			  $('#discount_'+id).val("0");
			  $('#discount_'+id).css("background","#FF99FF");
		  } else {
			  $('#discount_'+id).val("0");
			  $('#discount_'+id).css("background","#FFFFFF");
		  }
	  }
	  
	  $(document).on('click', 'button.removebutton', function () {
		     alert("aa");
		     clearTotal();
		     updateTable();
		     $(this).closest('tr').remove();
		     return false;
	  });
	  
	  function clearTotal() {
		  $("#totalQuantity").text("");
		  $("#totalDiscount").text("");
		  $("#totalAmount").text("");
	  }
	  
		
		function makeVisible(id) {
			$('.mainDiv').each(function() {
				  var divId = $(this).attr('id');			  
				  if(id == divId) {
				  	  $(this).css("display", "block");
				  		return;
				  } else {
				  	  $(this).css("display", "none");
				  }
			});
		}
		
/* 		function sumitForm() {
			alert("click");
			  var j = 1;
			  $("tr.item").each(function() {
				  $this = $(this);
				  var productCode = $this.find("#productCode_"+j).html();
				  var brandName = $this.find("#brandName_"+j).html();

				  var productName = $this.find("#productName_"+j).html();

				  
				  var count = $this.find("#quantity_"+j).val()*1;

				  alert("productCode_  "+productCode);
				  
				  alert("brandName_  "+brandName);
				  alert("productName  "+productName);
				  j++;
				});
		 } */
		var soldItems = [];
		function sumitForm() {
			alert("click");
			  var j = 1;
			  $("tr.item").each(function() {
				  
				  alert("inside");
				  $this = $(this);
				  var productCode = $this.find("#productCode_"+j).html();
				  var brandName = $this.find("#brandName_"+j).html();

				  var productName = $this.find("#productName_"+j).html();
				  var labelingPrice = $this.find("#labledPrice_"+j).html()*1;
				  var quantity = $this.find("#quantity_"+j).val();
				  var discount = $this.find("#discount_"+j).val();

				  
				  var soldPrice = labelingPrice - discount;
				  var item = {'productCode' : productCode, 'brandName' : brandName, 'productName' : productName, 'quantity' : quantity, 'discount' : discount, 'soldPrice' : soldPrice };
				  soldItems.push(item);
/* 				  alert("productCode_  " + productCode);
				  
				  alert("brandName_  " + brandName);
				  alert("productName  " + productName);
				  alert("labelingPrice  " + labelingPrice);
				  alert("quantity  " + quantity);
				  alert("discount  " + discount);
				  
				  alert("soldPrice  " + soldPrice); */
		
				  j++;
				});
			  alert(soldItems);
			  var jsonString = JSON.stringify(soldItems);
			  alert(jsonString);
			  
			   $.ajax({ 
	                url:"/sdnext/sellProducts.html",    
	                type:"POST", 
	                contentType: "application/json; charset=utf-8",
	                data: jsonString, //Stringified Json Object
	                async: false,    //Cross-domain requests and dataType: "jsonp" requests do not support synchronous operation
	                cache: false,    //This will force requested pages not to be cached by the browser          
	                processData:false, //To avoid making query String instead of JSON
	                success: function(resposeJsonObject){     
	                	alert("ok");
	        }});
		 }

	   
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
		<jsp:include page="includes/headerMenu.jsp" />
					

		<div class="col-md-3 column">
			<!-- include nav bar -->
			<jsp:include page="includes/leftSideBar.jsp" />
		</div>
	
			
			
	<div class="col-md-9 column">
		<div class="row clearfix">

			<!-- Sell Extranal Product Modal Link -->
			<!--  <a id="modal-642839" href="#modal-container-642839" role="button" class="btn btn-danger" data-toggle="modal">Sell Products</a>   -->
			
			<!-- Add external products link -->
			<!-- <a id="modal-246328" href="#modal-container-246328" role="button" class="btn btn-success" data-toggle="modal">Add Ex Products</a>   -->
			
			<!-- Add user Modal link -->
			<!-- <a id="modal-750511" href="#modal-container-750511" role="button" class="btn btn-warning" data-toggle="modal">Add Users</a>   -->

			<!-- Add External Item Modal Link -->
			<!-- <a id="modal-750512" href="#modal-container-750512" role="button" class="btn btn-warning" data-toggle="modal">Add External Items</a>  -->
			
			<!-- Add Supplier Modal Link -->
			<!-- <a id="modal-750513" href="#modal-container-750513" role="button" class="btn btn-success" data-toggle="modal">Add Suppliers</a>  -->
		
			<%=user.getUserName() %> (<%=user.getUserType() %> )  |  <a href="<c:url value="/logout.html" />" > Logout</a> 
		
		<!-- 
			<div class="alert alert-success alert-dismissable">
				 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">�</button>
				<h4>
					Alert!
				</h4> <strong>Warning!</strong> Best check yo self, you're not looking too good. <a href="#" class="alert-link">alert link</a>
			</div>
			 -->
			 <div id="viewStockDiv" class="mainDiv" style="display:block">
			 	<jsp:include page="includes/stock.jsp" />
			 </div>
			 
			 
			 <div id="sellProductDiv" class="mainDiv" style="display:none">
			  			<!-- include sell product form -->
						<jsp:include page="includes/sellExtranalProductForm.jsp" />
						
				<div id="sellTable">
				
					<!-- data-url="data1.json" -->
					<table id="sellingTable" class="table table-bordered table-striped"  data-height="299" data-sort-name="name" data-sort-order="desc">
					    <thead>
					        <tr class="success">
					            <th data-field="id" data-align="right" data-sortable="true"><div class="inputFieldOff">Product Code</div></th>
					            <th data-field="name" data-align="center" data-sortable="true"><div class="inputFieldOff">Product Name</th>
					            <th data-field="quantity" data-sortable="true"><div class="inputFieldOff">Brand Name</div></th>
					            <th data-field="quantity" data-sortable="true"><div class="inputFieldOff">Quantity</div></th>
					            <th data-field="sellingPrice" data-sortable="true">Selling Price</th>
					            <th data-field="discount" data-sortable="true">Item Discount</th>
					            <th data-field="price" data-sortable="true">Action</th>
					        </tr>
					    </thead>
					    <tbody>

					    </tbody>
					    	<tr id="total" class="inputFieldOff " >
					    		<td></td>
					    		<td></td>
					    		<td></td>
					    		<td><div id="totalQuantity"></div></td>
					    		<td><div id="totalAmount"></div></td>
					    		<td><div id="totalDiscount"></div></td>
					    		<td><button id="btn_save" type="button" class="btn btn-success"  onclick="sumitForm();" value="" > Submit </button></td>
					    	</tr>
					    
					</table>
	
				</div>
			 </div>
			 
			 <div id="addProductDiv" class="mainDiv" style="display:none">
						<!-- include buyExtranalProduct form -->
						<jsp:include page="includes/addExtranalItemPopup.jsp" />
			 </div>
			 
			 <div id="addSupplierDiv" class="mainDiv" style="display:none">
						<!-- include sell product form -->
						<jsp:include page="includes/addSupplier.jsp" />
			 </div>
			 
			 <div id="addUserDiv" class="mainDiv" style="display:none">
						<!-- include sell product form -->
						<jsp:include page="includes/addUser.jsp" />
			 </div>
			 
		</div>
		
		
			<jsp:include page="includes\popups.jsp" />

			
			<!--  
			<div>
				<h3>Search</h3>
		
				<input type="text"  id="w-input-search" value="">
				<span>
					<button id="w-button-search" type="button" onclick="search();">Search</button>
				</span>
			</div>
			-->

			

		
		<div class="col-md-9 column" >
						
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
