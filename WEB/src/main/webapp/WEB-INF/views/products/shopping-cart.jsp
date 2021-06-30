<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form class="bg0 p-t-75 p-b-85" method="POST"
	action="/product/update" modelAttribute="cartForm">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
				<div class="m-l-25 m-r--38 m-lr-0-xl">
					<div class="wrap-table-shopping-cart">
						<table class="table-shopping-cart">
							<tr class="table_head">
								<th class="column-1">Product</th>
								<th class="column-2">Name</th>
								<th class="column-3">Price</th>
								<th class="column-4">Quantity</th>
								<th class="column-5">Total</th>
								<th class="column-6"></th>
							</tr>
							<c:forEach var="item" items="${item}">
								<tr class="table_row">
									<td class="column-1">
										<div class="how-itemcart1">
											<img
												src="${pageContext.request.contextPath}/storage/${item.product.image}"
												alt="IMG" name="image">
										</div>
									</td>

									<td class="column-2"><form:input path="name"
											value="${item.product.name}" /></td>
									<td class="column-3">${item.product.price}</td>
									<td class="column-4">
										<div class="wrap-num-product flex-w m-l-auto m-r-0">
											<div
												class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

											<form:input class="mtext-104 cl3 txt-center num-product"
												type="number" path="quantity" value="${item.quantity}" name="quantity" />

											<div
												class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>
									</td>
									<td class="column-5">${item.quantity*item.product.price}</td>
									<td class="column-6"><a
										href="/product/deleteCart/${item.product.id}"> delete </a></td>
								</tr>
							</c:forEach>
						</table>
					</div>

					<div
						class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
						<div class="flex-w flex-m m-r-20 m-tb-5">
							<input
								class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5"
								type="text" name="coupon" placeholder="Coupon Code">

							<div
								class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
								Apply coupon</div>
						</div>

						<input type="submit" value="Update Cart"
							class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10" />
					</div>
				</div>
			</div>

			<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
				<div
					class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
					<h4 class="mtext-109 cl2 p-b-30">Cart Totals</h4>

					<div class="flex-w flex-t bor12 p-b-13">
						<div class="size-208">
							<span class="stext-110 cl2"> Subtotal: </span>
							<c:set var="total" value="${0}" />
							<c:forEach items="${sessionScope.item}" var="item">
								<c:set var="total"
									value="${total + item.quantity * item.product.price}" />
							</c:forEach>
						</div>

						<div class="size-209">
							<span class="mtext-110 cl2"> $ ${total}</span>
						</div>
					</div>

					<div class="flex-w flex-t bor12 p-t-15 p-b-30">
						<div class="size-208 w-full-ssm">
							<span class="stext-110 cl2"> Goods receive information: </span>
						</div>

						<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">

							<input
								class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5"
								type="text" name="mail" placeholder="Email" id="mail"> <input
								class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5"
								type="text" name="name" placeholder="Name" id="cus_name">
							<input
								class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5"
								type="text" name="phone" placeholder="số điện thoại" id="phone">

							<div class="p-t-15">
								<span class="stext-112 cl8"> Calculate Shipping </span>

								<div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9">
									<select class="js-select2" name="time">
										<option>Select a country...</option>
										<option>Ha Noi</option>
										<option>TP HCM</option>
									</select>
									<div class="dropDownSelect2"></div>
								</div>

								<div class="bor8 bg0 m-b-12">
									<input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text"
										name="state" placeholder="State /  country">
								</div>

								<div class="bor8 bg0 m-b-22">
									<input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text"
										name="postcode" placeholder="Postcode / Zip">
								</div>

								<div class="flex-w">
									<div
										class="flex-c-m stext-101 cl2 size-115 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer">
										Update Totals</div>
								</div>

							</div>
						</div>
					</div>

					<div class="flex-w flex-t p-t-27 p-b-33">
						<div class="size-208">
							<span class="mtext-101 cl2"> Total: </span>
						</div>

						<div class="size-209 p-t-1"></div>
					</div>

					<a href="/product/buy" data-toggle="modal"
						data-target="#logoutModal"
						class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
						Proceed to Checkout</a>
					<div class="modal fade" id="logoutModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Ready to
										Pay</h5>
									<button class="close" type="button" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">Select "Order" below if you are
									ready to end your current session.</div>
								<div class="modal-footer">
									<button class="btn btn-secondary" type="button"
										data-dismiss="modal">Cancel</button>
									<a class="btn btn-primary" href="/product/buy">Yes</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form:form>




