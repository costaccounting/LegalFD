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


<title>Children</title>
</head>



<body>

	<div type="hidden" name="email" value="${Useremail}"></div>




	<nav class="navbar navbar-expand-xl navbar-dark sticky-top" style="background-color: black">
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

	<div class="card-header mx-5 p-3 text-light" style="background-color: black">
		

			<h2 >
				<i class="fas fa-file-alt"></i> General Application Information Form
				<div class="float-right">
				<a href="/dashboard/${Useremail}" class="btn btn-primary "
					id="submit"> <i class="fas fa-arrow-left"></i> Back To Dashboard
				</a>
			</div>
			</h2>

		
	</div>

	<br>



	<div class="container">

		<!-- <div class="progress">
			<div class="progress-bar bg-dark" style="width: 83.34%;"></div>
		</div> -->
<div class="progress">
            <div class="progress-bar bg-primary progress-bar-striped progress-bar-animated" style="width:83.34%;">80%</div>
        </div>
		<br>
		<h3>Children Information</h3>
		<br>
		<form:form action="/children/${Useremail}" method="get"
			modelAttribute="children">
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

		
	<br>
	<br>

	<nav>
		<ul class="pagination justify-content-center">
			<li class="page-item "><a class="page-link"
				href="/navmatrimonialHome/${Useremail}"> <span>&laquo;</span> <span
					class="sr-only">Previous</span>
			</a></li>
			<li class="page-item "><a class="page-link"
				href="/navclientInfo/${Useremail}" data-toggle="tooltip" data-placement="top" title="Client Information">1</a></li>
			<li class="page-item "><a class="page-link"
				href="/navspouseInfo/${Useremail}" data-toggle="tooltip" data-placement="top" title="Spouse Information">2</a></li>
			<li class="page-item "><a class="page-link"
				href="/navmaritalInfo/${Useremail}" data-toggle="tooltip" data-placement="top" title="Marital Information">3</a></li>
			<li class="page-item "><a class="page-link"
				href="/navmatrimonialHome/${Useremail}" data-toggle="tooltip" data-placement="top" title="Matrimonial Information">4</a></li>
			<li class="page-item active"><a class="page-link"
				href="/navchildren/${Useremail}" data-toggle="tooltip" data-placement="top" title="Children Information">5</a></li>
			<li class="page-item"><a class="page-link"
				href="/navchildExpense/${Useremail}" data-toggle="tooltip" data-placement="top" title="Child Expenses">6</a></li>
			<li class="page-item"><a class="page-link"
				href="/navchildExpense/${Useremail}"> <span>&raquo;</span> <span
					class="sr-only">Next</span>
			</a></li>
		</ul>
	</nav>



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