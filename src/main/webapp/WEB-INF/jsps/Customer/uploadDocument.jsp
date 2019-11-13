<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
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
<!-- <link rel="stylesheet" href="../../../css/fileupload.css"> -->
<link rel="stylesheet" href="/css/fileupload.css">
<title>Upload Documents</title>

<style>
.custom-file-upload {
	display: inline-block;
	padding: 6px 12px;
	cursor: pointer;
}


/* Button used to open the chat form - fixed at the bottom of the page */
.open-button {
	background-color: #555;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	position: sticky;
	bottom: 23px;
	right: 28px;
	border-radius: 50%;
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
</style>
</head>

<body>

<div class="chat-popup " id="myForm">



		<form action="mailto:shahriya?body='This is only a test!'"
			method="GET" class="form-container" >
			<h1>Chat</h1>
			<div class="form-group">
				<label for="name">About:</label> <input name="subject" type="text"
					class="form-control" />
			</div>
			<div class="form-group">
				<label for="name">Description:</label>
				<textarea name="body" class="form-control" rows=5></textarea>
			</div>



			<input class="btn btn-primary btn-block" type="submit" value="Send">
			<button type="button" class="btn cancel" onclick="closeForm()">Close</button>
		</form>
	</div>


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

					<li class="nav-item px-2 dropdown mr-3"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"> <span
							class="notification">Notification</span> <span
							class="badge text-dark bg-light">${countClient}</span>
					</a>
						<div class="dropdown-menu p-3">
							<c:set var="count_noti" value="${fn:length(clientList)}" />

							<c:forEach var="i" begin="1" end="${count_noti}" step="1">
								${clientList[count_noti-i]}
								<div class="float-right">
									<a href="/deleteNotification/${i}/${Useremail}"> <i
										class="fa fa-times-circle"></i>
									</a>
								</div>
								<div class="dropdown-divider"></div>
							</c:forEach>
						</div></li>
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
							</a> <a href="/settings/${Useremail}" class="dropdown-item"> <i
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
					class="navbar navbar-expand navbar-dark bg-primary flex-md-column flex-row align-items-start py-2 pb-5 ">

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
							<c:if test="${role == 'Lawyer'}">
								<li class="nav-item"><a class="nav-link pl-4 "
									href="/dashboard/${Useremail}"> Manage Users</a></li>
								<li class="nav-item"><a class="nav-link pl-4 "
									href="/caseRequest/${Useremail}">Client Requests </a></li>
							</c:if>
							
							<c:if test="${role == 'Admin'}">
								<li class="nav-item"><a class="nav-link pl-4 "
								href="/dashboard/${Useremail}"> Manage Users</a></li>
								<li class="nav-item"><a class="nav-link pl-4 "
								href="/caseRequest/${Useremail}">Client Requests</a></li>
								<li class="nav-item"><a class="nav-link pl-4"
								href="/editDocPrice/${Useremail}">Manage Price</a></li>

							</c:if>
							
							<c:if test="${role == 'Client'}">
							<li class="nav-item"><a class="nav-link pl-4 "
								href="/dashboard/${Useremail}"> Legal Forms</a></li>
							<li class="nav-item"><a class="nav-link pl-4"
								href="/document/${Useremail}">Legal Documents</span></a></li>
							<li class="nav-item"><a class="nav-link pl-4 active"
								href="/goToCustomerUpload/${Useremail}">Upload Documents</a></li>


							</c:if>
							

						</ul>

					</div>
				</nav>
			</aside>
			<main class="col bg-faded py-3">




			<div class="container mr-5 pt-3 pl-5" style="height: 590px">
				<div class="card ">
					<div class="card-header text-light" style="background-color: black">

						<h2>
							<i class="fa fa-upload"></i> Upload Documents
						</h2>
						<!-- 
                                    <div class="alert alert-success" role="alert" style="margin-left: 30px; width: 25%; ">
                                          ${message}
                                      </div>
                                       -->
					</div>

					<div class="m-4">
						<h2>Directory : ${presentDirectory}</h2>
						<table class="table table-striped">
							<thead class="thead-dark">
								<tr>
									<th></th>
									<th>Name</th>
									<th>Action</th>
									<th>Uploaded By</th>
									<th>Upload Date</th>
								</tr>
							</thead>
							<%
								List<String[]> list = (List<String[]>) request.getAttribute("fileinfo");
								List<File> filelist = (List<File>) request.getAttribute("filelist");
								String presentDirectory = (String) request.getAttribute("presentDirectory");

								for (File f : filelist) {
									out.print("<tr>");

									if (f.isDirectory()) {
										out.print("<td></td>");
										out.print("<td>" + f.getName() + "</td>");
										out.print("<td><a href='files/" + f.getName() + "'>Next</a></td>");
										out.print("<td></td>");
										out.print("<td></td>");

									} else if (f.isFile()) {
										for (String[] listitem : list) {
											if (listitem[0].equals(f.getName())) {
												out.print("<td><input type='checkbox' id='sel' class='sel' name='" + f.getName()
												+ "' value='" + f.getName() + "'/></td>");
												out.print("<td>" + listitem[3] + "</td>");
												out.print("<td>" + "<form method='POST' action='/download'>"
														+ "<input type='hidden' name='filename' value='" + f.getName() + "'/>"
														+ "<input type='hidden' name='foldername' " + " value='" + presentDirectory
														+ "' /> "
														+ "<input type='submit' value='Download file' class='btn btn-link' /> </form>" +

														"</td>");
												out.print("<td>" + listitem[1] + " </td>");
												out.print("<td>" + listitem[2] + "</td>");

											}
										}
									}
									out.print("</tr>");
								}
							%>
						</table>
						<span class="border-top my-3"></span>
						<div id="formDelete">
							<form id="submitForm" method="Post"
								action="/deleteFileUser/${presentDirectory}">
								<input type="hidden" id="Useremail" name="Useremail"
									value="${Useremail}" />
								<input type="hidden" id="hiddenInp"
									name="hiddenInp" /> 
									<input type="button"
									class="btn btn-primary" onClick="processDelete()"
									value="Delete selected files" />
							</form>
						</div>
						<h2>Add file</h2>
						<form method="POST"
							action="/uploadCustomer/<c:out value= "${presentDirectory}" />"
							enctype="multipart/form-data">

							<!-- <label class="btn btn-primary btn-file" >Browse
												<input  type="file" name="file" 
												style="display: none;"/></label> -->

							<label class="btn btn-primary custom-file-upload"
								for="file-upload">Browse</label> <input type="file" name="file"
								id="file-upload" name='upload_cont_img' style="display: none;" />

							<label id="file-name"></label> <input
								class="btn btn-primary float-right mr-5 mt-4" type="submit"
								value="Submit" />
						</form>
						<hr>
						<br />
						<div c:if="${message}">
							<h2 c:text="${message}" />
						</div>
					</div>
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


			</div>
		</div>
	</div>


	</main>
	<button class="open-button float-right bg-primary" onclick="openForm()">
		<i class="fas fa-envelope"></i>
	</button>
	

	<script>
		function openForm() {
			document.getElementById("myForm").style.display = "block";
		}

		function closeForm() {
			document.getElementById("myForm").style.display = "none";
		}
	</script>




	<script>
		document.querySelector("#file-upload").onchange = function() {
			document.querySelector("#file-name").textContent = this.files[0].name;
		}
		function processDelete() {
			var selected = new Array();
			var boxes = document.getElementsByClassName("sel");
			for (var i = 0; i < boxes.length; i++) {
				var box = boxes[i];
				if (box.checked) {
					selected.push(box.value);
				}
			}
			alert("in process: " + selected);
			document.getElementById("hiddenInp").value = selected;
			document.getElementById("submitForm").submit();

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