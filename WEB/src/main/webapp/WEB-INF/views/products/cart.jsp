<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<h4>
	Total: Rs.<span>${session.shoppingCart.total}</span>
</h4>
<table border="1">
	<thead>
		<tr>
			<th>#</th>
			<th>name</th>
			<th>price</th>
			<th>quantity</th>
			<th>subtotal</th>
			<th>remove</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${session.shoppingCart.items}">
			<td>${item.product.id}</td>
			<td>${item.product.name}</td>
			<td>Rs.<span>${item.product.price}</span></td>
			<td>
				<form:form action="/cart/update" method="post">
					<input type="hidden" value="${item.product.id}" name="id" /> <input
						type="number" min="1" value="${item.quantity}" name="qty" />
					<button type="submit">update</button>
				</form:form>
			</td>
			<td>Rs.<span>${item.subTotal}</span></td>
			<td>
				<form:form action="/cart/remove" method="post">
					<input type="hidden" value="${item.product.id}" name="id" />
					<button type="submit">remove</button>
				</form:form>
			</td>
		</c:forEach>
	</tbody>
</table>



