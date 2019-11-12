<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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




<title>View Client Form Data</title>
</head>

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

					<li class="nav-item px-2 dropdown mr-3">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"> 
							<span class="notification">Notification</span> 
							<span class="badge text-dark bg-light">${count}</span>
						</a>
						<div class="dropdown-menu">
							<c:set var="count_noti" value="${fn:length(notiList)}" />
							
							<c:forEach var="i" begin="1" end="${count_noti}" step="1">
								${notiList[count_noti-i]}
								<a href="/deleteNotification/${i}/${Useremail}"> 
									<i class="fa fa-times-circle"></i>
								</a>
								<br>
							</c:forEach>
						</div>
					</li>
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
								href="/caseRequest/${Useremail}">Client Requests </span></a></li>

						</ul>

					</div>
				</nav>
			</aside>
			<main class="col bg-faded py-3">




			<div class="container mr-5 pt-3 pl-5">
				<div class="card-header text-light rounded "
					style="background-color: black" id="cardHeader">

					<h2>
						<i class="fa fa-th-list"></i> User Details
						<div class="float-right">
							<a href="<c:url value="/dashboard/${Useremail}"/>"
								class="btn btn-primary" id="submit"> <i
								class="fas fa-arrow-left"></i> Back
							</a>
						</div>
					</h2>
				</div>

				<div id="accordion">
					<div class="card " id="cardForm">
						<div class="card-header">

							<h3>General Application Information: ${clientFirstName} </h3>
						</div>
					</div>



					<div class="card p-4 " id="cardForm">

						<fieldset>
							<legend>
								<h4>Client Information</h4>
							</legend>
							<hr>
							<table>
								<tr>
									<td>Full Legal Name:</td>
									<td>${clientInfo.fullLegalName}</td>
								</tr>
								<tr>
									<td>Date of Birth:</td>
									<td>${clientInfo.dateOfBirth}</td>
								</tr>
								<tr>
									<td>Citizenship:</td>
									<td>${clientInfo.citizenship}</td>
								</tr>
								<tr>
									<td>Place of Birth:</td>
									<td>${clientInfo.placeOfBirth}</td>
								</tr>
								<tr>
									<td>Social Insurance Number:</td>
									<td>${clientInfo.SIN}</td>
								</tr>
								<tr>
									<td>Surname at Birth:</td>
									<td>${clientInfo.surnameBirth}</td>
								</tr>
								<tr>
									<td>Surname before Marriage:</td>
									<td>${clientInfo.surnameBeforeMarriage}</td>
								</tr>
								<tr>
									<td>Current Home Address:</td>
									<td>${clientInfo.currentHomeAddress}</td>
								</tr>
								<tr>
									<td>Since When?</td>
									<td>${ clientInfo.sinceWhen}</td>
								</tr>
								<tr>
									<td>Current Mailing Address:</td>
									<td>${clientInfo.currentMailingAddress}</td>
								</tr>
								<tr>
									<td>Home Tel.:</td>
									<td>${clientInfo.homeTel}</td>
								</tr>
								<tr>
									<td>Work Tel:</td>
									<td>${clientInfo.workTel}</td>
								</tr>
								<tr>
									<td>Cell:</td>
									<td>${clientInfo.cell}</td>
								</tr>
								<tr>
									<td>Fax:</td>
									<td>${clientInfo.fax}</td>
								</tr>
								<tr>
									<td>Email:</td>
									<td>${clientInfo.email}</td>
								</tr>
								<tr>
									<td>Divorced Before?</td>
									<td>${clientInfo.divorcedBefore}</td>
								</tr>
								<tr>
									<td>Place:</td>
									<td>${clientInfo.place}</td>
								</tr>
								<tr>
									<td>Date:</td>
									<td>${path=clientInfo.date}</td>
								</tr>
								<tr>
									<td>Job Title:</td>
									<td>${clientInfo.jobTitle}</td>
								</tr>
								<tr>
									<td>Current Employer:</td>
									<td>${clientInfo.currentEmployer}</td>
								</tr>
								<tr>
									<td>Current Employer Address:</td>
									<td>${clientInfo.employerAddress}</td>
								</tr>
								<tr>
									<td>Annual Income from Employment:</td>
									<td>${clientInfo.annualIncome}</td>
								</tr>
								<tr>
									<td>Income from Another Source:</td>
									<td>${clientInfo.incomeOtherSource}</td>
								</tr>
							</table>

						</fieldset>
						<!-- ***************** ___Client Information Form -- END___ ******************** -->
						<br> <br>


						<!-- ***************** ___Spouse Information -- START___ ******************** -->
						<fieldset>
							<legend>
								<h4>Spouse Information</h4>
							</legend>
							<hr>
							<table>

								<tr>
									<td>Full Legal Name:</td>
									<td>${spouseInfo.spouseName}</td>
								</tr>
								<tr>
									<td>Date of Birth:</td>
									<td>${spouseInfo.spouseDateOfBirth}</td>
								</tr>
								<tr>
									<td>Citizenship:</td>
									<td>${spouseInfo.spouseCitizenship}</td>
								</tr>
								<tr>
									<td>Place of Birth:</td>
									<td>${spouseInfo.spousePlaceOfBirth}</td>
								</tr>
								<tr>
									<td>SIN:</td>
									<td>${spouseInfo.spouseSIN}</td>
								</tr>
								<tr>
									<td>Surname at Birth:</td>
									<td>${spouseInfo.spouseSurnameBirth}</td>
								</tr>
								<tr>
									<td>Surname Before marriage:</td>
									<td>${spouseInfo.spouseSurnameMarriage}</td>
								</tr>
								<tr>
									<td>Current Home Address:</td>
									<td>${spouseInfo.spouseCurrentAddress}</td>
								</tr>
								<tr>
									<td>Since When?</td>
									<td>${spouseInfo.spouseSinceWhen}</td>
								</tr>
								<tr>
									<td>Current Mailing Address:</td>
									<td>${spouseInfo.spouseMailingAddress}</td>
								</tr>
								<tr>
									<td>Home Tel:</td>
									<td>${spouseInfo.spouseHomeTel}</td>
								</tr>
								<tr>
									<td>Work Tel:</td>
									<td>${spouseInfo.spouseWorkTel}</td>
								</tr>
								<tr>
									<td>Cell:</td>
									<td>${spouseInfo.spouseCell}</td>
								</tr>
								<tr>
									<td>Fax:</td>
									<td>${spouseInfo.spouseFax}</td>
								</tr>
								<tr>
									<td>Email:</td>
									<td>${spouseInfo.spouseEmail}</td>
								</tr>
								<tr>
									<td>Divorced Before?</td>
									<td>${spouseInfo.spouseDivorcedStatus}</td>
								</tr>
								<tr>
									<td>Place:</td>
									<td>${spouseInfo.spouseDivorcePlace}</td>
								</tr>
								<tr>
									<td>Date:</td>
									<td>${spouseInfo.spouseDivorceDate}</td>
								</tr>
								<tr>
									<td>Job Title:</td>
									<td>${spouseInfo.spouseJobTitle}</td>
								</tr>
								<tr>
									<td>Current Employer:</td>
									<td>${spouseInfo.spouseCurrentEmployer}</td>
								</tr>
								<tr>
									<td>Current Employer Address:</td>
									<td>${spouseInfo.spouseEmployerAddress}</td>
								</tr>
								<tr>
									<td>Current Annual Income from Employment($):</td>
									<td>${spouseInfo.spouseAnnualIncome}</td>
								</tr>
								<tr>
									<td>Income from other sources:</td>
									<td>${spouseInfo.spouseIncomeOtherSource}</td>
								</tr>
							</table>
						</fieldset>
						<!-- ***************** ___Spouse Information -- END___ ******************** -->
						<br> <br>

						<!-- ***************** ___Marital Information Form -- START___ ******************** -->

						<fieldset>

							<legend>
								<h4>Marital Information</h4>
							</legend>
							<hr>
							<table>

								<tr>
									<td>Date of Marriage:</td>

									<td>${maritalInfo.marriageDate}</td>
								</tr>

								<tr>
									<td>Date of Cohabitation:</td>

									<td>${maritalInfo.cohabitationDate}</td>
								</tr>
								<tr>
									<td>Place of Marriage:</td>
									<td>${maritalInfo.marriagePlace}</td>
								</tr>
								<tr>
									<td>Date of Separation:</td>
									<td>${maritalInfo.separationDate}</td>
								</tr>
								<tr>
									<td>Have either you, your spouse,or children been in a
										court case before?(Yes/No):</td>
									<td>${maritalInfo.courtCase}</td>
								</tr>
								<tr>
									<td>Have you and your spouse made a written agreement
										dealing with any matter involved in this case?(Yes/No):</td>
									<td>${maritalInfo.writtenAgreement}</td>
								</tr>

								<tr>
									<td>If client or spouse is stay-at-home parent,please give
										relevant dates:</td>
									<td>${maritalInfo.relevantDate}</td>
								</tr>

								<tr>
									<td>Do you have any safety concerns for yourself of your
										children?(Yes/No):</td>
									<td>${maritalInfo.safetyConcerns}</td>
								</tr>

								<tr>
									<td>Have the police been called to the matrimonial home
										and does either spouse have a criminal record?(Yes/No):</td>
									<td>${maritalInfo.spouseCriminalRecord}</td>
								</tr>

							</table>

						</fieldset>
						<!-- ***************** ___Marital Information Form -- END___ ******************** -->
						<br> <br>


						<!-- ***************** ___Marimonial Home Information Form -- START___ ******************** -->

						<fieldset>
							<legend>
								<h4>Matrimonial Information</h4>
							</legend>
							<hr>
							<table>
								<tr>
									<td>Address:</td>

									<td>${matrimonialHome.firstAddress}</td>
								</tr>

								<tr>
									<td>Name(s) on Title:</td>

									<td>${matrimonialHome.firstTitle}</td>
								</tr>
								<tr>
									<td>Value($):</td>
									<td>${matrimonialHome.firstValue}</td>
								</tr>
								<tr>
									<td>Mortgage($):</td>
									<td>${matrimonialHome.firstMortgage}</td>
								</tr>

								<tr>
									<td>Address:</td>

									<td>${matrimonialHome.secondAddress}</td>
								</tr>

								<tr>
									<td>Name(s) on Title:</td>

									<td>${matrimonialHome.secondTitle}</td>
								</tr>
								<tr>
									<td>Value($):</td>
									<td>${matrimonialHome.secondValue}</td>
								</tr>
								<tr>
									<td>Mortgage($):</td>
									<td>${matrimonialHome.secondMortgage}</td>
								</tr>
								<br>
							</table>
							<br>
							<legend>
								<h5>Excluded Property</h5>
							</legend>
							<hr>
							<table>

								<tr>
									<td>Received by client(during or after marriage):</td>
									<td>${matrimonialHome.excludePropertyClient}</td>
								</tr>
								<tr>
									<td>Received by client's spouse(during or after marriage):
									</td>
									<td>${matrimonialHome.excludePropertySpouse}</td>
								</tr>

							</table>
						</fieldset>

						<!-- ***************** ___Marimonial Home Information Form -- END___ ******************** -->
						<br> <br>


						<!-- ***************** ___Children Information Form -- START___ ******************** -->
						<fieldset>

							<legend>
								<h4>Children Information</h4>
							</legend>
							<hr>

							<table>
								<thead>
									<tr>
										<th>Name</th>
										<th>Date of Birth</th>
										<th>Living With</th>
										<th>Grade</th>
										<th>School</th>
									</tr>
								</thead>
								<tr>
									<td>${children.childName1}</td>
									<td>${children.dobChild1}</td>
									<td>${children.livingChild1}</td>
									<td>${children.gradeChild1}</td>
									<td>${children.schoolChild1}</td>
								</tr>
								<tr>
									<td>${children.childName2}</td>
									<td>${children.dobChild2}</td>
									<td>${children.livingChild2}</td>
									<td>${children.gradeChild2}</td>
									<td>${children.schoolChild2}</td>
								</tr>
								<tr>
									<td>${children.childName3}</td>
									<td>${children.dobChild3}</td>
									<td>${children.livingChild3}</td>
									<td>${children.gradeChild3}</td>
									<td>${children.schoolChild3}</td>
								</tr>
								<tr>
									<td>${children.childName4}</td>
									<td>${children.dobChild4}</td>
									<td>${children.livingChild4}</td>
									<td>${children.gradeChild4}</td>
									<td>${children.schoolChild4}</td>
								</tr>

							</table>


						</fieldset>
						<!-- ***************** ___Children Information Form -- END___ ******************** -->
						<br> <br>
						<!-- ***************** ___Child Expenses Information Form -- START___ ******************** -->
						<fieldset>
							<legend>
								<h4>Child Expenses</h4>
							</legend>
							<hr>

							<table>

								<tr>
									<td>Medical/Dental/Orthodontic:</td>
									<td>${childExpenses.medical}</td>
								</tr>
								<tr>
									<td>Private School/Tutoring/Educational Expenses:</td>
									<td>${childExpenses.educational}</td>
								</tr>
								<tr>
									<td>Post-secondary Educational Expenses:</td>
									<td>${childExpenses.postEducational}</td>
								</tr>
								<tr>
									<td>Daycare/Child Care:</td>
									<td>${childExpenses.daycare}</td>
								</tr>
								<tr>
									<td>Extracurricular Activities:</td>
									<td>${childExpenses.extraCurricular}</td>
								</tr>
								<tr>
									<td>Other Expenses:</td>
									<td>${childExpenses.others}</td>
								</tr>

							</table>

						</fieldset>
						<!-- ***************** ___Child Expenses Information Form -- END___ ******************** -->
						<br> <br>

					</div>
				</div>
			</div>
		</div>

		</main>


	</div>






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