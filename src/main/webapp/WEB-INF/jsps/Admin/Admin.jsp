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


<title>Admin Page</title>

</head>

<body>
<body>


	<div type="hidden" name="email" value="${Useremail}"></div>

	<nav class="navbar navbar-expand-lg navbar-dark sticky-top"
		style="background-color: black">
		<div class="container">
			<a href="#" class="navbar-brand"><span class="mb-0 h1"><i
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
							class="badge text-dark bg-light">${count} </span>
					</a>
						<div class="dropdown-menu">

							<c:forEach var="notification" items="${notiList}">
								 ${notification}
								<br>
							</c:forEach>

						</div></li>
				</ul>

				<ul class="navbar-nav ml-auto">

					<li class="nav-item dropdown mr-3"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"> <i
							class="fas fa-user"></i> Welcome ${firstName}
					</a>
						<div class="dropdown-menu">

							<a href="/settings/${Useremail}" class="dropdown-item"> <i
								class="fas fa-cog"></i> Settings
							</a>
						</div></li>

					<li class="nav-item"><c:url var="logoutUrl" value="/logout" />
						<a href="${logoutUrl}" class="nav-link "><i
							class="fa fa-power-off"></i> Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>



	<div class="container-fluid ">
		<div class="row min-vh-100">
			<aside class="col-12 col-md-2 p-0 bg-primary">
				<nav
					class="navbar navbar-expand navbar-dark bg-primary flex-md-column flex-row align-items-start py-2">

					<br> <a href="#" class="navbar-brand"><span
						class="pl-2 h2">Dashboard </span></a>
					<button class="navbar-toggler" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse">

						<ul
							class="flex-md-column flex-row navbar-nav w-100 justify-content-between ml-auto">
							<br>
							<li class="nav-item"><a class="nav-link pl-4 active"
								href="/dashboard/${Useremail}"> Manage Users</a></li>
							<li class="nav-item"><a class="nav-link pl-4"
								href="/caseRequest/${Useremail}">Client Requests</a></li>
							<li class="nav-item"><a class="nav-link pl-4"
								href="/editDocPrice/${Useremail}">Manage Price</a></li>

						</ul>

					</div>
				</nav>
			</aside>
			<main class="col bg-faded py-3" style="width: 80%">




			<div class="container mr-5 pt-3 pl-5">
				<div class="card-header text-light rounded "
					style="background-color: black" id="cardHeader">

					<h2>
						<i class="fas fa-users"></i> Manage User

					</h2>
				</div>

				<div id="accordion">

					<div class="card " id="cardForm">
						<div class="card-header">
							<div class="input-group">
								<input type="text" class="form-control" id="myInput"
									placeholder="Search Users..." onkeyup="myFunction()">


								<!-- <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name"> -->
							</div>
						</div>
					</div>

					<div class="card p-2 table-responsive" style="height: 570px"
						id="cardForm">

						<table class="table table-striped" id="myTable">
							<thead class="thead-dark">
								<tr>
									<th>Email</th>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Role</th>
									<th>Edit User</th>
									<th>Upload Document</th>
									<th>User Details</th>
									<th>Case Request</th>
									<th>Delete User</th>

								</tr>
							</thead>
							<tbody>

								<c:forEach var="Users" items="${allData}">
									<tr>
										<td>${Users.email}</td>
										<td>${Users.firstName}</td>
										<td>${Users.lastName}</td>
										<td>${Users.role}</td>

										<c:if test="${Users.role == 'Client'}">
											<td class="text-center"><a
												href="/edit/${Users.email}/${Useremail}"
												class="btn btn-outline-primary "> <i
													class="fas fa-pencil-alt"></i>
											</a></td>
											<td class="text-center"><a
												href="details/${Users.email}/${Useremail}"
												class="btn btn-outline-primary"> <i class="fa fa-upload"></i>

											</a></td>
											<td class="text-center"><a
												href="/application/${Users.email}/${Useremail}"
												class="btn btn-outline-primary"> <i
													class="fa fa-th-list"></i>

											</a></td>
											<td class="text-center"><a
												href="/customerRequest/${Users.email}/${Useremail}"
												class="btn btn-outline-primary"> <i class="fas fa-bars"></i>
											</a></td>
										</c:if>
										<c:if
											test="${Users.role == 'Lawyer' || Users.role == 'Admin'}">
											<td class="text-center"><a
												href="/edit/${Users.email}/${Useremail}"
												class="btn btn-outline-primary "> <i
													class="fas fa-pencil-alt"></i>
											</a></td>

											<td class="text-center"><a
												href="details/${Users.email}/${Useremail}"
												class="btn btn-outline-dark disabled"> <i
													class="fa fa-upload"></i>

											</a></td>
											<td class="text-center"><a
												href="/application/${Users.email}/${Useremail}"
												class="btn btn-outline-dark disabled"> <i
													class="fa fa-th-list"></i>

											</a></td>
											<td class="text-center"><a
												href="/customerRequest/${Users.email}/${Useremail}"
												class="btn btn-outline-dark disabled"> <i
													class="fas fa-bars"></i>
											</a></td>

										</c:if>

										<td class="text-center"><a
											href="/deleteAdmin/${Users.email}/${Useremail}"
											class="btn btn-outline-primary"> <i class="fas fa-trash"></i>
										</a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		</main>









		<script>
			function myFunction() {
				var input, filter, table, tr, td, i, txtValue;
				input = document.getElementById("myInput");
				filter = input.value.toUpperCase();
				table = document.getElementById("myTable");
				tr = table.getElementsByTagName("tr");
				for (i = 0; i < tr.length; i++) {
					td = tr[i].getElementsByTagName("td")[0];
					if (td) {
						txtValue = td.textContent || td.innerText;
						if (txtValue.toUpperCase().indexOf(filter) > -1) {
							tr[i].style.display = "";
						} else {
							tr[i].style.display = "none";
						}
					}
				}
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
		<script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>
</body>
</html>