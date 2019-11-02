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
  
<title>Matrimonial Home</title>
</head>
<body>
<div type="hidden" name ="email" value="${Useremail}"></div>

	<h1>General Information Application Form</h1>
	
	
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
				  aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width:60%">
				    60%
				  </div>
				</div>
				</section>
		</div>
<!-- ***************** ___Marimonial Home Information Form -- START___ ******************** -->										

<fieldset>
       	<legend>	Matrimonial Information 		</legend>  
		<form:form action="/matrimonialHome/${Useremail}" method="get" modelAttribute="matrimonialHome">
			<table>
				<tr>
					<td>
						<form:hidden path="userEmail" value="${Useremail}"/>
					</td>
				</tr>
				<tr>
					<td>
						Address:
					</td>
					
					<td>
						<form:input path="firstAddress"/>
					</td>
				</tr>
				
				<tr>
					<td>
						Name(s) on Title:
					</td>
					
					<td>
						<form:input path="firstTitle"/>
					</td>
				</tr>
				<tr>
					<td>
						Value($):
					</td>
					<td>
						<form:input path="firstValue"/>
					</td>
				</tr>
				<tr>
					<td>
						Mortgage($):
					</td>
					<td>
						<form:input path="firstMortgage"/>
					</td>
				</tr>
				
					<tr>
					<td>
						Address:
					</td>
					
					<td>
						<form:input path="secondAddress"/>
					</td>
				</tr>
				
				<tr>
					<td>
						Name(s) on Title:
					</td>
					
					<td>
						<form:input path="secondTitle"/>
					</td>
				</tr>
				<tr>
					<td>
						Value($):
					</td>
					<td>
						<form:input path="secondValue"/>
					</td>
				</tr>
				<tr>
					<td>
						Mortgage($):
					</td>
					<td>
						<form:input path="secondMortgage"/>
					</td>
				</tr>
				<br>
				<legend>Excluded Property:</legend>
				
				<tr>
					<td>
						Received by client(during or after marriage):
					</td>
					<td>
						<form:input path="excludePropertyClient"/>
					</td>
				</tr>
				<tr>
					<td>
						Received by client's spouse(during or after marriage):
					</td>
					<td>
						<form:input path="excludePropertySpouse"/>
					</td>
				</tr>
							
			</table>
			<input type="submit" value="Add"/>
			</form:form>
			</fieldset>

<!-- ***************** ___Marimonial Home Information Form -- END___ ******************** -->										

<br>
<br>

<!-- ***************** ___Navigation to Other Forms -- START___ ******************** -->										


			<div aria-label="Page navigation example">
			  <ul class="pagination">
			   	   	<li ><a class="page-link" href="/navmaritalInfo/${Useremail}">&lt;&lt; Prev</a></li>
    		<li><a class="page-link" href="/navclientInfo/${Useremail}">Client Information</a></li>
    				<li><a class="page-link" href="/navspouseInfo/${Useremail}">Spouse Information</a></li>
    				<li><a class="page-link" href="/navmaritalInfo/${Useremail}">Marital Information</a></li>
    				<li><a class="page-link" href="/navmatrimonialHome/${Useremail}">Matrimonial Home</a></li>
    				<li><a class="page-link" href="/navchildren/${Useremail}">Children</a></li>
    				<li><a class="page-link" href="/navchildExpense/${Useremail}">Childrens Expenses</a></li>
    				<li ><a class="page-link" href="/navchildren/${Useremail}">Next &gt;&gt;</a></li>
			  </ul>
			</div>
			
<!-- ***************** ___Navigation to Other Forms -- END___ ******************** -->										

</body>
</html>