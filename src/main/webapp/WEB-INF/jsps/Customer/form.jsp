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
<link rel="stylesheet" href="css/chat.css">
<style type="text/css">

body {
    box-sizing: border-box;
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
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}</style>
<title>Client Form</title>
</head>
<body>

	<div>
		<p type="hidden" name="email" value="${Useremail}" />
		<p type="hidden" name="password" value="${UserPassword}" />
	</div>





	<nav class="navbar navbar-expand-sm navbar-dark bg-dark p-0">
		<div class="container">
			<a href="clientService.html" class="navbar-brand">LegalFD</a>
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav">
					<li class="nav-item px-2"><a href="clientService.html"
						class="nav-link">Home</a></li>

					<li class="nav-item px-2"><a href="#" class="nav-link">Notification</a>
					</li>
				</ul>

				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown mr-3"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"> <i
							class="fas fa-user"></i> Welcome ${firstName}
					</a>
						<div class="dropdown-menu">
							<a href="profile.html" class="dropdown-item"> <i
								class="fas fa-user-circle"></i> Profile
							</a> <a href="settings.html" class="dropdown-item"> <i
								class="fas fa-cog"></i> Settings
							</a>
						</div></li>
					<li class="nav-item">
       		<c:url var="logoutUrl" value="/logout"/>
		 		<a href= "${logoutUrl}" class="nav-link active">Log Out</a>
          </li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- HEADER -->
	<header id="main-header" class="py-2 bg-warning text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>
						<i class="fas fa-file-alt"></i> Legal Forms
					</h1>
				</div>
			</div>
		</div>
	</header>

	<!-- ACTIONS -->
	<section id="actions" class="py-4 mb-4 bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="row">
						<div class="col-md-3">
							<h2>Select Forms</h2>

						</div>

					</div>
					<div class="text-right">

						<button class="btn btn-outline-success" type="submit">Submit</button>
						<br>

					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="container">
		<div id="accordion">
			<div class="card">
				<div class="card-header">
					<h5>
						<a href="#collapse1" data-parent="#accordion"
							data-toggle="collapse"> Divorce (simple/joint) </a>
					</h5>
				</div>

				<div id="collapse1" class="collapse show">
					<div class="card-body">
						<input type="checkbox" name="form" value="divorce"> Form
						8A-Application<br> <input type="checkbox" name="form"
							value="divorce"> Form 10-Answer<br> <input
							type="checkbox" name="form" value="divorce"> Form
						10A-Reply<br> <input type="checkbox" name="form"
							value="divorce"> Form 6B-Affidavit of Service<br> <input
							type="checkbox" name="form" value="divorce"> Form
						36-Affidavit for Divorce<br> <input type="checkbox"
							name="form" value="divorce"> Form 25A-Divorce Order<br>
						<input type="checkbox" name="form" value="divorce"> Form
						36B-Certificate of Divorce<br>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<h5>
						<a href="#collapse2" data-parent="#accordion"
							data-toggle="collapse"> Divorce Application </a>
					</h5>
				</div>

				<div id="collapse2" class="collapse">
					<div class="card-body">
						<input type="checkbox" name="form" value="divorce0"> Form
						8A-Application<br> <input type="checkbox" name="form"
							value="divorce0"> Form 10-Answer<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						10A-Reply<br> <input type="checkbox" name="form"
							value="divorce0"> Form 6B-Affidavit of Service<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						36-Affidavit for Divorce<br> <input type="checkbox"
							name="form" value="divorce0"> Form 25A-Divorce Order<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						36B-Certificate of Divorce<br> <input type="checkbox"
							name="form" value="divorce0"> Form 25-Order (General)<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						35.1-Affidavit in Support of Custody and Access<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						13-Financial Statement (Support only)<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						13.1-Financial Statement (Support and Property)<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						13A-Certificate of Financial Disclosure<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						13B-Net Family Property Statement<br> <input type="checkbox"
							name="form" value="divorce0"> Form 13C-Comparison of Net
						Family Property Statements<br>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<h5>
						<a href="#collapse3" data-parent="#accordion"
							data-toggle="collapse"> Application (General) </a>
					</h5>
				</div>

				<div id="collapse3" class="collapse">
					<div class="card-body">
						<input type="checkbox" name="form" value="divorce0"> Form
						8A-Application<br> <input type="checkbox" name="form"
							value="divorce0"> Form 10-Answer<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						10A-Reply<br> <input type="checkbox" name="form"
							value="divorce0"> Form 6B-Affidavit of Service<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						25-Order (General)<br> <input type="checkbox" name="form"
							value="divorce0"> Form 35.1-Affidavit in Support of
						Custody and Access<br> <input type="checkbox" name="form"
							value="divorce0"> Form 13-Financial Statement (Support
						only)<br> <input type="checkbox" name="form" value="divorce0">
						Form 13.1-Financial Statement (Support and Property)<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						13A-Certificate of Financial Disclosure<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						13B-Net Family Property Statement<br> <input type="checkbox"
							name="form" value="divorce0"> Form 13C-Comparison of Net
						Family Property Statements<br>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<h5>
						<a href="#collapse4" data-parent="#accordion"
							data-toggle="collapse"> Motion to Change </a>
					</h5>
				</div>

				<div id="collapse4" class="collapse">
					<div class="card-body">
						<input type="checkbox" name="form" value="divorce0"> Form
						15-Motion to Change<br> <input type="checkbox" name="form"
							value="divorce0"> Form 15A-Change Information Form<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						15B-Response to Motion to Change<br> <input type="checkbox"
							name="form" value="divorce0"> Form 15C-Consent Motion to
						Change<br> <input type="checkbox" name="form"
							value="divorce0"> Form 15D-Consent Motion to Change Child
						Support<br> <input type="checkbox" name="form"
							value="divorce0"> Form 13-Financial Statement<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						6B-Affidavit of Service<br> <input type="checkbox"
							name="form" value="divorce0"> Form 25-Order (General)<br>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<h5>
						<a href="#collapse5" data-parent="#accordion"
							data-toggle="collapse"> Notice of Motion (Regular and/or
							Contempt) </a>
					</h5>
				</div>

				<div id="collapse5" class="collapse">
					<div class="card-body">
						<input type="checkbox" name="form" value="divorce0"> Form
						14-Notice of Motion<br> <input type="checkbox" name="form"
							value="divorce0"> Form 31-Notice of Contempt Motion<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						14A-Affidavit<br> <input type="checkbox" name="form"
							value="divorce0"> Form 14B-Motion Form<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						14C-Confirmation<br> <input type="checkbox" name="form"
							value="divorce0"> Form 14D-Order on Motion without Notice<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						25-Order (General)<br> <input type="checkbox" name="form"
							value="divorce0"> Form 6B-Affidavit of Service<br>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<h5>
						<a href="#collapse6" data-parent="#accordion"
							data-toggle="collapse"> Conferences </a>
					</h5>
				</div>

				<div id="collapse6" class="collapse">
					<div class="card-body">
						<input type="checkbox" name="form" value="divorce0"> 
						Form 17-Conference Notice<br> <input type="checkbox"
							name="form" value="divorce0"> Form 17A-Case Conference
						Brief<br> <input type="checkbox" name="form" value="divorce0">
						Form 17 C-Settlement Conference Brief<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						17E-Trial Management Conference Brief<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						00-Trial Scheduling Endorsement Form)<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						14C-Confirmation<br> <input type="checkbox" name="form"
							value="divorce0"> Form 6B-Affidavit of Service<br>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<h5>
						<a href="#collapse7" data-parent="#accordion"
							data-toggle="collapse"> Enforcement </a>
					</h5>
				</div>

				<div id="collapse7" class="collapse">
					<div class="card-body">
						<input type="checkbox" name="form" value="divorce0"> Form
						27-Request for Financial Statement<br> <input type="checkbox"
							name="form" value="divorce0"> Form 27A-Request for
						Statement of Income<br> <input type="checkbox" name="form"
							value="divorce0"> Form 27B-Statement of Income from
						Income Source<br> <input type="checkbox" name="form"
							value="divorce0"> Form 27C-Appointment of Financial
						Examination<br> <input type="checkbox" name="form"
							value="divorce0"> Form 28-Writ of Seizure and Sale<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						28A-Request for Writ of Seizure and Sale<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						28B-Statutory Declaration of Sheriff<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						28C-Writ of Temporary Seizure<br> <input type="checkbox"
							name="form" value="divorce0"> Form 29-Request for
						Garnishment<br> <input type="checkbox" name="form"
							value="divorce0"> Form 29A-Notice of Garnishment
						(lump-sum debt)<br> <input type="checkbox" name="form"
							value="divorce0"> Form 29B-Notice of Garnishment
						(periodic debt)<br> <input type="checkbox" name="form"
							value="divorce0"> Form 29C-Notice to Co-Owner of Debt<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						29E-Dispute Payor<br> <input type="checkbox" name="form"
							value="divorce0"> Form 29F-Dispute Garnishee<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						29G-Dispute (co-owner of debt)<br> <input type="checkbox"
							name="form" value="divorce0"> Form 29I-Notice to Stop
						Garnishment<br> <input type="checkbox" name="form"
							value="divorce0"> Form 29J-Statement to Garnishee
						Financial Institution Support<br>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<h5>
						<a href="#collapse8" data-parent="#accordion"
							data-toggle="collapse"> Child and Youth Family Services Act </a>
					</h5>
				</div>

				<div id="collapse8" class="collapse">
					<div class="card-body">
						<input type="checkbox" name="form" value="divorce0"> Form
						8B-Application (Child Protection and Status Review)<br> <input
							type="checkbox" name="form" value="divorce0"> Form 8B.1
						(Status Review for Child in Extended Society Care)<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						33B.1-Answer and Plan of Care (Parties other than CAS)<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						33C-Statement of Agreed Facts (Child Protection)<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						33D-Statement of Agreed Facts (Status Review)<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						34L-Application for Openness Order<br> <input type="checkbox"
							name="form" value="divorce0"> Form 34M-Consent to
						Openness Order under s.194 of the CYFSA, 2017<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						34m.1-Consent to Openness Order under s.196 or s.197 of the CYFSA,
						2017<br> <input type="checkbox" name="form" value="divorce0">
						Form 13B-Net Family Property Statement<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						34N-Application to Change or Terminate Openness Order<br>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<h5>
						<a href="#collapse9" data-parent="#accordion"
							data-toggle="collapse"> Interjurisdictional Support Orders </a>
					</h5>
				</div>

				<div id="collapse9" class="collapse">
					<div class="card-body">
						<input type="checkbox" name="form" value="divorce0"> Form
						A-Support Application (support variation application)<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						B-Identification Information<br> <input type="checkbox"
							name="form" value="divorce0"> Form C-Evidence of
						Parentage<br> <input type="checkbox" name="form"
							value="divorce0"> Form D-Statement to Support a
						Declaration of Biological Parent<br> <input type="checkbox"
							name="form" value="divorce0"> Form E-Child Support Claim<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						F-Request for Support Order<br> <input type="checkbox"
							name="form" value="divorce0"> Form G-Request for a child
						support order<br> <input type="checkbox" name="form"
							value="divorce0"> Form H-Special Expense Claim<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						I-Request to Pay Child Support<br> <input type="checkbox"
							name="form" value="divorce0"> Form J-Support for Claimant
						(Applicant)<br> <input type="checkbox" name="form"
							value="divorce0"> Form K-Financial Statement<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						l-Child Status and Financial Statement<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						M-Evidence to Support Variation of a Support Order<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						N-Respondent Answer to Application<br> <input type="checkbox"
							name="form" value="divorce0"> Form O-Request for
						Enforcement<br>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<h5>
						<a href="#collapse10" data-parent="#accordion"
							data-toggle="collapse"> Adoption </a>
					</h5>
				</div>

				<div id="collapse10" class="collapse">
					<div class="card-body">
						<input type="checkbox" name="form" value="divorce0"> Form
						08D-Application (Adoption)<br> <input type="checkbox"
							name="form" value="divorce0"> Form 08D-Application
						(Adoption)<br> <input type="checkbox" name="form"
							value="divorce0"> Form 08D.1-Application (Dispense with
						Parent’s Consent to adoption before placement)<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						08D.2-Notice of Intention to place Child(ren) for Adoption<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						08D.3-Notice of Intention to place First Nations, Inuk or Metis
						Child for Adoption<br> <input type="checkbox" name="form"
							value="divorce0"> Form 08D.4-Notice of Termination of
						access<br> <input type="checkbox" name="form"
							value="divorce0"> Form 25C-Adoption Order<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						34-Child’s Consent to Adoption<br> <input type="checkbox"
							name="form" value="divorce0"> Form 34A-Affidavit of
						Parentage<br> <input type="checkbox" name="form"
							value="divorce0"> Form 34B-Non-parent’s Consent to
						Adoption by Spouse<br> <input type="checkbox" name="form"
							value="divorce0"> Form 34C-Director’s or Local Director’s
						statement on Adoption<br> <input type="checkbox" name="form"
							value="divorce0"> Form 34D-Affidavit of Adoption
						Applicant(‘s)<br> <input type="checkbox" name="form"
							value="divorce0"> Form 34E-Director’s Consent to Adoption<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						34F-Parent’s or Custodian’s Consent to Adoption<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						34G-Affidavit of Adoption Licensee or Society Employee<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						34G.1-Affidavit of Society Employee for Adoption<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						34H-Affidavit of Adopting Relative or Stepparent<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						34I-Parent’s Consent to Adoption by Spouse<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						34J-Affidiavit of Execution and Independent Legal Advice<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						34K-Certificate of Clerk (Adoption)<br>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<h5>
						<a href="#collapse11" data-parent="#accordion"
							data-toggle="collapse"> Miscellaneous Forms </a>
					</h5>
				</div>

				<div id="collapse11" class="collapse">
					<div class="card-body">
						<input type="checkbox" name="form" value="divorce0"> Form
						01-Application for Family Law Value<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						01-Support Deduction Order<br> <input type="checkbox"
							name="form" value="divorce0"> Form 02-Joint Declaration
						of Period of Spousal Relationship<br> <input type="checkbox"
							name="form" value="divorce0"> Form 02-Support Deduction
						Order Information Form<br> <input type="checkbox" name="form"
							value="divorce0"> Form 03-Contact person Authorization<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						04-Notice of Change in Representation<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						04-Notice of Change in Representation (Self Represented)<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						05-Application to Transfer the Family Law Value<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						06-Acknowledgement of Service<br> <input type="checkbox"
							name="form" value="divorce0"> Form 06-Application to
						divide a Retired Member’s Pension<br> <input type="checkbox"
							name="form" value="divorce0"> Form 06-Refraining Order<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						07-No Division of Family Law Value-Pension<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						08-Post Retirement Waiver of Joint and Assets Survivor Pension<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						12-Notice of Withdrawal<br> <input type="checkbox"
							name="form" value="divorce0"> Form 14D-Order on Motion
						without Notice<br> <input type="checkbox" name="form"
							value="divorce0"> Form 20-Request for Information<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						20.1-Acknowledgement of Expert’s Duty<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						22-Request to Admit<br> <input type="checkbox" name="form"
							value="divorce0"> Form 22A-Response to Request to Admit<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						23-Summons To Witness<br> <input type="checkbox" name="form"
							value="divorce0"> Form 23A-Summons To Witness outside
						Ontario<br> <input type="checkbox" name="form"
							value="divorce0"> Form 23B-Order for Prisoner’s
						Attendance<br> <input type="checkbox" name="form"
							value="divorce0"> Form 23C-Affidavit for uncontested
						Trial<br> <input type="checkbox" name="form" value="divorce0">
						Form 25B-Secure Treatment Order<br> <input type="checkbox"
							name="form" value="divorce0"> Form 25D-Order (uncontested
						Trial)<br> <input type="checkbox" name="form"
							value="divorce0"> Form 25E-Notice Disputing Approval of
						Order<br> <input type="checkbox" name="form" value="divorce0">
						Form 25F-Restraining Order<br> <input type="checkbox"
							name="form" value="divorce0"> Form 25G-Restraining Order
						on motion without Notice<br> <input type="checkbox"
							name="form" value="divorce0"> Form 25H-Order Terminating
						Restraining Order<br> <input type="checkbox" name="form"
							value="divorce0"> Form 26-Statement of Money Owed<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						26B-Affidavit for filing Domestic Contract<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						32.1-Request and Enforce a Family Arbitration Award<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						32.1A-Dispute of Request for Enforcement<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						33-Information for Warrant to bring a Child to a place of safety<br>
						<input type="checkbox" name="form" value="divorce0"> Form
						33A-Warrant to bring child to a place of safety<br> <input
							type="checkbox" name="form" value="divorce0"> Form
						33B-Plan of Care (CAS)<br> <input type="checkbox" name="form"
							value="divorce0"> Form 33E-Child’s Consent to Secure
						Treatment<br> <input type="checkbox" name="form"
							value="divorce0"> Form 33F-Consent to Secure Treatment
						(person other than child)<br>

					</div>
				</div>
			</div>
		</div>
	</div>

	<button class="open-button" onclick="openForm()">Chat</button>

	<div class="chat-popup" id="myForm">
		<form action="/action_page.php" class="form-container">
			<h1>Chat</h1>

			<label for="msg"><b>Message</b></label>
			<textarea placeholder="Type message.." name="msg" required></textarea>

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