<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>

<head>
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
<link rel="stylesheet" href="css/style.css">
<title>Main Page - Legal FD</title>

</head>


<body>
	<nav class="navbar navbar-expand-sm navbar-dark fixed-top"
		id="main-nav" style="background-color: black;">
		<div class="container">


			<a href="#" class="navbar-brand"><span class="mb-0 h1">
				<i class="fas fa-balance-scale"> </i> LegalFD</span>
				</a>

			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>


			<div class="collapse navbar-collapse" id="navbarCollapse">

				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><c:url var="url" value="/register"></c:url>
						<a href="${url}" class="nav-link">Sign Up</a></li>
					<li class="nav-item"><a href="/about" class="nav-link">About</a>
					</li>

				</ul>
			</div>
		</div>
	</nav>



	<header id="home-section">
		<div class="dark-overlay">
			<div class="home-inner container">
				<div class="row">
					<div class="col-lg-8 d-none d-lg-block">
						<h1 class="display-4">
							<strong></strong> <strong></strong>
						</h1>
						<!-- <div class="d-flex">
							<div class="p-4 align-self-start">
								<i class="fas fa-check fa-2x"></i>
							</div>
							<div class="p-4 align-self-end">Lorem ipsum dolor sit, amet
								consectetur adipisicing elit. Sed, tempore iusto in minima
								facere dolorem!</div>
						</div>

						<div class="d-flex">
							<div class="p-4 align-self-start">
								<i class="fas fa-check fa-2x"></i>
							</div>
							<div class="p-4 align-self-end">Lorem ipsum dolor sit, amet
								consectetur adipisicing elit. Sed, tempore iusto in minima
								facere dolorem!</div>
						</div>

						<div class="d-flex">
							<div class="p-4 align-self-start">
								<i class="fas fa-check fa-2x"></i>
							</div>
							<div class="p-4 align-self-end">Lorem ipsum dolor sit, amet
								consectetur adipisicing elit. Sed, tempore iusto in minima
								facere dolorem!</div>
						</div>
						 -->
					</div>

					<div class="col-lg-4">
						<div class="card bg-primary text-center card-form">
							<div class="card-body">
								<h3>Sign In</h3>
								<br>
								<form action="/login" method="post">
								

									<div class="form-group">
										<input type="email" name="email" placeholder="Email"
											class="form-control form-control-lg" placeholder="Email">
									</div>
									<div class="form-group">
										<input type="password" name="password" placeholder="Password"
											class="form-control form-control-lg" placeholder="Password">
									</div>

									<input type="submit" value="Sign In"
										class="btn btn-outline-light btn-block"> <br>
									<br>

									<p align="center" style="font-size: 1.5em;">${loginMess}</p>
									<p align="center" style="color: green; font-size: 1.5em;">${logOutMess}</p>

									<p align="center" style="font-size: 1.5em;">${message}</p>
									
									
									<br>
									<br>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>




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