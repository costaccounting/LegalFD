<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">


<title>Payment Page</title>


</head>

<body>

	<div type="hidden" name="email" value="${Useremail}"></div>




	<nav class="navbar navbar-expand-xl navbar-dark bg-dark sticky-top">
		<div class="container" id="navContainer">
			<a href="#" class="navbar-brand "><span class="mb-0 h1"><i class="fas fa-balance-scale">
			</i> LegalFD</span></a>
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav">

					<li class="nav-item px-2"><a href="/ClientSide/${Useremail}"
						class="nav-link ">Home</a></li>

					<li class="nav-item px-2"><a href="#" class="nav-link">Notification</a>
					</li>
				</ul>

				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="/paymentPage/${Useremail}"
						class="nav-link "> <i class="fa fa-shopping-cart"></i> Cart
					</a></li>
					<li class="nav-item dropdown mr-3"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"> <i
							class="fas fa-user"></i> Welcome ${firstName}
					</a>
						<div class="dropdown-menu">
							<a href="/generalApplication/${Useremail}" class="dropdown-item">
								<i class="fas fa-user-circle"></i> Profile
							</a> <a href="#" class="dropdown-item"> <i class="fas fa-cog"></i>
								Settings
							</a>
						</div></li>

					<li class="nav-item"><c:url var="logoutUrl" value="/logout" />
						<a href="${logoutUrl}" class="nav-link "><i
							class="fa fa-power-off"></i> Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>

<br>

	<div class="card-header mx-5 p-3 text-light bg-primary">
	<div class="d-flex bd-highlight">

		<h2 class=" flex-grow-1 bd-highlight">Payment</h2>

		<a href="<c:url value="/dashboard/${Useremail}"/>"
			class="btn btn-light bd-highlight " id="submit"> <i class="fas fa-arrow-left"></i>
			Back To Dashboard
		</a>
		</div>
	</div>
	
	<br>
	
<div class="container">
	<table class="table table-striped">
		<c:set var="totalPrice" value="${0.0}" />
		<thead class="thead-dark">
		<tr>
		
			<th>Document Category</th>
			<th>Form Type</th>
			<th>Amount</th>
			<th>Remove Item</th>

			</tr>

		</thead>
		<tbody>

			<c:forEach var="pay" items="${paymentData}">
				<tr>

					<td>${pay.documentType}</td>
					<td>${pay.formType}</td>
					<td>${pay.documentAmount}</td>

					<td>
						<a href="/deletePayment/${Useremail}/${pay.id}" class="btn btn-secondary"> 
							<i class="fa fa-times-circle"></i>
						</a>
					</td>
					<c:set var="totalPrice" value="${totalPrice + pay.documentAmount}" />

				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td><b> Total Amount: </b></td>
				
				<td><b> <fmt:formatNumber type="number" maxFractionDigits="2" value="${totalPrice}"/> </b></td>
				<td></td>
			</tr>
		</tbody>
	</table>

</div>


	<div class="container py-5">

		<form action="/pay/${pay.id}/${Useremail}">

			<div class="row">
				<div class="col-lg-4" id="doing">
					<div class="bg-white rounded-lg shadow-sm p-5">
						<!-- Credit card form tabs -->

						<h3>Payment Methods</h3>
						<div id="icons">
							<i class="	fab fa-cc-paypal"></i> <i class="fab fa-cc-visa"></i>
							<i class="	fab fa-cc-mastercard"></i>
						</div>
						<!-- End -->


						<!-- Credit card form content -->
						<div class="tab-content">
							<input type="radio" name="pay" value="paypal"> <b>Paypal</b><br>
							<input type="radio" name="pay" value="debit"> <b>Debit
								Card</b><br> <input type="radio" name="pay" value="credit">
							<b>Credit Card</b>
							<!-- credit card info-->
							<div id="nav-tab-card" class="tab-pane fade show active">

								<form role="form">

									<br>

									<button type="button"
										class="subscribe btn btn-primary btn-block rounded-pill shadow-sm">
										Confirm</button>
								</form>
							</div>


						</div>


					</div>
				</div>
			</div>
		</form>
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>


	<script>
		// Get the current year for the copyright
		$('#year').text(new Date().getFullYear());
	</script>

</body>
</html>