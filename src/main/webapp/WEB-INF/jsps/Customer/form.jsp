<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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



<title>Client Form</title>

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
							<span class="badge text-dark bg-light">${countClient}</span>
						</a>
						<div class="dropdown-menu">
							<c:set var="count_noti" value="${fn:length(clientList)}" />
							
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
							</a> 
							<a href="/settings/${Useremail}" class="dropdown-item"> <i
								class="fas fa-cog"></i> Settings
							</a>
							<a href="/customerRequest/${Useremail}/${Useremail}" class="dropdown-item"> <i
								class="fas fa-cog"></i> Your Request
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
						class="pl-4 h2">Services </span></a>
					<button class="navbar-toggler" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse">

						<ul
							class="flex-md-column flex-row navbar-nav w-100 justify-content-between ml-auto">
							<br>
							<li class="nav-item"><a class="nav-link pl-4 active"
								href="/form/${Useremail}"> Legal Forms</a></li>
							<li class="nav-item"><a class="nav-link pl-4"
								href="/document/${Useremail}">Legal Documents</span></a></li>
							<li class="nav-item"><a class="nav-link pl-4"
								href="/goToCustomerUpload/${Useremail}">Upload Documents</a></li>

						</ul>

					</div>
				</nav>
			</aside>
			<main class="col bg-faded py-3">

			<form action="/legalDocumentFormMulti/${Useremail}" id="myForm">


				<div class="container mr-5 pt-3 pl-5" id="">
					<div class="card-header text-light rounded"
						style="background-color: black" id="cardHeader">

						<h2>
							<i class="fas fa-file-alt"></i> Legal Forms
							<div class="float-right">
								<input class="btn btn-primary " type="submit" value="Submit" />
								<input class="btn btn-primary " type="button"
									onclick="myFunction()" value="Clear" />
							</div>
						</h2>
					</div>

					<div id="accordion">

						<!--************** One Segment  1 ......................... -->
						<div class="card" id="cardForm">
							<div class="card-header">
								<h5>
									<a href="#collapse1" data-parent="#accordion"
										data-toggle="collapse" style="color: #000"> Divorce
										(simple/joint) </a>
								</h5>
							</div>
							<div id="collapse1" class="collapse">
								<div class="card-body table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>Form Name</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach begin="0" end="6" var="list"
												items="${listOfAllForms}">
												<tr>
													<td><input type="checkbox" name="legalForm"
														value="${list.docType}^${list.formType}^${list.price}">
													</td>

													<td>${list.formType}</td>
													<td>${list.price}</td>
													<td><c:if test="${list.sale == 'Yes'}">
															<img src="/img/Sale.png" alt="Sale" width="42"
																height="42">
														</c:if></td>
												</tr>

											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--************** One Segment  1......................... -->

						<!--************** One Segment  2......................... -->
						<div class="card" id="cardForm">
							<div class="card-header">
								<h5>
									<a href="#collapse2" data-parent="#accordion"
										data-toggle="collapse" style="color: #000"> Divorce
										Application </a>
								</h5>
							</div>
							<div id="collapse2" class="collapse">
								<div class="card-body table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>Form Name</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach begin="7" end="20" var="list"
												items="${listOfAllForms}">
												<tr>
													<td><input type="checkbox" name="legalForm"
														value="${list.docType}^${list.formType}^${list.price}">
													</td>

													<td>${list.formType}</td>
													<td>${list.price}</td>
													<td><c:if test="${list.sale == 'Yes'}">
															<img src="/img/Sale.png" alt="Sale" width="42"
																height="42">
														</c:if></td>
												</tr>

											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--************** One Segment  2......................... -->


						<!--************** One Segment  3......................... -->
						<div class="card" id="cardForm">
							<div class="card-header">
								<h5>
									<a href="#collapse3" data-parent="#accordion"
										data-toggle="collapse" style="color: #000"> Application
										(General) </a>
								</h5>
							</div>
							<div id="collapse3" class="collapse">
								<div class="card-body table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>Form Name</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach begin="21" end="31" var="list"
												items="${listOfAllForms}">
												<tr>
													<td><input type="checkbox" name="legalForm"
														value="${list.docType}^${list.formType}^${list.price}">
													</td>

													<td>${list.formType}</td>
													<td>${list.price}</td>
													<td><c:if test="${list.sale == 'Yes'}">
															<img src="/img/Sale.png" alt="Sale" width="42"
																height="42">
														</c:if></td>
												</tr>

											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--************** One Segment  3......................... -->


						<!--************** One Segment  4......................... -->
						<div class="card" id="cardForm">
							<div class="card-header">
								<h5>
									<a href="#collapse4" data-parent="#accordion"
										data-toggle="collapse" style="color: #000"> Motion to
										Change </a>
								</h5>
							</div>
							<div id="collapse4" class="collapse">
								<div class="card-body table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>Form Name</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach begin="32" end="39" var="list"
												items="${listOfAllForms}">
												<tr>
													<td><input type="checkbox" name="legalForm"
														value="${list.docType}^${list.formType}^${list.price}">
													</td>

													<td>${list.formType}</td>
													<td>${list.price}</td>
													<td><c:if test="${list.sale == 'Yes'}">
															<img src="/img/Sale.png" alt="Sale" width="42"
																height="42">
														</c:if></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--************** One Segment  4......................... -->


						<!--************** One Segment  5......................... -->
						<div class="card" id="cardForm">
							<div class="card-header">
								<h5>
									<a href="#collapse5" data-parent="#accordion"
										data-toggle="collapse" style="color: #000"> Notice of
										Motion (Regular and/or Contempt) </a>
								</h5>
							</div>
							<div id="collapse5" class="collapse">
								<div class="card-body table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>Form Name</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach begin="40" end="47" var="list"
												items="${listOfAllForms}">
												<tr>
													<td><input type="checkbox" name="legalForm"
														value="${list.docType}^${list.formType}^${list.price}">
													</td>

													<td>${list.formType}</td>
													<td>${list.price}</td>
													<td><c:if test="${list.sale == 'Yes'}">
															<img src="/img/Sale.png" alt="Sale" width="42"
																height="42">
														</c:if></td>
												</tr>

											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--************** One Segment  5......................... -->

						<!--************** One Segment  6......................... -->
						<div class="card" id="cardForm">
							<div class="card-header">
								<h5>
									<a href="#collapse6" data-parent="#accordion"
										data-toggle="collapse" style="color: #000"> Conferences </a>
								</h5>
							</div>
							<div id="collapse6" class="collapse">
								<div class="card-body table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>Form Name</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach begin="48" end="54" var="list"
												items="${listOfAllForms}">
												<tr>
													<td><input type="checkbox" name="legalForm"
														value="${list.docType}^${list.formType}^${list.price}">
													</td>

													<td>${list.formType}</td>
													<td>${list.price}</td>
													<td><c:if test="${list.sale == 'Yes'}">
															<img src="/img/Sale.png" alt="Sale" width="42"
																height="42">
														</c:if></td>
												</tr>

											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--************** One Segment  6......................... -->

						<!--************** One Segment  7......................... -->
						<div class="card" id="cardForm">
							<div class="card-header">
								<h5>
									<a href="#collapse7" data-parent="#accordion"
										data-toggle="collapse" style="color: #000"> Enforcement </a>
								</h5>
							</div>
							<div id="collapse7" class="collapse">
								<div class="card-body table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>Form Name</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach begin="55" end="71" var="list"
												items="${listOfAllForms}">
												<tr>
													<td><input type="checkbox" name="legalForm"
														value="${list.docType}^${list.formType}^${list.price}">
													</td>

													<td>${list.formType}</td>
													<td>${list.price}</td>
													<td><c:if test="${list.sale == 'Yes'}">
															<img src="/img/Sale.png" alt="Sale" width="42"
																height="42">
														</c:if></td>
												</tr>

											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--************** One Segment  7......................... -->

						<!--************** One Segment  8......................... -->
						<div class="card" id="cardForm">
							<div class="card-header">
								<h5>
									<a href="#collapse8" data-parent="#accordion"
										data-toggle="collapse" style="color: #000"> Child and
										Youth Family Services Act </a>
								</h5>
							</div>
							<div id="collapse8" class="collapse">
								<div class="card-body table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>Form Name</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach begin="72" end="80" var="list"
												items="${listOfAllForms}">
												<tr>
													<td><input type="checkbox" name="legalForm"
														value="${list.docType}^${list.formType}^${list.price}">
													</td>

													<td>${list.formType}</td>
													<td>${list.price}</td>
													<td><c:if test="${list.sale == 'Yes'}">
															<img src="/img/Sale.png" alt="Sale" width="42"
																height="42">
														</c:if></td>
												</tr>

											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--************** One Segment  8......................... -->

						<!--************** One Segment  9......................... -->
						<div class="card" id="cardForm">
							<div class="card-header">
								<h5>
									<a href="#collapse9" data-parent="#accordion"
										data-toggle="collapse" style="color: #000">
										Inter-jurisdictional Support Orders </a>
								</h5>
							</div>
							<div id="collapse9" class="collapse">
								<div class="card-body table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>Form Name</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach begin="81" end="95" var="list"
												items="${listOfAllForms}">
												<tr>
													<td><input type="checkbox" name="legalForm"
														value="${list.docType}^${list.formType}^${list.price}">
													</td>

													<td>${list.formType}</td>
													<td>${list.price}</td>
													<td><c:if test="${list.sale == 'Yes'}">
															<img src="/img/Sale.png" alt="Sale" width="42"
																height="42">
														</c:if></td>
												</tr>

											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--************** One Segment  9......................... -->

						<!--************** One Segment  10......................... -->
						<div class="card" id="cardForm">
							<div class="card-header">
								<h5>
									<a href="#collapse10" data-parent="#accordion"
										data-toggle="collapse" style="color: #000"> Adoption </a>
								</h5>
							</div>
							<div id="collapse10" class="collapse">
								<div class="card-body table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>Form Name</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach begin="96" end="114" var="list"
												items="${listOfAllForms}">
												<tr>
													<td><input type="checkbox" name="legalForm"
														value="${list.docType}^${list.formType}^${list.price}">
													</td>

													<td>${list.formType}</td>
													<td>${list.price}</td>
													<td><c:if test="${list.sale == 'Yes'}">
															<img src="/img/Sale.png" alt="Sale" width="42"
																height="42">
														</c:if></td>
												</tr>

											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--************** One Segment  10......................... -->

						<!--************** One Segment  11......................... -->
						<div class="card" id="cardForm">
							<div class="card-header">
								<h5>
									<a href="#collapse11" data-parent="#accordion"
										data-toggle="collapse" style="color: #000"> Miscellaneous
										Forms </a>
								</h5>
							</div>
							<div id="collapse11" class="collapse">
								<div class="card-body table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>Form Name</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach begin="115" end="152" var="list"
												items="${listOfAllForms}">
												<tr>
													<td><input type="checkbox" name="legalForm"
														value="${list.docType}^${list.formType}^${list.price}">
													</td>

													<td>${list.formType}</td>
													<td>${list.price}</td>
													<td><c:if test="${list.sale == 'Yes'}">
															<img src="/img/Sale.png" alt="Sale" width="42"
																height="42">
														</c:if></td>
												</tr>

											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="float-right mr-5 pb-3 ">
					<input class="btn btn-primary " type="submit" value="Submit" /> 
					<input
						class="btn btn-primary " type="button" onclick="myFunction()"
						value="Clear" />
				</div>
			</form>

			</main>
		</div>
	</div>

	<!--************** One Segment  11......................... -->


	<!-- accordion Div closes here -->



	<!-- 
	<div class="float-right mr-5 pb-3">
			<input class="btn btn-primary " type="submit" value="Submit" /> 
			<input class="btn btn-primary " type="button"
			onclick="myFunction()" value="Clear"/>
	</div>
 -->



	<!-- <input class="btn btn-primary float-right mr-5 " type="submit"
			value="Submit"> <br> <br> -->


	<!-- <button class="open-button" onclick="openForm()">Contact</button>

	<div class="chat-popup" id="myForm">
		<form class="form-container" action="mailto:shahriya199907@gmail.com" method="post" enctype="text/plain">
			<h1>Contact</h1>

			<label for="msg"><b>Message</b></label>
			<textarea placeholder="Type message.." name=${Useremail } required></textarea>

			<button type="submit" class="btn">Send</button>
			<button type="button" class="btn cancel" onclick="closeForm()">Close</button>
		</form>
	</div> -->

	<script>
		function myFunction() {

			var items = document.getElementsByName('legalForm');
			for (var i = 0; i < items.length; i++) {
				if (items[i].type == 'checkbox')
					items[i].checked = false;
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