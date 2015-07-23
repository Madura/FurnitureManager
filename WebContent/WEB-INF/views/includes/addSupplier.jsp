<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="/sdnext/saveSupplier.html" method="POST" class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Create User</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="userName">Supplier Code</label>  
  <div class="col-md-4">
  <input id="supplierName" name="supplierName" type="text" placeholder="" class="form-control input-md" required="">
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
  <label class="col-md-4 control-label" for="initialPassword">Contact Number 1</label>  
  <div class="col-md-4">
  <input id="contactNumber1" name="contactNumber1" type="text" placeholder="" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="initialPassword">Contact Number 2</label>  
  <div class="col-md-4">
  <input id="contactNumber2" name="contactNumber2" type="text" placeholder="" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="saveUser"></label>
  <div class="col-md-8">
    <input id="saveUser" name="saveUser" class="btn btn-success" type="submit"/>
    <input id="clearForm" name="clearForm" class="btn btn-danger" type="Reset" />
  </div>
</div>

</fieldset>
</form>
