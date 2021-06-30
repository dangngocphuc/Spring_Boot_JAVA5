
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h1 class="h3 mb-2 text-gray-800">ORDERS</h1>
<!-- DataTales Example -->
<nav>
	<div class="nav nav-tabs" id="nav-tab" role="tablist">
		<a class="nav-item nav-link active" id="nav-home-tab"
			data-toggle="tab" href="#nav-home" role="tab"
			aria-controls="nav-home" aria-selected="true">Orders</a> <a
			class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
			href="#nav-profile" role="tab" aria-controls="nav-profile"
			aria-selected="false">Delivered</a> <a class="nav-item nav-link"
			id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab"
			aria-controls="nav-contact" aria-selected="false">Cancelled</a>
	</div>
</nav>
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
								<th>ID</th>
								<th>Date</th>
								<th>Customer</th>
								<th>Email</th>
								<th>Phone</th>
								
								<td>&nbsp;</td>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${order}">
								<tr>
								<td>${item.id}</td>
								<td>${item.orderDate}</td>
								<td></td>
								<td></td>
								<td></td>
								<td><a href="/order/${item.id}" style="text-decoration: none"><i  class="fa fa-edit" aria-hidden="true"></i>
										Detail</a> 
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="tab-pane fade" id="nav-profile" role="tabpanel"
		aria-labelledby="nav-profile-tab">

		<div class="card shadow mb-4">
			<div class="card-header py-3"></div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Date</th>
								<th>Reference</th>
								<th>Customer</th>
								<th>Address</th>
								<th>Nb Items</th>
								<th>Total</th>
								<td>&nbsp;</td>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Tiger Nixon</td>
								<td>System Architect</td>
								<td>Edinburgh</td>
								<td>61</td>
								<td>2011/04/25</td>
								<td>$320,800</td>
								<td><a href=""><i class="fa fa-detail" aria-hidden="true"></i>
										Detail</a> <a href=""><i class="fa fa-trash" aria-hidden="true"></i>
										Delete</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>


	</div>
	<div class="tab-pane fade" id="nav-contact" role="tabpanel"
		aria-labelledby="nav-contact-tab">
		<div class="card shadow mb-4">
			<div class="card-header py-3"></div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Date</th>
								<th>Reference</th>
								<th>Customer</th>
								<th>Address</th>
								<th>Nb Items</th>
								<th>Total</th>
								<td>&nbsp;</td>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2011/04/25</td>
								<td>System Architect</td>
								<td>Edinburgh</td>
								<td>61</td>
								<td></td>
								<td>$320,800</td>
								<td><a href=""><i class="fa fa-edit" aria-hidden="true"></i>
										Edit</a> <a href=""><i class="fa fa-trash" aria-hidden="true"></i>
										Delete</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</div>


























