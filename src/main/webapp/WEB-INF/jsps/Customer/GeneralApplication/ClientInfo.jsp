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
  
  <link rel="stylesheet" href="css/CustomerPortal.css"> 
  
    
<title>Client Info</title>
</head>
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
	
	<div class="card-header" id="cardHeader">

			<h2>
				 General Information Application Form
			</h2>

		</div>
		<br>
	
  	<div class="container">
      <div class="row">
        <div class="col-md-3">
          <a href="<c:url value="/ClientSide/${Useremail}"/>" class="btn btn-light btn-block">
            <i class="fas fa-arrow-left"></i> Back To Dashboard
          </a>
        </div>
      </div>
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
						<form:input path="dateOfBirth"/>
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
						<form:input path="SIN"/>
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
						<form:input path="date"/>
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
			
</body>
</html>