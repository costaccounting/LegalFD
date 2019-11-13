<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

/* Button used to open the chat form - fixed at the bottom of the page */
.open-button {
	background-color: #555;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	position: sticky;
	bottom: 23px;
	right: 28px;
	border-radius: 50%;
}

/* The popup chat - hidden by default */
.chat-popup {
	display: none;
	position: fixed;
	bottom: 0;
	right: 15px;
	border: 3px solid #f1f1f1;
	z-index: 9;
}

/* Add styles to the form container */
.form-container {
	max-width: 300px;
	padding: 10px;
	background-color: white;
}

/* Full-width textarea */
.form-container textarea {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	border: none;
	background: #f1f1f1;
	resize: none;
	min-height: 200px;
}

/* When the textarea gets focus, do something */
.form-container textarea:focus {
	background-color: #ddd;
	outline: none;
}

/* Set a style for the submit/send button */
.form-container .btn {
	background-color: #4CAF50;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	width: 100%;
	margin-bottom: 10px;
	opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
	background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
	opacity: 1;
}
</style>

</head>


<body>

<div class="chat-popup " id="myForm">



		<form action="mailto:shahriya?body='This is only a test!'"
			method="GET" class="form-container" >
			<h1>Chat</h1>
			<div class="form-group">
				<label for="name">About:</label> <input name="subject" type="text"
					class="form-control" />
			</div>
			<div class="form-group">
				<label for="name">Description:</label>
				<textarea name="body" class="form-control" rows=5></textarea>
			</div>



			<input class="btn btn-primary btn-block" type="submit" value="Send">
			<button type="button" class="btn cancel" onclick="closeForm()">Close</button>
		</form>
	</div>
	<div type="hidden" name="email" value="${Useremail}"></div>




	<nav class="navbar navbar-expand-xl navbar-dark sticky-top"
		style="background-color: black">
		<div class="container" id="navContainer">
			<a href="#" class="navbar-brand "><span class="mb-0 h1"><i
					class="fas fa-balance-scale"> </i> LegalFD</span></a>
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav">

					<li class="nav-item px-2"><a href="/dashboard/${Useremail}"
						class="nav-link active">Home</a></li>

					<li class="nav-item px-2 dropdown mr-3"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"> <span
							class="notification">Notification</span> <span
							class="badge text-dark bg-light">${countClient}</span>
					</a>
						<div class="dropdown-menu p-3">
							<c:set var="count_noti" value="${fn:length(clientList)}" />

							<c:forEach var="i" begin="1" end="${count_noti}" step="1">
								${notiList[count_noti-i]}
								<div class="float-right">
									<a href="/deleteNotification/${i}/${Useremail}"> <i
										class="fa fa-times-circle"></i>
									</a>
								</div>
								<div class="dropdown-divider"></div>
							</c:forEach>
						</div></li>
				</ul>

				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="/paymentPage/${Useremail}"
						class="nav-link active"> <i class="fa fa-shopping-cart"></i>
							Cart
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
				class="btn btn-light bd-highlight " id="submit"> <i
				class="fas fa-arrow-left"></i> Back To Dashboard
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

						<td><a href="/deletePayment/${Useremail}/${pay.id}"
							class="btn btn-secondary"> <i class="fa fa-times-circle"></i>
						</a></td>
						<c:set var="totalPrice" value="${totalPrice + pay.documentAmount}" />

					</tr>
				</c:forEach>
				<tr>
					<td></td>
					<td><b> Total Amount: </b></td>

					<td><b> $CAD <fmt:formatNumber type="number"
								maxFractionDigits="2" minIntegerDigits="2" minFractionDigits="2"
								value="${totalPrice}" />
					</b></td>
					<td></td>
				</tr>
			</tbody>
		</table>

	</div>


	<div class="container py-5">

		<form action="/pay/${Useremail}/${totalPrice}" role="form">

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
							<input type="radio" name="pay" value="debit"> <b>DebitCard</b><br>
							<input type="radio" name="pay" value="credit" checked> <b>Credit
								Card</b>
							<!-- credit card info-->
							<div id="nav-tab-card" class="tab-pane fade show active">
								<br> <input type="submit"
									class="subscribe btn btn-primary btn-block rounded-pill shadow-sm"
									value="Confirm">

							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<button class="open-button float-right bg-primary" onclick="openForm()">
		<i class="fas fa-envelope"></i>
	</button>
	

	<script>
		function openForm() {
			document.getElementById("myForm").style.display = "block";
		}

		function closeForm() {
			document.getElementById("myForm").style.display = "none";
		}
	</script>
	
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




</body>
</html>