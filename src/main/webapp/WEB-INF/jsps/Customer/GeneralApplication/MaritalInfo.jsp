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
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="/css/CustomerPortal.css"> 
  
<title>Marital Info</title>
</head>

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

.card-header {
	background-color: #555;
	color: white;
	width: 1240px;
	margin-top: 30px;
	margin-left: 20px;
	display: flex;
}
#submit {
	/*    padding-bottom: 50px;  */
	position: absolute;
	margin-left: 950px;
	margin-top: 15px;
}
</style>

<body>
<div type="hidden" name ="email" value="${Useremail}"></div>

	
	
	
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
		
	<div class="card-header">

			<h2>
				<i class="fas fa-file-alt"></i> General Information Application Form
			</h2>

		<a href="<c:url value="/ClientSide/${Useremail}"/>" class="btn btn-light" id="submit">
            <i class="fas fa-arrow-left"></i> Back To Dashboard
         </a>
	</div>
  	
<br>
<br>
<br>
  		<div class="col">
	       	<section id="actions" class="py-4 mb-4 bg-light">
			  	<div class="alert alert-success">
			  		<p>${confirmationMessage}</p>
				</div>
				<div class="progress">
				  <div class="progress-bar progress-bar-striped active" role="progressbar"
				  aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width:40%">
				    40%
				  </div>
				</div>
				</section>
		</div>

<!-- ***************** ___Marital Information Form -- START___ ******************** -->										

 	<fieldset>
       	<legend>	Marital Information 		</legend>  
		<form:form action="/maritalInfo/${Useremail}" method="get" modelAttribute="maritalInfo">
			<table>
				<tr>
					<td>
						<form:hidden path="userEmail" value="${Useremail}"/>
					</td>
				</tr>
				<tr>
					<td>
						Date of Marriage:
					</td>
					
					<td>
						<form:input type="date" path="marriageDate"/>
					</td>
				</tr>
				
				<tr>
					<td>
						Date of Cohabitation:
					</td>
					
					<td>
						<form:input type="date" path="cohabitationDate"/>
					</td>
				</tr>
				<tr>
					<td>
						Place of Marriage:
					</td>
					<td>
						<form:input path="marriagePlace"/>
					</td>
				</tr>
				<tr>
					<td>
						Date of Separation:
					</td>
					<td>
						<form:input type="date" path="separationDate"/>
					</td>
				</tr>
				<tr>
					<td>
						Have either you, your spouse,or children been in a court case before?(Yes/No):
					</td>
					<td>
						<form:input path="courtCase"/>
					</td>
				</tr>
				<tr>
					<td>
						Have you and your spouse made a written agreement dealing with any matter involved in this case?(Yes/No):
					</td>
					<td>
						<form:input path="writtenAgreement"/>
					</td>
				</tr>
				
				<tr>
					<td>
						If client or spouse is stay-at-home parent,please give relevant dates:
					</td>
					<td>
						<form:input path="relevantDate"/>
					</td>
				</tr>
				
				<tr>
					<td>
						Do you have any safety concerns for yourself of your children?(Yes/No):
					</td>
					<td>
						<form:input path="safetyConcerns"/>
					</td>
				</tr>
				
				<tr>
					<td>
						Have the police been called to the matrimonial home and does either spouse have a criminal record?(Yes/No):
					</td>
					<td>
						<form:input path="spouseCriminalRecord"/>
					</td>
				</tr>
				
			</table>
			<input type="submit" value="Add"/>
			</form:form>
			</fieldset>
<!-- ***************** ___Marital Information Form -- END___ ******************** -->										

<br>
<br>

<!-- ***************** ___Navigation to Other Forms -- START___ ******************** -->										


			<div aria-label="Page navigation example">
			  <ul class="pagination">
			   	   	<li ><a class="page-link" href="/navspouseInfo/${Useremail}">&lt;&lt; Prev</a></li>
    			<li><a class="page-link" href="/navclientInfo/${Useremail}">Client Information</a></li>
    				<li><a class="page-link" href="/navspouseInfo/${Useremail}">Spouse Information</a></li>
    				<li><a class="page-link" href="/navmaritalInfo/${Useremail}">Marital Information</a></li>
    				<li><a class="page-link" href="/navmatrimonialHome/${Useremail}">Matrimonial Home</a></li>
    				<li><a class="page-link" href="/navchildren/${Useremail}">Children</a></li>
    				<li><a class="page-link" href="/navchildExpense/${Useremail}">Childrens Expenses</a></li>
    				<li ><a class="page-link" href="/navmatrimonialHome/${Useremail}">Next &gt;&gt;</a></li>
			  </ul>
			</div>
			
<!-- ***************** ___Navigation to Other Forms -- END___ ******************** -->										


</body>
</html>