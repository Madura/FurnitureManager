<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			
			<div class="col-md-4 column">
			<!-- Sell Extranal Product Modal -->
			<div class="modal fade" id="modal-container-642839" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
							<h4 class="modal-title" id="myModalLabel">
								Sell Product Form
							</h4>
						</div>
						<div class="modal-body">

						<!-- include sell product form -->
						<jsp:include page="sellExtranalProductForm.jsp" />



						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> <button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
		<div class="col-md-4 column">

			
			<!-- Add external products -->
			<div class="modal fade" id="modal-container-246328" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
							<h4 class="modal-title" id="myModalLabel">
								Add Products
							</h4>
						</div>
						<div class="modal-body">
						
						<!-- include buyExtranalProduct form -->
						<jsp:include page="buyExtranalProductForm.jsp" />


						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> <button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
		<div>
			
		
		<div class="col-md-4 column">
			
			<!-- Add user Modal -->
			<div class="modal fade" id="modal-container-750511" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
							<h4 class="modal-title" id="myModalLabel">
								Modal title
							</h4>
						</div>
						<div class="modal-body">
						
						
						<!-- include sell product form -->
						<jsp:include page="addUser.jsp" />
						
						
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> <button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
					
				</div>
				
			</div>
			</div>
			
		<div class="col-md-4 column">
			
			<!-- Add External Item Modal -->
			<div class="modal fade" id="modal-container-750512" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
							<h4 class="modal-title" id="myModalLabel">
								Modal title
							</h4>
						</div>
						<div class="modal-body">
						
						
						<!-- include sell product form -->
						<jsp:include page="addExtranalItemPopup.jsp" />
						
						
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> <button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
			<div class="col-md-4 column">
			
			<!-- Add Supplier Modal -->
			<div class="modal fade" id="modal-container-750513" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
							<h4 class="modal-title" id="myModalLabel">
								Add Supplier
							</h4>
						</div>
						<div class="modal-body">
						
						
						<!-- include sell product form -->
						<jsp:include page="addSupplier.jsp" />
						
						
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> <button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
					
				</div>
				
			</div>