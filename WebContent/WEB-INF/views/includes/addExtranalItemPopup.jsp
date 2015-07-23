

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
		<form name="productForm" class="form-horizontal" method="POST" action="/sdnext/saveExternalItem.html">
            <fieldset>
                         
                         <!-- Form Name -->
              <legend>Add External Products</legend>
              
              <!-- Select Basic -->
              <div class="form-group">
                <label class="col-md-4 control-label" for="supplierId">Supplier :</label>
                <div class="col-md-5">
                  <select id="supplierId" name="supplierId" class="form-control">
                    <c:forEach items="${suppliers}" var="supplier">
                    	<option value="${supplier.supplierId}">${supplier.supplierName}</option>
                    </c:forEach>
                  </select>
                </div>
              </div>
              
              <!-- Text input-->
              <div class="form-group">
                <label class="col-md-4 control-label" for="productCode">Product Code :</label>  
                <div class="col-md-5">
                <input id="productCode" name="productCode" type="text" placeholder="" class="form-control input-md" required="">
                  
                </div>
              </div>
              
              
              <!-- Text input-->
              <div class="form-group">
                <label class="col-md-4 control-label" for="productName">Product Name :</label>  
                <div class="col-md-5">
                <input id="productName" name="productName" type="text" placeholder="" class="form-control input-md" required="">
                  
                </div>
              </div>
              
              <!-- Select Basic -->
              <div class="form-group">
                <label class="col-md-4 control-label" for="brandName">Product Brand Name :</label>
                <div class="col-md-5">
                  <select id="brandName" name="brandName" class="form-control">
                    <c:forEach items="${brandNames}" var="brand">
                    	<option value="${brand}">${brand}</option>
                    </c:forEach>
                  </select>
                </div>
              </div>
              
              <!-- Text input-->
              <div class="form-group">
                <label class="col-md-4 control-label" for="unitPrice" >Unit Price</label>  
                <div class="col-md-5">
                <input id="unitPrice" name="unitPrice" type="text" placeholder="" class="form-control input-md" required="" >
           
                <span class="help-block">Item buying price</span>  
                </div>
              </div>
              
              <!-- Text input-->
              <div class="form-group">
                <label class="col-md-4 control-label" for="quantity">Quantity :</label>  
                <div class="col-md-5">
                <input id="quantity" name="quantity" type="text" placeholder="" class="form-control input-md" required="">
                  
                </div>
              </div>           
              
              <!-- Button (Double) -->
              <div class="form-group">
                <label class="col-md-4 control-label" for="saveProduct"></label>
                <div class="col-md-8">
                  <button id="saveProduct" name="saveProduct" type="submit" class="btn btn-success">Save Product</button>
                  <button id="clearForm" name="clearForm" type="reset"  class="btn btn-danger">Clear</button>
                </div>
              </div>
              
              </fieldset>
              </form>
           </div>
           
 <script type="text/javascript">

	/*
	 * This function iterate TR and find TD by Id's and count lablig price
	 */
	function countLabldingPriceOnForm() {
			var buyingPrice = $('form #buyingPrice').val();
			var profitPercentage = $('form #profitPercentage').val();
			var lablingPrice = buyingPrice * (profitPercentage*1 + 100.00) / 100;
			$('form #productLabelingPrice').val(lablingPrice);
	}
	
</script>
