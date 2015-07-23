


	
	
	<div>
		<form name="productForm" class="form-horizontal" method="POST" action="/sdnext/saveProduct.html">
            <fieldset>
                         
                         <!-- Form Name -->
              <legend>Add External Products</legend>
              
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
                    <option value="1">Arpico</option>
                    <option value="2">Damro</option>
                    <option value="3">Nilkamal</option>
                    <option value="4">Priyestra</option>
                    
                  </select>
                </div>
              </div>
              
              <!-- Text input-->
              <div class="form-group">
                <label class="col-md-4 control-label" for="unitPrice" >Unit Price</label>  
                <div class="col-md-5">
                <input id="buyingPrice" name="buyingPrice" type="text" placeholder="" class="form-control input-md" required="" onkeyup="countLabldingPriceOnForm();">
           
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
              
              <!-- Text input-->
              <div class="form-group">
                <label class="col-md-4 control-label" for="profitPercentage" >Profit Percentage :</label>  
                <div class="col-md-5">
                <input id="profitPercentage" name="profitPercentage" type="text" placeholder="" class="form-control input-md" required="" onkeyup="countLabldingPriceOnForm();">
                 
                </div>
              </div>
              
              <!-- Text input-->
              <div class="form-group">
                <label class="col-md-4 control-label" for="productLabelingPrice">Labeling Price :</label>  
                <div class="col-md-5">
                <input id="productLabelingPrice" name="productLabelingPrice" type="text" placeholder="" class="form-control input-md" readOnly="true" >
                  
                </div>
              </div>
              
              <!-- Text input-->
              <div class="form-group">
                <label class="col-md-4 control-label" for="minStock">Minimum Stock for Alert :</label>  
                <div class="col-md-5">
                <input id="minStock" name="minStock" type="text" placeholder="" class="form-control input-md" >               
                </div>
              </div>
              
              <!-- Text input-->
              <div class="form-group">
                <label class="col-md-4 control-label" for="maxStock">Maximum Stock for Alert :</label>  
                <div class="col-md-5">
                <input id="maxStock" name="maxStock" type="text" placeholder="" class="form-control input-md" >
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
