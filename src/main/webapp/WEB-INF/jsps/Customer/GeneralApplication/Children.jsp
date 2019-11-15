<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


<title>Children</title>
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
	<div class="chat-popup " id="myForm" >



		<form action="mailto:shahriya@gmail.com"
			method="GET" class="form-container mb-3" style="width: 400px">
			<h1 class="float-left">Email Us
			
			
			</h1>
			<div class="float-right">
			<a onclick="closeForm()"><i
										class="fa fa-times-circle"></i></a>
			</div>
			
			<div class="form-group">
				 <input name="subject" type="text" value="Case Query: ${Useremail }" hidden
					class="form-control" />
			</div>
			<div class="form-group float-left"><br>
				<label for="name">Description:</label>
				<textarea name="body" class="form-control" rows=5></textarea>
			</div>



			<input class="btn btn-primary btn-block" type="submit" value="Send">
			
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
						class="nav-link ">Home</a></li>

					<li class="nav-item px-2 dropdown mr-3"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"> <span
							class="notification">Notification</span> <span
							class="badge text-dark bg-light">${countClient}</span>
					</a>
						<div class="dropdown-menu p-3" style=" width: 350px">
							<c:set var="count_noti" value="${fn:length(clientList)}" />

							<c:forEach var="i" begin="1" end="${count_noti}" step="1">
								${clientList[count_noti-i]}
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
						class="nav-link "> <i class="fa fa-shopping-cart"></i> Cart
					</a></li>
					<li class="nav-item dropdown mr-3"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"> <i
							class="fas fa-user"></i> Welcome ${firstName}
					</a>
						<div class="dropdown-menu">
							<a href="/generalApplication/${Useremail}" class="dropdown-item">
								<i class="fas fa-user-circle"></i> Profile
							</a>
							<a href="/settings/${Useremail}" class="dropdown-item"> <i
								class="fas fa-cog"></i> Settings
							</a>
							<a href="/customerRequest/${Useremail}/${Useremail}"
								class="dropdown-item"> <i class="	fas fa-sticky-note"></i>
								Your Request
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

	<div class="card-header mx-5 p-3 text-light"
		style="background-color: black">


		<h2>
			<i class="fas fa-file-alt"></i> General Application Information Form
			<div class="float-right">
				<a href="/dashboard/${Useremail}" class="btn btn-primary "
					id="submit"> <i class="fas fa-arrow-left"></i> Back To
					Dashboard
				</a>
			</div>
		</h2>


	</div>

	<br>



	<div class="container">

		<div class="progress">
			<div
				class="progress-bar bg-primary progress-bar-striped progress-bar-animated"
				style="width: 83.34%;">80%</div>
		</div>
		<br>
		<h3>Children Information</h3>
		<br>



		<form:form action="/children/${Useremail}" method="post" modelAttribute="children">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>Name</th>
						<th>Date Of Birth</th>
						<th>Living With</th>
						<th>Grade</th>
						<th>School</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<form:hidden path="userEmail" value="${Useremail}" />
					</tr>
					<tr>
						<th><form:input type="text" class="form-control mb-2 "
								path="childName1" /></th>
						<th><form:input type="date" class="form-control mb-2 "
								path="dobChild1" /></th>
						<th><form:input type="text" class="form-control mb-2 "
								path="livingChild1" /></th>
						<th><form:input type="text" class="form-control mb-2 "
								path="gradeChild1" /></th>
						<th><form:input type="text" class="form-control mb-2 "
								path="schoolChild1" /></th>

					</tr>
					<tr>
						<th><form:input type="text" class="form-control mb-2 "
								path="childName2" /></th>
						<th><form:input type="date" class="form-control mb-2 "
								path="dobChild2" /></th>
						<th><form:input type="text" class="form-control mb-2 "
								path="livingChild2" /></th>
						<th><form:input type="text" class="form-control mb-2 "
								path="gradeChild2" /></th>
						<th><form:input type="text" class="form-control mb-2 "
								path="schoolChild2" /></th>

					</tr>
					<tr>
						<th><form:input type="text" class="form-control mb-2 "
								path="childName3" /></th>
						<th><form:input type="date" class="form-control mb-2 "
								path="dobChild3" /></th>
						<th><form:input type="text" class="form-control mb-2 "
								path="livingChild3" /></th>
						<th><form:input type="text" class="form-control mb-2 "
								path="gradeChild3" /></th>
						<th><form:input type="text" class="form-control mb-2 "
								path="schoolChild3" /></th>

					</tr>
					<tr>
						<th><form:input type="text" class="form-control mb-2 "
								path="childName4" /></th>
						<th><form:input type="date" class="form-control mb-2 "
								path="dobChild4" /></th>
						<th><form:input type="text" class="form-control mb-2 "
								path="livingChild4" /></th>
						<th><form:input type="text" class="form-control mb-2 "
								path="gradeChild4" /></th>
						<th><form:input type="text" class="form-control mb-2 "
								path="schoolChild4" /></th>

					</tr>
				</tbody>
			</table>

			</div>
			<input type="submit" class="btn btn-primary" value="Save" />

		</form:form>


		<br> <br>

		<nav>
			<ul class="pagination justify-content-center">
				<li class="page-item "><a class="page-link"
					href="/navmatrimonialHome/${Useremail}"> <span>&laquo;</span> <span
						class="sr-only">Previous</span>
				</a></li>
				<li class="page-item "><a class="page-link"
					href="/navclientInfo/${Useremail}" data-toggle="tooltip"
					data-placement="top" title="Client Information">1</a></li>
				<li class="page-item "><a class="page-link"
					href="/navspouseInfo/${Useremail}" data-toggle="tooltip"
					data-placement="top" title="Spouse Information">2</a></li>
				<li class="page-item "><a class="page-link"
					href="/navmaritalInfo/${Useremail}" data-toggle="tooltip"
					data-placement="top" title="Marital Information">3</a></li>
				<li class="page-item "><a class="page-link"
					href="/navmatrimonialHome/${Useremail}" data-toggle="tooltip"
					data-placement="top" title="Matrimonial Information">4</a></li>
				<li class="page-item active"><a class="page-link"
					href="/navchildren/${Useremail}" data-toggle="tooltip"
					data-placement="top" title="Children Information">5</a></li>
				<li class="page-item"><a class="page-link"
					href="/navchildExpense/${Useremail}" data-toggle="tooltip"
					data-placement="top" title="Child Expenses">6</a></li>
				<li class="page-item"><a class="page-link"
					href="/navchildExpense/${Useremail}"> <span>&raquo;</span> <span
						class="sr-only">Next</span>
				</a></li>
			</ul>
		</nav>
		<button class="open-button float-right bg-primary"
			onclick="openForm()">
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


		<script>
			$('[data-toggle="tooltip"]').tooltip();
		</script>
</body>
</html>