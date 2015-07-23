<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.darshanafurniture.constant.BrandNames"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.darshanafurniture.model.User"%>
 
<%
 User user = (User) session.getAttribute("user"); 
%>
    
    <div class="row clearfix">
		<c:if test="${!empty externalItemStock}">
			<table class="table">
				<thead>
					<tr class="active">
						<th>Product Code</th>
						<th>Product Name</th>
						<th>Brand Name</th>
						<th>Quantity</th>
						<% if("Admin".equals(user.getUserType()) || "Manager".equals(user.getUserType())) { %>
						<th>Product Unit price</th>
						<% } %>
						<th>Product Labling price</th>
						<!-- <th>Actions on Row</th>  -->
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${externalItemStock}" var="product">
						<form:form method="POST" action="" >
						<tr id="${product.productCode}" class="${(product.quantity > 20) ? 'active' : (product.quantity > 10) ? 'success' : (product.quantity > 5) ? 'warning' : 'danger'}">
						
							<td><div class="inputFieldOff"><c:out value="${product.productCode}"/></div><input id="productCode" style="display:none" value="${product.productCode}" type="text" maxlength="8" size="8" class="form-control input-md" required="required" onkeyup= "showSaveButton('${product.productCode}');"  data-validation="alphanumeric"/></td>
							<td><div class="inputFieldOff"><c:out value="${product.productName}"/></div><input id="productName" style="display:none" value="${product.productName}" type="text" class="form-control input-md" size="8" required="required" onkeyup= "showSaveButton('${product.productCode}');"  data-validation="alphanumeric"/></td>
							<td><div class="inputFieldOff"><c:out value="${product.brandName}"/></div>											                  
								<select id="brandName" name="brandName" style="display:none" class="form-control" required="required" onchange="showSaveButton('${product.productCode}');">
			                  		<c:forEach items="<%=BrandNames.values() %>" var="brand">	
			                    		<option value="${brand}" <c:if test="${brand == product.brandName}"> selected="selected" </c:if> >${brand}</option>
			                    	</c:forEach>
			                  	</select>
							</td>
							
							<td><div class="inputFieldOff"><c:out value="${product.quantity}"/></div><input id="quantity" style="display:none" value="${product.quantity}" type="text" maxlength="4" size="1" class="form-control input-md" required="" onkeyup= "showSaveButton('${product.productCode}');"/></td>
							<% if("Admin".equals(user.getUserType()) || "Manager".equals(user.getUserType())) { %>
							<td><div class="inputFieldOff"><c:out value="${product.unitPrice}"/></div><input id="unitPrice" style="display:none" value="${product.unitPrice}" type="text" maxlength="8" size="6" class="form-control input-md" required="" onkeyup= "showSaveButton('${product.productCode}');" data-validation="number" data-validation-allowing="float"/></td>
							<% } %>
							
							<td><div class="inputFieldOff"><c:out value="${product.labelingPrice}"/></div><input id="unitPrice" style="display:none" value="${product.labelingPrice}" type="text" maxlength="8" size="6" class="form-control input-md" required="" onkeyup= "showSaveButton('${product.productCode}');" data-validation="number" data-validation-allowing="float"/></td>
							<!-- <td align="center"><button id="btn_edit_${product.productCode}" type="button" class="btn btn-primary" onclick="makeInputField(${product.productCode});" value="" > Edit </button> <button id="btn_save_${product.productCode}" type="button" class="btn btn-success" style="display:none;" onclick="editProduct(${product.productCode});closeInputField('${product.productCode}');" value="" > Save </button> |  <button id="btn_delete_${product.productCode}" type="button" class="btn btn-danger" onclick="deleteProduct(${product.productCode});" value="" > Delete </button></td>   -->
						</tr>
						</form:form>
					</c:forEach>
				</tbody>
			</table>
			</c:if>
		</div>
	</div>
    