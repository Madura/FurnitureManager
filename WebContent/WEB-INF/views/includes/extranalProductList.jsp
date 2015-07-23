	<div class="row clearfix">
		<div class="col-md-12 column">
		<c:if test="${!empty products}">
			<table class="table">
				<thead>
					<tr>
						<th>Product ID</th>
						<th>Product Name</th>
						<th>Brand Name</th>
						<th>Quantity</th>
						<th>Product Buying Price</th>
						<th>Profit percentage</th>
						<th>Product Labling Price</th>
						<th>Actions on Row</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${products}" var="product">

						<tr class="${(product.quantity > 20) ? 'active' : (product.quantity > 10) ? 'success' : (product.quantity > 5) ? 'warning' : 'danger'}">
							<td><c:out value="${product.productId}"/></td>
							<td><c:out value="${product.productName}"/></td>
							<td><c:out value="${product.brandName}"/></td>
							<td><c:out value="${product.quantity}"/></td>
							<td><c:out value="${product.buyingPrice}"/></td>
							<td><c:out value="${product.profitPercentage}"/></td>
							<td><c:out value="${product.labelingPrice}"/></td>
							<td align="center"><a href="editBuyingAndSellingProduct.html?id=${product.productId}" class="icon-pencil">Edit</a> | <a href="deleteBuyingAndSellingProduct.html?id=${product.productId}" class="close">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</c:if>
		</div>
	</div>