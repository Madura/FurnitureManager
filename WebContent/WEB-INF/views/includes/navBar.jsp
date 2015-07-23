<nav class="navbar navbar-default" role="navigation">
	<div class="navbar-header">
		 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> 
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li class="active">
				<a href="index.html">Home</a>
			</li>
			<li>
				<a href="userList.html">List Of Users</a>
			</li>
			<li>
				<a id="displayExternaItems" href="displayExternalItemList.html">Display External Items</a>
			</li>
			<li>
				<a id="displaySuppliers" href="displaySuppliers.html">Display Suppliers</a>
			</li>
			
			<li>
				<a id="displayBuyingAndSellingProducts" href="displayBuyingAndSellingProducts.html">Display Buy And Sell Product</a>
			</li>
			
		<form class="navbar-form navbar-left" role="search"  method="get">
			<div class="form-group">
				<input id="productName1" class="form-control" type="text">
			</div> <input type="submit" id="searchButton" class="btn btn-default" value="Search" onclick="" />
		</form>
	</div>
	
</nav>

<script type="text/javascript" >

$(document).ready(function() {
	
  	$('#productName1').autocomplete({
		
		serviceUrl: '${pageContext.request.contextPath}/searchProduct.html',
		paramName: "productName", // ?tagName='user input'
		delimiter: ",",
		
		
		transformResult: function(response) {
		   return {
		      suggestions: $.map($.getJSON(response), function(item) {   
			 		return { value: item.productCode, data: item.productName };
		      })
	 
		   };
	 
		}	    
	}); 
  	
}); 


/* $(document).ready(function() {
	
	var productName = document.getElementById("productName1").value;
	
	$("#searchButton").click(function(e){
	    //e.preventDefault();
	    alert("productName : "+productName);
	    $.ajax({
	  	  url: "${pageContext.request.contextPath}/searchProduct.html",
	  	  type: "get", //send it through get method
	  	  //contentType : "text/html",
	  	  data:{"productName" : "chair"},
	  	  success: function(response) {
	  	    alert("response came" + response );
	  	  },
	  	  error: function(xhr) {
	  	    alert("error");
	  	  }
	  	});
	});


}); */


/* function search() {
	var text = "";
	var productName = document.getElementById("productName1").value;
	alert(productName);
	
    $.ajax({
	  	  url: "${pageContext.request.contextPath}/searchProduct.html",
	  	  type: "get", //send it through get method
	  	  dataType: 'application/json',
	  	  async: false,
	  	  data:{"productName" : productName },
	  	  success: function(response) {
	  		text = response.responseText;
	  	  console.log("Response: "+response);
	  	  },
	  	  error: function(xhr) {
	  	    alert("error : " + xhr.responseText);
	  	  console.log("Response: "+xhr);
	  	  }
	  	});	
    alert(text);
} */

</script>