<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<style>
body {
	margin: 0;
}

#newUl {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 20%;
	background-color: #f1f1f1;
	position: fixed;
	height: 100%;
	overflow: auto;
}

#newLi a {
	display: block;
	color: #000;
	padding: 8px 16px;
	text-decoration: none;
	text-align: center;
}

#newLi a.active {
	background-color: #4CAF50;
	color: white;
}

#newLi

 

a


:hover


:not

 

(
.active

 

)
{
background-color


:

 

#555


;
color


:

 

white


;
}
#navbarbrand {
	display: block;
	text-align: center;
	color: white;
	padding: 5px 16px;
	text-decoration: none;
}

#cardBody {
	margin-bottom: 80px;
	margin-top: 120px;
	margin-left: 80px;
}

.card-header {
	background-color: #555;
	color: white;
	width: 1240px;
	margin-top: 30px;
	margin-left: 20px;
	display: flex;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 70%;
	margin-top: 20px;
	margin-left: 30px;
	border-collapse: collapse;
}

th {
	color: white;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}

tr:hover {
	background-color: #ddd;
}

th {
	background-color: dimgrey;
}

.navbar-brand {
	font-size: xx-large;
	margin-right: 30px;
}

#navContainer {
	width: 2200px;
}

#submit {
	/*    padding-bottom: 50px;  */
	position: absolute;
	margin-left: 950px;
	margin-top: 5px;
}
}
</style>

</head>

<body>

	<div type="hidden" name="email" value="${Useremail}"></div>




	<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
		<div class="container" id="navContainer">
			<a href="#" class="navbar-brand"><i class="fas fa-balance-scale">
			</i> LegalFD</a>
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav">
					<c:url var="sh" value="/homePage" />
					<li class="nav-item px-2"><a href=${sh } class="nav-link ">Home</a></li>

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




	<div class="card-header">

		<h2>Payment</h2>

		<a href="<c:url value="/ClientSide/${Useremail}"/>"
			class="btn btn-light " id="submit"> <i class="fas fa-arrow-left"></i>
			Back To Dashboard
		</a>
	</div>

	<table>
		<tr>

			<th>Document Category</th>
			<th>Form Type</th>
			<th>Amount</th>
			<th>Delete Request</th>
		</tr>
		<c:forEach var="pay" items="${paymentData}">
			<tr>

				<td>${pay.documentType}</td>
				<td>${pay.formType}</td>
				<td>${pay.documentAmount}</td>

				<td><a
					href="<c:url value="/deletePayment/${Useremail}/${pay.id}"/>"
					class="btn btn-danger"> <i class="fas fa-trash"></i> Delete
						Order
				</a></td>

			</tr>
		</c:forEach>

	</table>


	<%-- <form action="/pay/${pay.id}/${Useremail}">

		<input type="radio" name="paymentMethod" value="PayPal" checked>
		Pay Pal <br> <input type="radio" name="paymentMethod"
			value="Debit"> Debit Card <br> <input type="radio"
			name="paymentMethod" value="Credit Card"> Credit Card <br>

		<input type="submit" value="Pay Amount"> <br>
	</form> --%>

	<div class="container py-5">

		<form action="/pay/${pay.id}/${Useremail}">

			<div class="row">
				<div class="col-lg-7 mx-auto">
					<div class="bg-white rounded-lg shadow-sm p-5">
						<!-- Credit card form tabs -->
						<ul role="tablist"
							class="nav bg-light nav-pills rounded-pill nav-fill mb-3">
							<li class="nav-item"><a data-toggle="pill"
								href="#nav-tab-card" class="nav-link active rounded-pill"> <i
									class="fa fa-credit-card"></i> Credit Card
							</a></li>
							<li class="nav-item"><a data-toggle="pill"
								href="#nav-tab-paypal" class="nav-link rounded-pill"> <i
									class="fa fa-paypal"></i> Paypal
							</a></li>

						</ul>
						<!-- End -->


						<!-- Credit card form content -->
						<div class="tab-content">

							<!-- credit card info-->
							<div id="nav-tab-card" class="tab-pane fade show active">

								<form role="form">
									<div class="form-group">
										<label for="username">Full name (on the card)</label> <input
											type="text" name="username" placeholder="Jason Doe" required
											class="form-control">
									</div>
									<div class="form-group">
										<label for="cardNumber">Card number</label>
										<div class="input-group">
											<input type="text" name="cardNumber"
												placeholder="Your card number" class="form-control" required>
											<div class="input-group-append">
												<span class="input-group-text text-muted"> <i
													class="fa fa-cc-visa mx-1"></i> <i
													class="fa fa-cc-amex mx-1"></i> <i
													class="fa fa-cc-mastercard mx-1"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-8">
											<div class="form-group">
												<label><span class="hidden-xs">Expiration</span></label>
												<div class="input-group">
													<input type="number" placeholder="MM" name=""
														class="form-control" required> <input
														type="number" placeholder="YY" name=""
														class="form-control" required>
												</div>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group mb-4">
												<label data-toggle="tooltip"
													title="Three-digits code on the back of your card">CVV
													<i class="fa fa-question-circle"></i>
												</label> <input type="text" required class="form-control">
											</div>
										</div>



									</div>
									<button type="button"
										class="subscribe btn btn-primary btn-block rounded-pill shadow-sm">
										Confirm</button>
								</form>
							</div>
							<!-- End -->

							<!-- Paypal info -->
							<div id="nav-tab-paypal" class="tab-pane fade">
								<p>Paypal is easiest way to pay online</p>
								<p>
									<button type="button" class="btn btn-primary rounded-pill">
										<i class="fa fa-paypal mr-2"></i> Log into my Paypal
									</button>
								</p>
								<p class="text-muted">Lorem ipsum dolor sit amet,
									consectetur adipisicing elit, sed do eiusmod tempor incididunt
									ut labore et dolore magna aliqua.</p>
							</div>
							<!-- End -->

							<!-- bank transfer info -->

							<!-- End -->
						</div>
						<!-- End -->

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