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

<link rel="stylesheet" href="css/CustomerPortal.css"> 


<style>

</style>
<title>Client Form</title>
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
					
					<li class="nav-item px-2"><a href="/ClientSide/${Useremail}" class="nav-link ">Home</a></li>

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


	<!-- ACTIONS -->
	<section id="actions" class="py-4 ml-2 bg-light">

		<ul id="newUl">
			<li id="navbarbrand" class="bg-dark">
				<h4>Services</h4>
			</li>
			<br>
			<c:url var="sh" value="/document/${Useremail}" />
			<li id="newLi"><a href="/document/${Useremail}">Legal Documents</a></li>
			<c:url var="sh" value="/form/${Useremail}" />
			<li id="newLi"><a class="active" href="/form/${Useremail}">Legal Forms</a></li>
			<c:url var="sh" value="/uploadDoc/${Useremail}" />
			<li id="newLi"><a href="/uploadDoc/${Useremail}">Upload Documents</a></li>

		</ul>


	</section>

<!-- 
		<section id="actions" class="py-4 mb-4 bg-light">
		  	<div class="alert alert-success">
		  		<p>${requestMessage}</p>
			</div>
		</section>
	 -->
	<form action="/testSubmit/${Useremail}">


		<div class="container" id="newContainer">
			<div class="card-header" id="cardHeader">

				<h2>
					<i class="fas fa-file-alt"></i> Legal Forms 
					<input class="btn btn-info" type="submit" value="Submit" id="submit">
				</h2>
			</div>

			<div id="accordion">
				<div class="card" id="cardForm">
					
					<div class="card-header">
						<h5>
							  <a href="#collapse1"
								data-parent="#accordion" data-toggle="collapse"
								style="color: #000"> Divorce (simple/joint) </a>
						</h5>
					</div>
					<div id="collapse1" class="collapse">
						<div class="card-body">
							<table>
								<tr>
									<th>Form Name</th>

									<th>Price</th>
								</tr>
								<c:forEach begin="0" end="6" var="list" items="${listOfAllForms}">
								    <tr>
									    <td><input type="checkbox" name="legalForm"
											value="${list.docType}${list.formType}${list.price}">
										</td>
								    	
								    	<td>
								    		${list.formType}
								    	</td>
								    	<td>
								    		${list.price}
								    	</td>
								    	<td>
								    		<c:if test ="${list.sale == 'Yes'}">
								    			<img src="/img/Sale.png" alt="Sale" width="42" height="42">
								    		</c:if>
								    	</td>
								    </tr>
								    
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
		<br> <br> <input class="btn btn-info" type="submit"
			value="Submit" id="submit1"> <br> <br>
	</form>

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