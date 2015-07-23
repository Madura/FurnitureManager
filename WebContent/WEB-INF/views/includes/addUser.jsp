<form action="/sdnext/saveUser.html" method="POST" class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Create User</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="userName">User Name</label>  
  <div class="col-md-4">
  <input id="userName" name="userName" type="text" placeholder="" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="initialPassword">Initial Password</label>  
  <div class="col-md-4">
  <input id="password" name="password" type="text" placeholder="" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="userType">User Type</label>
  <div class="col-md-4">
    <select id="userType" name="userType" class="form-control">
      <option value="Admin">Admin/Owner</option>
      <option value="Manager">Manager</option>
      <option value="Cashier">Cashier</option>
    </select>
  </div>
</div>

<!-- Multiple Radios -->
<div class="form-group">
  <label class="col-md-4 control-label" for="radios">User Status</label>
  <div class="col-md-4">
  <div class="radio">
    <label for="radios-0">
      <input type="radio" name="userStatus" id="radios-0" value="1" checked="checked">
      Active
    </label>
	</div>
  <div class="radio">
    <label for="radios-1">
      <input type="radio" name="userStatus" id="radios-1" value="2">
      Inactive
    </label>
	</div>
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
