<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link rel="stylesheet" href="css/chat.css">
<title>Client Document</title>
<style>
body {
    box-sizing: border-box;
}
/* Button used to open the chat form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 280px;
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
  margin-bottom:10px;
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
	background-color: #555;
	color: white;
}

#newLi a:hover  {
	background-color: #555;
	color: white;
}

#navbarbrand {
	display: block;
	text-align: center;
	color: white;
	padding: 5px 16px;
	text-decoration: none;
}

.navbar {
	/* background-color: darkslategray; */
	/* background-color:darkslateblue; */
	/* background-color: dodgerblue; */
	background-color: mediumslateblue;
}

#cardBody {
	margin-bottom: 80px;
	margin-top: 120px;
	margin-left: 80px;
}

#newContainer {
	background-color: lightgray;
	padding: 1px;
	margin-left: 300px;
	width: 70%;
	position: fixed;
	height: 70%;
	opacity: 0.8;
	border-radius: 15px;
}

.card-header {
	background-color: #555;
	color: white;
	position: fixed;
	width: 70%;
}

#card2 {
	margin-left: 180px;
	margin-top: 120px;
}
</style>
</head>

<body>

	
		<div type="hidden" name="email" value="${Useremail}" ></div>
		<div type="hidden" name="password" value="${UserPassword}" ></div>
	

	<button class="open-button" onclick="openForm()">Chat</button>

	<div class="chat-popup" id="myForm">
		<form class="form-container">
			<h1>Chat</h1>

			<label for="msg"><b>Message</b></label>
			<textarea placeholder="Type message.." name="msg" required></textarea>

			<button type="submit" class="btn">Send</button>
			<button type="button" class="btn cancel" onclick="closeForm()">Close</button>
		</form>
	</div>

	<script>
		function openForm() {
			document.getElementById("myForm").style.display = "block";
		}

		function closeForm() {
			document.getElementById("myForm").style.display = "none";
		}
	</script>
	<nav class="navbar navbar-expand-lg navbar-dark  ">
		<div class="container">
			<a href="clientService.html" class="navbar-brand"><i
				class="fas fa-balance-scale"> </i> LegalFD</a>
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav">
					<li class="nav-item px-2"><a href="clientService.html"
						class="nav-link active">Home</a></li>

					<li class="nav-item px-2"><a href="#" class="nav-link">Notification</a>
					</li>
				</ul>

				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown mr-3"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"> <i
							class="fas fa-user"></i> Welcome ${firstName}
					</a>
						<div class="dropdown-menu">
							<a href="profile.html" class="dropdown-item"> <i
								class="fas fa-user-circle"></i> Profile
							</a> <a href="settings.html" class="dropdown-item"> <i
								class="fas fa-cog"></i> Settings
							</a>
						</div></li>
					<li class="nav-item">
			        <c:url var="logoutUrl" value="/logout"/>
					 <a href= "${logoutUrl}" class="nav-link active">Log Out</a>
				  	</li>
				</ul>
			</div>
		</div>
	</nav>





	<!-- HEADER -->
	<!-- <header id="main-header" class="py-2 bg-primary text-white">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>
                        <i class="fas fa-balance-scale"></i> Services</h1>
                </div>
            </div>
        </div>
    </header> -->








	<!-- ACTIONS -->
	<section id="actions" class="py-4 ml-2 bg-light">

		<ul id="newUl">
			<li id="navbarbrand" class="bg-dark">
				<h4>Services</h4>
			</li>
			<br>
			<c:url var="sh" value="/documents" />
			<li id="newLi"><a href=${sh }>Legal Documents</a></li>
			<c:url var="sh" value="/forms" />
			<li id="newLi"><a href=${sh }>Legal Forms</a></li>
			<c:url var="sh" value="/uploadDoc" />
			<li id="newLi"><a href=${sh }>Upload Documents</a></li>

		</ul>


	</section>

	<!-- ACTIONS -->

	<!-- <div class="col">
       
            <div class="card text-center bg-success text-white mb-3">
                <div class="card-body">
                    <h3>Legal Documents</h3>
                    <h4 class="display-4">
                        <i class="fas fa-folder"></i> 
                    </h4>
                    <a href="document.html" class="btn btn-outline-light btn-sm">Request</a>
                </div>
            </div>

            <div class="card text-center bg-warning text-white mb-3">
                <div class="card-body">
                    <h3>Legal Forms</h3>
                    <h4 class="display-4">
                        <i class="fas fa-file-alt"></i> 
                    </h4>
                    <a href="form.html" class="btn btn-outline-light btn-sm">Request</a>
                </div>
            </div>
        
    </div>
    </div> -->

	<div class="container" id="newContainer">
		<div class="card-header">

			<h2>
				<i class="fas fa-folder"></i> Legal Document
			</h2>
		</div>
		<div class="card-columns">
			<div class="card" id="cardBody" style="width: 20rem;">
				<div class="card-body">
					<h4 class="card-title">Book of Authority</h4>
					<h6 class="card-subtitle text-muted">Card subtitle</h6>
					<p class="card-text">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Illo, quas.</p>
					<c:url var="MainPage"
						value="/MainPage/${Useremail}/${UserPassword}" />
					<a class="btn btn-outline-info" href="${MainPage}">Request</a>
				</div>
			</div>
			<div class="card" id="card2" style="width: 20rem;">
				<div class="card-body">
					<h4 class="card-title">Factum</h4>
					<h6 class="card-subtitle text-muted">Card subtitle</h6>
					<p class="card-text">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Illo, quas.</p>
					<c:url var="MainPage"
						value="/MainPage/${Useremail}/${UserPassword}" />
					<a class="btn btn-outline-info" href="${MainPage}">Request</a>
				</div>
			</div>
		</div>
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
	<script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>

</body>
</html>