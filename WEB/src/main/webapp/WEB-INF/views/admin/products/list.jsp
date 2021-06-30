<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title></title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/jquery.table2excel.min.js"></script>
<style>
.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	min-width: 1000px;
	background: #fff;
	padding: 20px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 10px;
	margin: 0 0 10px;
	min-width: 100%;
}

.table-title h2 {
	margin: 8px 0 0;
	font-size: 22px;
}

.search-box {
	position: relative;
	float: right;
}

.search-box input {
	height: 34px;
	border-radius: 20px;
	padding-left: 35px;
	border-color: #ddd;
	box-shadow: none;
}

.search-box input:focus {
	border-color: #3FBAE4;
}

.search-box i {
	color: #a0a5b1;
	position: absolute;
	font-size: 19px;
	top: 8px;
	left: 10px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child {
	width: 130px;
}

table.table td a {
	color: #a0a5b1;
	display: inline-block;
	margin: 0 5px;
}

table.table td a.view {
	color: #03A9F4;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #E34724;
}

table.table td i {
	font-size: 19px;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 95%;
	width: 30px;
	height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 30px !important;
	text-align: center;
	padding: 0;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 6px;
	font-size: 95%;
}

.table-title .btn {
	color: #566787;
	float: right;
	font-size: 13px;
	background: #fff;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-title .btn:hover, .table-title .btn:focus {
	color: #566787;
	background: #f2f2f2;
}

.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}
</style>

<script>
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>


<link rel="stylesheet" type="text/css"
	href="http://www.shieldui.com/shared/components/latest/css/light/all.min.css" />
<script type="text/javascript"
	src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript"
	src="http://www.shieldui.com/shared/components/latest/js/jszip.min.js"></script>

<script type="text/javascript">
	jQuery(function($) {
		$("#exportButton").click(function() {
			// parse the HTML table element having an id=exportTable
			var dataSource = shield.DataSource.create({
				data : "#exportTable",
				schema : {
					type : "table",
					fields : {
						ID : {
							type : Number
						},
						Name : {
							type : String
						},
						Price : {
							type : Number
						}
					}
				}
			});

			// when parsing is done, export the data to Excel
			dataSource.read().then(function(data) {
				new shield.exp.OOXMLWorkbook({
					author : "PrepBootstrap",
					worksheets : [ {
						name : "PrepBootstrap Table",
						rows : [ {
							cells : [ {
								style : {
									bold : true
								},
								type : Number,
								value : "ID"
							}, {
								style : {
									bold : true
								},
								type : String,
								value : "Name"
							}, {
								style : {
									bold : true
								},
								type : Number,
								value : "Price"
							} ]
						} ].concat($.map(data, function(item) {
							return {
								cells : [ {
									type : Number,
									value : item.ID
								}, {
									type : String,
									value : item.Name
								}, {
									type : Number,
									value : item.Price
								} ]
							};
						}))
					} ]
				}).saveAs({
					fileName : "Product to Excel"
				});
			});
		});
	});
</script>
<script>
	function confirmEdit() {
		var x = confirm("Are you sure you want to delete?");
		if (x)
			return true;
		else
			return false;
	};
</script>


</head>
<body>
	<div class="container-xl" id="page-content">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-4">
							<h2>
								<b>List Products</b>
							</h2>
						</div>

						<div class="col-sm-4">
							<!-- <a href="/products/search?name=" class="btn btn-primary"
								onclick="getcube()"><i class="material-icons">&#xE8B6;</i></a>  -->

							<a href="/products/new" class="btn btn-secondary"> <i
								class="material-icons">&#xE147;</i> <span>CREATE</span>
							</a>
							<button id="exportButton" class="btn btn-primary">
								<i class="material-icons">&#xE24D;</i>Export
							</button>
						</div>
						<form:form action="/products/search" method="GET">
							<button class="btn btn-primary">
								Search <i class="material-icons">&#xE8B6;</i>
							</button>
							<div class="search-box">
								<input type="text" class="form-control" name="name" id="name"
									placeholder="Search&hellip;" />
							</div>

						</form:form>

					</div>
				</div>
				<table class="table table-stripe table-hover table-bordered"
					id="exportTable">
					<thead>
						<tr>
							<th>#</th>
							<th>Image</th>
							<th>ID</th>
							<th>Name<i class="fa fa-sort"></i></th>
							<th>Price</th>
							<th>Type<i class="fa fa-sort"></i></th>
							<th>Quantity</th>
							<td>&nbsp;</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.getContent()}" var="product">
							<tr>
								<td><input type="checkbox"></td>
								<td><img width="90px" height="110px"
									src="${pageContext.request.contextPath}/storage/${product.image}"></td>
								<td>${product.id}</td>
								<td>${product.name}</td>
								<td>${product.price}</td>
								<td>${product.type}</td>
								<td>${product.quantity}</td>

								<td><a href="/products/${product.id}" class="edit"
									data-toggle="modal" data-target="#logoutModal" title="Edit"><i
										class="material-icons">&#xE254;</i></a> <a
									href="/products/delete/${product.id}" class="delete"
									data-toggle="modal" data-target="#logoutModal1" title="Delete"><i
										class="material-icons">&#xE872;</i></a></td>
							</tr>
							<!-- Edit Modal-->
							<div class="modal fade" id="logoutModal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Ready to
												Edit?</h5>
											<button class="close" type="button" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
										<div class="modal-body">Select "Edit" below if you are
											ready to end your current session.</div>
										<div class="modal-footer">
											<button class="btn btn-secondary" type="button"
												data-dismiss="modal">Cancel</button>
											<a class="btn btn-primary" href="/products/${product.id}">EDIT</a>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="logoutModal1" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Ready to
												DELETE?</h5>
											<button class="close" type="button" data-dismiss="modal1"
												aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
										<div class="modal-body">Select "Delete" below if you are
											ready to end your current session.</div>
										<div class="modal-footer">
											<button class="btn btn-secondary" type="button"
												data-dismiss="modal">Cancel</button>
											<a class="btn btn-primary"
												href="/products/delete/${product.id}">DELETE</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</tbody>
				</table>

				<div class="clearfix">
					<div class="hint-text">
						Showing <b>${page.getNumber() + 1}</b> out of <b>${page.getTotalPages()}</b>
						pages
					</div>
					<ul class="pagination">

						<c:if test="${page.getNumber() > 0 }">
							<li class="page-item disabled"><a
								style="text-decoration: none"
								href="/products/pagination?currentPage=${page.getNumber()}">
									<i class="fa fa-angle-double-left"></i> Prev
							</a></li>
						</c:if>
						<c:if test="${page.getNumber() + 1 < page.getTotalPages() }">
							<li class="page-item disabled"><a
								style="text-decoration: none"
								href="/products/pagination?currentPage=${page.getNumber() + 2}">
									Next <i class="fa fa-angle-double-right"></i>
							</a></li>
						</c:if>
					</ul>
				</div>

			</div>
		</div>
	</div>

</body>
</html>