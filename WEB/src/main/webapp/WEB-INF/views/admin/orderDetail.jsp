
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h1 class="h3 mb-2 text-gray-800">ORDERS-DETAIL</h1>
<!-- DataTales Example -->

<div class="tab-content" id="nav-tabContent">
	<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
		aria-labelledby="nav-home-tab">
		<div class="card shadow mb-4">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<Th>Image</Th>
								<th>name</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${orderDetail}">
								<tr>
									<td><img width="90px" height="110px"
										src="${pageContext.request.contextPath}/storage/${item.product.image}"></td>
									<td>${item.product.name}</td>
									<td>${item.price}</td>
									<td>${item.quantity}</td>
									<td>${item.quantity*item.product.price}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="flex-w flex-t bor12 p-b-13">
						<div class="size-208">
							<span class="stext-110 cl2"> Subtotal: </span>
							<c:set var="total" value="${0}" />
							<c:forEach items="${orderDetail}" var="item">
								<c:set var="total"
									value="${total + item.quantity * item.product.price}" />
							</c:forEach>
						</div>

						<div class="size-209">
							<span class="mtext-110 cl2"> $ ${total}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


























