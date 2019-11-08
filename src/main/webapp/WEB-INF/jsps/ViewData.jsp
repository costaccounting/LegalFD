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
    
<title>View Client Form Data</title>
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
					
					<li class="nav-item px-2"><a href="/dashboard/${Useremail}" class="nav-link ">Home</a></li>

					<li class="nav-item px-2"><a href="#" class="nav-link">Notification</a>
					</li>
				</ul>

				<ul class="navbar-nav ml-auto">

					<li class="nav-item dropdown mr-3"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"> <i
							class="fas fa-user"></i> Welcome ${firstName}
					</a>
						<div class="dropdown-menu">
							
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
				<i class="fas fa-file-alt"></i> Cleint's General Application Form Information
			</h2>

		
		<a href="<c:url value="/dashboard/${Useremail}"/>" class="btn btn-light" id="submit" >
            <i class="fas fa-arrow-left"></i> Back To Dashboard
         </a>
	</div>
  
  	
	<div class="container" id="newContainer">
		<div class="card-header" id="cardHeader">

			<h2>
				<i class="fas fa-users"></i> ${clientFirstName}'s Personal Information 
			</h2>


		</div>
		
		<div id="accordion">
			<div class="card" id="cardForm">
				<div class="card-header">



<!-- ***************** ___Client Information Form -- START___ ******************** -->       	
       	<fieldset>
       	<legend>	Client Information 		</legend>  
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
						${clientInfo.fullLegalName}
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
			
			</fieldset>					
<!-- ***************** ___Client Information Form -- END___ ******************** -->										
<br>
<br>


<!-- ***************** ___Spouse Information -- START___ ******************** -->       	
       	<fieldset>
       	<legend>	Spouse Information 		</legend>  
		<form:form action="/spouseInfo/${Useremail}" method="get" modelAttribute="spouseInfo">
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
						<form:input type="date" path="spouseName"/>
					</td>
				</tr>
				<tr>
					<td>
						Date of Birth:
					</td>
					<td>
						<form:input path="spouseDateOfBirth"/>
					</td>
				</tr>
				<tr>
					<td>
						Citizenship:
					</td>
					<td>
						<form:input path="spouseCitizenship"/>
					</td>
				</tr>
				<tr>
					<td>
						Place of Birth:
					</td>
					<td>
						<form:input type="date" path="spousePlaceOfBirth"/>
					</td>
				</tr>
				<tr>
					<td>
						SIN: 
					</td>
					<td>
						<form:input path="spouseSIN"/>
					</td>
				</tr>
				<tr>
					<td>
						Surname at Birth:
					</td>
					<td>
						<form:input path="spouseSurnameBirth"/>
					</td>
				</tr>
				<tr>
					<td>
					`	Surname Before marriage:
					</td>
					<td>
						<form:input path="spouseSurnameMarriage"/>
					</td>
				</tr>
				<tr>
					<td>
						Current Home Address:
					</td>
					<td>
						<form:input path="spouseCurrentAddress"/>
					</td>
				</tr>
				<tr>
					<td>
						Since When?
					</td>
					<td>
						<form:input path="spouseSinceWhen"/>
					</td>
				</tr>
				<tr>
					<td>
						Current Mailing Address:
					</td>
					<td>
						<form:input path="spouseMailingAddress"/>
					</td>
				</tr>
				<tr>
					<td>
						Home Tel:
					</td>
					<td>
						<form:input path="spouseHomeTel"/>
					</td>
				</tr>
				<tr>
					<td>
						Work Tel:
					</td>
					<td>
						<form:input path="spouseWorkTel"/>
					</td>
				</tr>
				<tr>
					<td>
						Cell:
					</td>
					<td>
						<form:input path="spouseCell"/>
					</td>
				</tr>
				<tr>
					<td>
						Fax:
					</td>
					<td>
						<form:input path="spouseFax"/>
					</td>
				</tr>
				<tr>
					<td>
						Email:
					</td>
					<td>
						<form:input path="spouseEmail"/>
					</td>
				</tr>
				<tr>
					<td>
						Divorced Before?
					</td>
					<td>
						<form:input path="spouseDivorcedStatus"/>
					</td>
				</tr>
				<tr>
					<td>
						Place:
					</td>
					<td>
						<form:input path="spouseDivorcePlace"/>
					</td>
				</tr>
				<tr>
					<td>	
						Date:
					</td>
					<td>
						<form:input type="date" path="spouseDivorceDate"/>
					</td>
				</tr>
				<tr>
					<td>
						Job Title:
					</td>
					<td>
						<form:input path="spouseJobTitle"/>
					</td>
				</tr>
				<tr>
					<td>
						Current Employer:
					</td>
					<td>
						<form:input path="spouseCurrentEmployer"/>
					</td>
				</tr>
				<tr>
					<td>
						Current Employer Address:
					</td>
					<td>
						<form:input path="spouseEmployerAddress"/>
					</td>
				</tr>
				<tr>
					<td>
						Current Annual Income from Employment($):
					</td>
					<td>
						<form:input path="spouseAnnualIncome"/>
					</td>
				</tr>
				<tr>
					<td>
						Income from other sources:
					</td>
					<td>
						<form:input path="spouseIncomeOtherSource"/>
					</td>
				</tr>
			</table>
			<input type="submit" value="Add"/>
			</form:form>
			</fieldset>					
<!-- ***************** ___Spouse Information -- END___ ******************** -->										
<br>
<br>

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

	
<!-- ***************** ___Children Information Form -- START___ ******************** -->       	
       	<fieldset>
       	<legend>	Children Information 		</legend>  
		<form:form action="/children/${Useremail}" method="get" modelAttribute="children">
			<table>
				<tr>
					<td>
						<form:hidden path="userEmail" value="${Useremail}"/>
					</td>
				</tr>
				<tr>
					<th>
						Name
					</th>
					<th>
						Date of Birth
					</th>
					<th>
						Living With
					</th>
					<th>
						Grade
					</th>
					<th>
					School
					</th>
				</tr>
				<tr>
					<td>
						<form:input path="childName1"/>
					</td>
					<td>
						<form:input type="date" path="dobChild1"/>
					</td>
					<td>
						<form:input path="livingChild1"/>
					</td>
					<td>
						<form:input path="gradeChild1"/>
					</td>
					<td>
						<form:input path="schoolChild1"/>
					</td>
				</tr>
				<tr>
					<td>
						<form:input path="childName2"/>
					</td>
					<td>
						<form:input type="date" path="dobChild2"/>
					</td>
					<td>
						<form:input path="livingChild2"/>
					</td>
					<td>
						<form:input path="gradeChild2"/>
					</td>
					<td>
						<form:input path="schoolChild2"/>
					</td>
				</tr>
				<tr>
					<td>
						<form:input path="childName3"/>
					</td>
					<td>
						<form:input type="date" path="dobChild3"/>
					</td>
					<td>
						<form:input path="livingChild3"/>
					</td>
					<td>
						<form:input path="gradeChild3"/>
					</td>
					<td>
						<form:input path="schoolChild3"/>
					</td>
				</tr>
				<tr>
					<td>
						<form:input path="childName4"/>
					</td>
					<td>
						<form:input type="date" path="dobChild4"/>
					</td>
					<td>
						<form:input path="livingChild4"/>
					</td>
					<td>
						<form:input path="gradeChild4"/>
					</td>
					<td>
						<form:input path="schoolChild4"/>
					</td>
				</tr>
				
			</table>
			<input type="submit" value="Add"/>
			</form:form>
			</fieldset>					
<!-- ***************** ___Children Information Form -- END___ ******************** -->										
<br>
<br>
<!-- ***************** ___Child Expenses Information Form -- START___ ******************** -->       						
				<fieldset>
		       	<legend>	Child Expenses Information 		</legend>  
				<form:form action="/childExpense/${Useremail}" method="get" modelAttribute="childExpenses">
					<table>
						<tr>
							<td>
								<form:hidden path="userEmail" value="${Useremail}"/>
							</td>
						</tr>
						<tr>
							<td>
								Medical/Dental/Orthodontic:
							</td>
							<td>
								<form:input path="medical"/>
							</td>
						</tr>
						<tr>
							<td>
								Private School/Tutoring/Educational Expenses:
							</td>
							<td>
								<form:input path="educational"/>
							</td>
						</tr>
						<tr>
							<td>
								Post-secondary Educational Expenses:
							</td>
							<td>
								<form:input path="postEducational"/>
							</td>
						</tr>
						<tr>
							<td>
								Daycare/Child Care:
							</td>
							<td>
								<form:input path="daycare"/>
							</td>
						</tr>
						<tr>
							<td>
								Extracurricular Activities:
							</td>
							<td>
								<form:input path="extraCurricular"/>
							</td>
						</tr>
						<tr>
							<td>
								Other Expenses:
							</td>
							<td>
								<form:input path="others"/>
							</td>
						</tr>
						
					</table>
					<input type="submit" value="Add"/>
					</form:form>
					</fieldset>	
<!-- ***************** ___Child Expenses Information Form -- END___ ******************** -->										
<br>
<br>

				</div>
			</div>
		</div>
	</div>
  	

</body>
</html>