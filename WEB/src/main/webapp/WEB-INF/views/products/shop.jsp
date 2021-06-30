<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>id</th>
				<th>name</th>
				<th>price</th>
				<th>#</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="product" items="${products}">
				<tr>
				<td>${product.id}</td>
				<td><a href="/product/${product.id}"
					></a>${product.name}</td>
				<td>${product.price}</td>
				<td>
					<form action="/cart/add/${product.id}" method="post">
						<input type="hidden" value="${product.id}" name="id"/>
						<button type="submit">Add to cart</button>
					</form>
				</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>