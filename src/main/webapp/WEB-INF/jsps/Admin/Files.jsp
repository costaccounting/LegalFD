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
<title>Upload Documents</title>
</head>
<style>
.custom-file-upload {
	display: inline-block;
	padding: 6px 12px;
	cursor: pointer;
}
</style>
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
					<li class="nav-item px-2 dropdown mr-3"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"> <span
							class="notification">Notification</span> <span
							class="badge text-dark bg-light">${count}</span>
					</a>
						<div class="dropdown-menu p-3" style=" width: 350px">
							<c:set var="count_noti" value="${fn:length(notiList)}" />

							<c:forEach var="i" begin="1" end="${count_noti}" step="1">
								${notiList[count_noti-i]}
								<a href="/deleteNotification/${count_noti-i}/${Useremail}"> <i
									class="fa fa-times-circle"></i>
								</a>
								<div class="dropdown-divider"></div>
							</c:forEach>
						</div></li>
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
							<c:if test="${role == 'Lawyer'}">
								<li class="nav-item"><a class="nav-link pl-4 active"
									href="/dashboard/${Useremail}"> Manage Users</a></li>
								<li class="nav-item"><a class="nav-link pl-4 "
									href="/caseRequest/${Useremail}">Client Requests </a></li>
							</c:if>
							
							<c:if test="${role == 'Admin'}">
								<li class="nav-item"><a class="nav-link pl-4 active"
								href="/dashboard/${Useremail}"> Manage Users</a></li>
								<li class="nav-item"><a class="nav-link pl-4 "
								href="/caseRequest/${Useremail}">Client Requests</a></li>
								<li class="nav-item"><a class="nav-link pl-4"
								href="/editDocPrice/${Useremail}">Manage Price</a></li>

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
							<div class="float-right">
								<a href="/dashboard/${Useremail}" class="btn btn-primary "
									id="submit"> <i class="fas fa-arrow-left"></i> Back
								</a>
							</div>
						</h2>
						
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
										out.print("<td>" + f.getName() + "</td>");
										out.print("<td><a href='files/" + f.getName() + "'>Next</a></td>");
										out.print("<td></td>");
										out.print("<td></td>");

									} else if (f.isFile()) {
										for (String[] listitem : list) {
											//System.out.println("matching = " + listitem[0] + "," + f.getName() + " :" + listitem[0].equals(f.getName()) );
											//System.out.println(listitem);
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
						<div id="formDelete">
							<form id="submitForm" method="Post"
								action="/deleteFileAdmin/${presentDirectory}">
								<input type="hidden" id="Useremail" name="Useremail"
									value="${Useremail}" /> <input type="hidden" id="hiddenInp"
									name="hiddenInp" /> <input type="button"
									class="btn btn-primary" onClick="processDelete()"
									value="Delete selected files" />
							</form>
						</div>



						<span class="border-top my-3"></span>
						<h2>Add file</h2>
						<form method="POST"
							action="/upload/<c:out value= "${presentDirectory}" />"
							enctype="multipart/form-data">

							<input type="hidden" name="Useremail" value="${Useremail}" /> <label
								class="btn btn-primary custom-file-upload" for="file-upload">Browse</label>
							<input type="file" name="file" id="file-upload"
								name='upload_cont_img' style="display: none;" /> <label
								id="file-name"></label> <input
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






			</div>
		</div>
	</div>


	</main>

	<script type="text/javascript">
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

		function processDelete() {
			var selected = new Array();
			var boxes = document.getElementsByClassName("sel");
			if(boxes.length==0){
				alert("Please select checkbox(ex) for the files that you wish to delete");
			}
			for (var i = 0; i < boxes.length; i++) {
				var box = boxes[i];
				if (box.checked) {
					selected.push(box.value);
				}
			}
			document.getElementById("hiddenInp").value = selected;
			document.getElementById("submitForm").submit();

		}
	</script>
	<script>
		document.querySelector("#file-upload").onchange = function() {
			document.querySelector("#file-name").textContent = this.files[0].name;
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
