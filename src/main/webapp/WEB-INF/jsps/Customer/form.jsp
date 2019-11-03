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

<title>Client Form</title>
</head>
<body>

<style>

body {
	margin: 0;
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
	height: 70%;
	opacity: 0.8;
	border-radius: 15px;
	
}

#cardHeader {
	background-color: #555;
	color: white;
	width: 100%;
}

#card2 {
	margin-left: 180px;
	margin-top: 120px;
}

#cardForm {
	/* margin-top: 70px; */
	
}
#submit {
	/*    padding-bottom: 50px;  */
	position: absolute;
	margin-left: 550px;
}

#submit1 {
	margin-left: 300px;
}

.navbar-brand {
	font-size: xx-large;
	margin-right: 30px;
}

#navContainer {
	width: 2200px;
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


#navbarbrand {
	display: block;
	text-align: center;
	color: white;
	padding: 5px 16px;
	text-decoration: none;
	font-size: xx-large;
}

#newLi a.active {
	background-color: #555;
	color: white;
}
#newLi a:hover:not(.active) {
background-color:#555;
color:white;
}


</style>

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
							</a> <a href="Settings.jsp" class="dropdown-item"> <i class="fas fa-cog"></i>
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
			
			<li id="newLi"><a href="/document/${Useremail}">Legal Documents</a></li>
			
			<li id="newLi"><a class="active" href="/form/${Useremail}">Legal Forms</a></li>
			
			<li id="newLi"><a href="/uploadDoc/${Useremail}">Upload Documents</a></li>

		</ul>
	</section>


	<form action="/legalDocumentFormMulti/${Useremail}">


		<div class="container" id="newContainer">
			<div class="card-header" id="cardHeader">

				<h2>
					<i class="fas fa-file-alt"></i> Legal Forms <input
						class="btn btn-info" type="submit" value="Submit" id="submit">
				</h2>
			</div>
			
			<div id="accordion">
			
			<!--************** One Segment  1 ......................... -->
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
									<th> </th>
									<th>Form Name</th>
									<th>Price</th>
								</tr>
								<c:forEach begin="0" end="6" var="list" items="${listOfAllForms}">
								    <tr>
									    <td><input type="checkbox" name="legalForm"
											value="${list.docType}^${list.formType}^${list.price}">
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
				<!--************** One Segment  1......................... -->
				
				<!--************** One Segment  2......................... -->
				<div class="card" id="cardForm">
					<div class="card-header">
						<h5>
							  <a href="#collapse2"
								data-parent="#accordion" data-toggle="collapse"
								style="color: #000"> Divorce Application </a>
						</h5>
					</div>
					<div id="collapse2" class="collapse">
						<div class="card-body">
							<table>
								<tr>
									<th> </th>
									<th>Form Name</th>
									<th>Price</th>
								</tr>
								<c:forEach begin="7" end="20" var="list" items="${listOfAllForms}">
								    <tr>
									    <td><input type="checkbox" name="legalForm"
											value="${list.docType}^${list.formType}^${list.price}">
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
				<!--************** One Segment  2......................... -->
				
				
				<!--************** One Segment  3......................... -->
				<div class="card" id="cardForm">
					<div class="card-header">
						<h5>
							  <a href="#collapse3"
								data-parent="#accordion" data-toggle="collapse"
								style="color: #000"> Application (General) </a>
						</h5>
					</div>
					<div id="collapse3" class="collapse">
						<div class="card-body">
							<table>
								<tr>
									<th> </th>
									<th>Form Name</th>
									<th>Price</th>
								</tr>
								<c:forEach begin="21" end="31" var="list" items="${listOfAllForms}">
								    <tr>
									    <td><input type="checkbox" name="legalForm"
											value="${list.docType}^${list.formType}^${list.price}">
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
				<!--************** One Segment  3......................... -->
				
				
				<!--************** One Segment  4......................... -->
				<div class="card" id="cardForm">
					<div class="card-header">
						<h5>
							  <a href="#collapse4"
								data-parent="#accordion" data-toggle="collapse"
								style="color: #000"> Motion to Change </a>
						</h5>
					</div>
					<div id="collapse4" class="collapse">
						<div class="card-body">
							<table>
								<tr>
									<th> </th>
									<th>Form Name</th>
									<th>Price</th>
								</tr>
								<c:forEach begin="32" end="39" var="list" items="${listOfAllForms}">
								    <tr>
									    <td><input type="checkbox" name="legalForm"
											value="${list.docType}^${list.formType}^${list.price}">
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
				<!--************** One Segment  4......................... -->
				
				
				<!--************** One Segment  5......................... -->
				<div class="card" id="cardForm">
					<div class="card-header">
						<h5>
							  <a href="#collapse5"
								data-parent="#accordion" data-toggle="collapse"
								style="color: #000"> Notice of Motion (Regular and/or Contempt) </a>
						</h5>
					</div>
					<div id="collapse5" class="collapse">
						<div class="card-body">
							<table>
								<tr>
									<th> </th>
									<th>Form Name</th>
									<th>Price</th>
								</tr>
								<c:forEach begin="40" end="47" var="list" items="${listOfAllForms}">
								    <tr>
									    <td><input type="checkbox" name="legalForm"
											value="${list.docType}^${list.formType}^${list.price}">
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
				<!--************** One Segment  5......................... -->
				
				<!--************** One Segment  6......................... -->
				<div class="card" id="cardForm">
					<div class="card-header">
						<h5>
							  <a href="#collapse6"
								data-parent="#accordion" data-toggle="collapse"
								style="color: #000"> Conferences </a>
						</h5>
					</div>
					<div id="collapse6" class="collapse">
						<div class="card-body">
							<table>
								<tr>
									<th> </th>
									<th>Form Name</th>
									<th>Price</th>
								</tr>
								<c:forEach begin="48" end="54" var="list" items="${listOfAllForms}">
								    <tr>
									    <td><input type="checkbox" name="legalForm"
											value="${list.docType}^${list.formType}^${list.price}">
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
				<!--************** One Segment  6......................... -->
				
				<!--************** One Segment  7......................... -->
				<div class="card" id="cardForm">
					<div class="card-header">
						<h5>
							  <a href="#collapse7"
								data-parent="#accordion" data-toggle="collapse"
								style="color: #000"> Enforcement </a>
						</h5>
					</div>
					<div id="collapse7" class="collapse">
						<div class="card-body">
							<table>
								<tr>
									<th> </th>
									<th>Form Name</th>
									<th>Price</th>
								</tr>
								<c:forEach begin="55" end="71" var="list" items="${listOfAllForms}">
								    <tr>
									    <td><input type="checkbox" name="legalForm"
											value="${list.docType}^${list.formType}^${list.price}">
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
				<!--************** One Segment  7......................... -->
				
				<!--************** One Segment  8......................... -->
				<div class="card" id="cardForm">
					<div class="card-header">
						<h5>
							  <a href="#collapse8"
								data-parent="#accordion" data-toggle="collapse"
								style="color: #000"> Child and Youth Family Services Act </a>
						</h5>
					</div>
					<div id="collapse8" class="collapse">
						<div class="card-body">
							<table>
								<tr>
									<th> </th>
									<th>Form Name</th>
									<th>Price</th>
								</tr>
								<c:forEach begin="72" end="80" var="list" items="${listOfAllForms}">
								    <tr>
									    <td><input type="checkbox" name="legalForm"
											value="${list.docType}^${list.formType}^${list.price}">
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
				<!--************** One Segment  8......................... -->
				
				<!--************** One Segment  9......................... -->
				<div class="card" id="cardForm">
					<div class="card-header">
						<h5>
							  <a href="#collapse9"
								data-parent="#accordion" data-toggle="collapse"
								style="color: #000"> Inter-jurisdictional Support Orders </a>
						</h5>
					</div>
					<div id="collapse9" class="collapse">
						<div class="card-body">
							<table>
								<tr>
									<th> </th>
									<th>Form Name</th>
									<th>Price</th>
								</tr>
								<c:forEach begin="81" end="95" var="list" items="${listOfAllForms}">
								    <tr>
									    <td><input type="checkbox" name="legalForm"
											value="${list.docType}^${list.formType}^${list.price}">
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
				<!--************** One Segment  9......................... -->
				
				<!--************** One Segment  10......................... -->
				<div class="card" id="cardForm">
					<div class="card-header">
						<h5>
							  <a href="#collapse10"
								data-parent="#accordion" data-toggle="collapse"
								style="color: #000"> Adoption </a>
						</h5>
					</div>
					<div id="collapse10" class="collapse">
						<div class="card-body">
							<table>
								<tr>
									<th> </th>
									<th>Form Name</th>
									<th>Price</th>
								</tr>
								<c:forEach begin="96" end="114" var="list" items="${listOfAllForms}">
								    <tr>
									    <td><input type="checkbox" name="legalForm"
											value="${list.docType}^${list.formType}^${list.price}">
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
				<!--************** One Segment  10......................... -->
				
				<!--************** One Segment  11......................... -->
				<div class="card" id="cardForm">
					<div class="card-header">
						<h5>
							  <a href="#collapse11"
								data-parent="#accordion" data-toggle="collapse"
								style="color: #000"> Miscellaneous Forms </a>
						</h5>
					</div>
					<div id="collapse11" class="collapse">
						<div class="card-body">
							<table>
								<tr>
									<th> </th>
									<th>Form Name</th>
									<th>Price</th>
								</tr>
								<c:forEach begin="115" end="152" var="list" items="${listOfAllForms}">
								    <tr>
									    <td><input type="checkbox" name="legalForm"
											value="${list.docType}^${list.formType}^${list.price}">
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
				<!--************** One Segment  11......................... -->
			
			
			<!-- accordion Div closes here -->	
			</div>
			

		</div>
		<br> <br> <input class="btn btn-info" type="submit"
			value="Submit" id="submit1"> <br> <br>
	</form>

	<button class="open-button" onclick="openForm()">Contact</button>

	<div class="chat-popup" id="myForm">
		<form class="form-container" action="mailto:shahriya199907@gmail.com" method="post" enctype="text/plain">
			<h1>Contact</h1>

			<label for="msg"><b>Message</b></label>
			<textarea placeholder="Type message.." name=${Useremail } required></textarea>

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