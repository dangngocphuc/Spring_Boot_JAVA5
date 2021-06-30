<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="page-wrapper">
	<div id="page-inner">
		<div class="row">
			<div class="col-md-12">
				<h2>Detail of Product - ${product.id}</h2>
				${message}
			</div>
		</div>
		<!-- /. ROW  -->
		<hr />
		<div class="row">
			<div class="col-md-12">
				<!-- Form Elements -->
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-6">
								<h3>Info Product:</h3>
								<form:form action="/products/update" method="PUT"
									modelAttribute="productForm" enctype="multipart/form-data">
									<div class="form-group">
										<form:input type="hidden" path="id" value="${product.id}" />
										<form:label path="name">Name:</form:label>
										<form:input class="form-control form-control-user" path="name"
											placeholder="please enter Product Name"
											value="${productForm.name}" />
										<span><form:errors path="name" cssClass="error" /></span>
									</div>
									<div class="form-group">
										<form:label path="price">Price ($)</form:label>
										<form:input class="form-control form-control-user"
											placeholder="please enter Price" type="number" path="price"
											value="${productForm.price}" />
										<span><form:errors path="price" cssClass="error" /></span>
									</div>

									<div class="form-group">
										<form:label path="quantity">Quantity</form:label>
										<form:input class="form-control form-control-user"
											placeholder="please enter Quantity" type="number"
											path="quantity" />
									</div>


									<div class="form-group">
										<form:label path="type">TYPE:</form:label>
										<form:select path="type" items="${productTypes}"
											class="custom-select" />
									</div>
									<div class="form-group ">
										<form:label path="image">IMAGE:</form:label>
										<form:input type="file" path="image" />
									</div>
									<div class="form-group">
										<%-- <form:label path="category">CATEGORY:</form:label>
										<form:select path="category" class="custom-select"
											items="${Category}" /> --%>

									</div>
									<button type="submit" class="btn btn-success">UPDATE</button>
									<button type="reset" class="btn btn-primary">RESET</button>
								</form:form>

							</div>
						</div>
					</div>
				</div>
				<!-- End Form Elements -->
			</div>
		</div>
		<!-- /. ROW  -->
		<div class="row">
			<div class="col-md-12"></div>
		</div>
		<!-- /. ROW  -->
	</div>
	<!-- /. PAGE INNER  -->
</div>