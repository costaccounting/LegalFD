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

<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->




<title>Client Info</title>

</head>
<body>


	<div type="hidden" name="email" value="${Useremail}"></div>




	<nav class="navbar navbar-expand-xl navbar-dark bg-dark sticky-top">
		<div class="container" id="navContainer">
			<a href="#" class="navbar-brand "><span class="mb-0 h1"><i
					class="fas fa-balance-scale"> </i> LegalFD</span></a>
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav">

					<li class="nav-item px-2"><a href="/ClientSide/${Useremail}"
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

	<div class="card-header mx-5 p-3 text-light bg-dark">
		<div class="d-flex bd-highlight">

			<h2 class=" flex-grow-1 bd-highlight">
				<i class="fas fa-file-alt"></i> General Application Information Form
			</h2>

			<a href="#" class="btn btn-light bd-highlight " id="submit"> <i
				class="fas fa-arrow-left"></i> Back To Dashboard
			</a>
		</div>
	</div>

	<br>



	<div class="container">

		<div class="progress">
			<div class="progress-bar bg-dark" style="width: 16.67%;"></div>
		</div>

		<br>
		<h3>Client Information</h3>
		<br>
		<form:form action="/clientInfo/${Useremail}" method="get"
			modelAttribute="clientInfo">

			<form:hidden path="userEmail" value="${Useremail}" />
			<div class="row">
				<label class="mb-2 col">Full Legal Name:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Full Legal Name" path="fullLegalName" />
				<label class="mb-2 col">Date of Birth:</label>
				<form:input type="date" class="form-control mb-2 col"
					placeholder="Date of Birth" path="dateOfBirth" />

			</div>
			<div class="row">
				<label class="mb-2 col">Citizenship:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Citizenship" path="citizenship" />
				<label class="mb-2 col">Place of Birth:</label>
				<form:input type="date" class="form-control mb-2 col"
					placeholder="Place of Birth" path="placeOfBirth" />

			</div>

			<div class="row">
				<label class="mb-2 col">Social Insurance Number:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Social Insurane Number" id="sin" path="SIN" />
				<label class="mb-2 col">Surname at Birth:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Surname at Birth" path="surnameBirth" />

			</div>
			<div class="row">
				<label class="mb-2 col">Surname before Marriage:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Surname before Marriage" path="surnameBeforeMarriage" />
				<label class="mb-2 col">Current Home Address:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Current Home Address" path="currentHomeAddress" />

			</div>
			<div class="row">
				<label class="mb-2 col">Since When?:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Year" path="sinceWhen" />
				<label class="mb-2 col">Current Mailing Address:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Current Mailing Address" path="currentMailingAddress" />

			</div>
			<div class="row">
				<label class="mb-2 col">Home Tel:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Home" path="homeTel" />
				<label class="mb-2 col">Work Tel:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Work" path="workTel" />

			</div>
			<div class="row">
				<label class="mb-2 col">Cell:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Cell" path="cell" />
				<label class="mb-2 col">Fax:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Fax" path="fax" />

			</div>
			<div class="row">
				<label class="mb-2 col">Email:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Email" path="email" />
				<label class="mb-2 col">Divorced Before:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Yes/No" path="divorcedBefore" />

			</div>
			<div class="row">
				<label class="mb-2 col">Place:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Place" path="place" />
				<label class="mb-2 col">Date:</label>
				<form:input type="date" class="form-control mb-2 col" path="date" />

			</div>
			<div class="row">
				<label class="mb-2 col">Job Title:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Job Title" path="jobTitle" />
				<label class="mb-2 col">Current Employeer:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Current Employeer" path="currentEmployer" />

			</div>
			<div class="row">
				<label class="mb-2 col">Current Employeer Address:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Address" path="employerAddress" />
				<label class="mb-2 col">Annual Income from Employment:</label>
				<form:input type="text" class="form-control mb-2 col"
					placeholder="Income" path="annualIncome" />

			</div>

			<div class="form-inline">
				<label class="mb-2 mr-sm-4">Income from another source:</label>
				<form:input path="incomeOtherSource" type="text"
					class="form-control mb-2 " placeholder="Income" />
				<button type="submit" class="btn btn-primary mb-2 ml-sm-4">Add</button>

			</div>
		</form:form>
		<br> <br>

		<nav>
			<ul class="pagination justify-content-center">
				<li class="page-item disabled"><a class="page-link" href="#">
						<span>&laquo;</span> <span class="sr-only">Previous</span>
				</a></li>
				<li class="page-item active"><a class="page-link"
					href="/navclientInfo/${Useremail}">1</a></li>
				<li class="page-item"><a class="page-link"
					href="/navspouseInfo/${Useremail}">2</a></li>
				<li class="page-item"><a class="page-link"
					href="/navmaritalInfo/${Useremail}">3</a></li>
				<li class="page-item"><a class="page-link"
					href="/navmatrimonialHome/${Useremail}">4</a></li>
				<li class="page-item"><a class="page-link"
					href="/navchildren/${Useremail}">5</a></li>
				<li class="page-item"><a class="page-link"
					href="/navchildExpense/${Useremail}">6</a></li>
				<li class="page-item"><a class="page-link"
					href="/navspouseInfo/${Useremail}"> <span>&raquo;</span> <span
						class="sr-only">Next</span>
				</a></li>
			</ul>
		</nav>


	</div>
	<br>
	<br>





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


	<%-- <div type="hidden" name ="email" value="${Useremail}"></div>

	
	
	
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
				  aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width:2.5%">
				    0%
				  </div>
				</div>
				</section>
		</div>
			
			
			
<!-- ***************** ___Client Information Form -- START___ ******************** -->       	
       	<fieldset>
       	<legend>	Client Information 		</legend>  
		<form:form action="/clientInfo/${Useremail}" method="get" modelAttribute="clientInfo">
			<table>
				<tr>
					<td>
						<form:hidden path="userEmail" value="${Useremail}"/>
					</td>
				</tr>
				<tr>
					<td>
						Full Legal Name:
					</td>
					<td>
						<form:input path="fullLegalName"/>
					</td>
				</tr>
				<tr>
					<td>
						Date of Birth:
					</td>
					<td>
						<form:input type="date" path="dateOfBirth"/>
					</td>
				</tr>
				<tr>
					<td>
						Citizenship:
					</td>
					<td>
						<form:input path="citizenship"/>
					</td>
				</tr>
				<tr>
					<td>
						Place of Birth:
					</td>
					<td>
						<form:input path="placeOfBirth"/>
					</td>
				</tr>
				<tr>
					<td>
						Social Insurance Number: 
					</td>
					<td>
						<form:input id="sin" path="SIN"/>
					</td>
				</tr>
				<tr>
					<td>
						Surname at Birth:
					</td>
					<td>
						<form:input path="surnameBirth"/>
					</td>
				</tr>
				<tr>
					<td>
						Surname before Marriage:
					</td>
					<td>
						<form:input path="surnameBeforeMarriage"/>
					</td>
				</tr>
				<tr>
					<td>
						Current Home Address:
					</td>
					<td>
						<form:input path="currentHomeAddress"/>
					</td>
				</tr>
				<tr>
					<td>
						Since When?
					</td>
					<td>
						<form:input path="sinceWhen"/>
					</td>
				</tr>
				<tr>
					<td>
						Current Mailing Address:
					</td>
					<td>
						<form:input path="currentMailingAddress"/>
					</td>
				</tr>
				<tr>
					<td>
						Home Tel.:
					</td>
					<td>
						<form:input path="homeTel"/>
					</td>
				</tr>
				<tr>
					<td>
						Work Tel:
					</td>
					<td>
						<form:input path="workTel"/>
					</td>
				</tr>
				<tr>
					<td>
						Cell:
					</td>
					<td>
						<form:input path="cell"/>
					</td>
				</tr>
				<tr>
					<td>
						Fax:
					</td>
					<td>
						<form:input path="fax"/>
					</td>
				</tr>
				<tr>
					<td>
						Email:
					</td>
					<td>
						<form:input path="email"/>
					</td>
				</tr>
				<tr>
					<td>
						Divorced Before?
					</td>
					<td>
						<form:input path="divorcedBefore"/>
					</td>
				</tr>
				<tr>
					<td>
						Place:
					</td>
					<td>
						<form:input path="place"/>
					</td>
				</tr>
				<tr>
					<td>
						Date:
					</td>
					<td>
						<form:input type="date" path="date"/>
					</td>
				</tr>
				<tr>
					<td>
						Job Title: 
					</td>
					<td>
						<form:input path="jobTitle"/>
					</td>
				</tr>
				<tr>
					<td>
						Current Employer: 
					</td>
					<td>
						<form:input path="currentEmployer"/>
					</td>
				</tr>
				<tr>
					<td>
						Current Employer Address:
					</td>
					<td>
						<form:input path="employerAddress"/>
					</td>
				</tr>
				<tr>
					<td>
						Annual Income from Employment:
					</td>
					<td>
						<form:input path="annualIncome"/>
					</td>
				</tr>
				<tr>
					<td>
						Income from Another Source:
					</td>
					<td>
						<form:input path="incomeOtherSource"/>
					</td>
				</tr>
			</table>
			<input type="submit" value="Add"/>
			</form:form>
			</fieldset>					
<!-- ***************** ___Client Information Form -- END___ ******************** -->										
<br>
<br>


<!-- ***************** ___Navigation to Other Forms -- START___ ******************** -->										


			<div aria-label="Page navigation example">
			  <ul class="pagination">
			   	   <!-- 	<li><a class="page-link" href="#">Prev</a></li>  -->
    				<li><a class="page-link" href="/navclientInfo/${Useremail}">Client Information</a></li>
    				<li><a class="page-link" href="/navspouseInfo/${Useremail}">Spouse Information</a></li>
    				<li><a class="page-link" href="/navmaritalInfo/${Useremail}">Marital Information</a></li>
    				<li><a class="page-link" href="/navmatrimonialHome/${Useremail}">Matrimonial Home</a></li>
    				<li><a class="page-link" href="/navchildren/${Useremail}">Children</a></li>
    				<li><a class="page-link" href="/navchildExpense/${Useremail}">Childrens Expenses</a></li>
    				<li><a class="page-link" href="/navspouseInfo/${Useremail}">Next &gt;&gt;</a></li>
			  </ul>
			</div>
			
<!-- ***************** ___Navigation to Other Forms -- END___ ******************** -->										
			 --%>
</body>
</html>