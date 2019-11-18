<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
<link rel="stylesheet" href="css/style.css">
<title>Register your Account</title>


</head>



<body>
	<nav class="navbar navbar-expand-sm navbar-dark fixed-top"
		id="main-nav" style="background-color: black;">
		<div class="container">


			<a href="#" class="navbar-brand"><span class="mb-0 h1"> <i
					class="fas fa-balance-scale"> </i> LegalFD
			</span> </a>

			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>






			<div class="collapse navbar-collapse" id="navbarCollapse">

				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><c:url var="url" value="/signIn"></c:url>
						<a href="${url}" class="nav-link">Sign In</a></li>
					<li class="nav-item"><a href="/about" class="nav-link">About</a>
					</li>

				</ul>
			</div>
		</div>
	</nav>

	<header id="home-section">
		<div class="dark-overlay">
			<div class="home-inner container">
				<div class="row">
					<div class="col-lg-8 d-none d-lg-block">
						<h1 class="display-4">
							<strong></strong> <strong></strong>
						</h1>
						<div class="d-flex">
							<div class="p-4 align-self-start">
								<i class="fas fa-check fa-2x"></i>
							</div>
							<div class="p-4 align-self-end">Lorem ipsum dolor sit, amet
								consectetur adipisicing elit. Sed, tempore iusto in minima
								facere dolorem!</div>
						</div>

						<div class="d-flex">
							<div class="p-4 align-self-start">
								<i class="fas fa-check fa-2x"></i>
							</div>
							<div class="p-4 align-self-end">Lorem ipsum dolor sit, amet
								consectetur adipisicing elit. Sed, tempore iusto in minima
								facere dolorem!</div>
						</div>

						<div class="d-flex">
							<div class="p-4 align-self-start">
								<i class="fas fa-check fa-2x"></i>
							</div>
							<div class="p-4 align-self-end">Lorem ipsum dolor sit, amet
								consectetur adipisicing elit. Sed, tempore iusto in minima
								facere dolorem!</div>
						</div>
					</div>

					<div class="col-lg-4">
						<div class="card bg-primary text-center card-form">
							<div class="card-body">
								<h3>Sign Up</h3>
								<br>
								<form action="/register1" method="post"
									modelAttribute="registerUser">

									<div class="form-group">
										<input type="email" name="email"
											class="form-control form-control-lg" placeholder="Email"
											required>
									</div>
									<div class="form-group">
										<input type="text" name="firstName"
											class="form-control form-control-lg" placeholder="First Name"
											required>
									</div>
									<div class="form-group">
										<input type="text" name="lastName"
											class="form-control form-control-lg" placeholder="Last Name"
											required>
									</div>
									<div class="form-group">
										<input type="password" name="password"
											class="form-control form-control-lg" placeholder="Password"
											required>
									</div>

									<input type="submit" value="Sign Up"
										class="btn btn-outline-light btn-block">


									<p align="center" style="color: red; font-size: 1.5em;">${RegErrMess}</p>
								</form>


							</div>
						</div>
						<div class="container ">

							<p>
								By clicking on Sign Up you will agree to <a href="#"
									data-toggle="modal" data-target="#myModal">Terms of Use</a>, <a
									href="#" data-toggle="modal" data-target="#disclaimer">Disclaimer</a>
								and <a href="#" data-toggle="modal" data-target="#privacy">Privacy
									Policy.</a>
							</p>

							<!-- MODAL -->
							<div class="modal" id="myModal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" style="color: black">Terms of
												Use</h5>
											<button class="close" data-dismiss="modal">&times;</button>
										</div>
										<div class="modal-body" style="color: black">
											<h2>LegalFD Terms and Conditions</h2>
											<p>The following are the terms and conditions (the
												"Terms") for the use of the LegalFD web site (the "Site"),
												LegalFD Services, and related material.</p>
											<ol>
												<li><b>General</b><br>With each visit to the Site
													you signify your agreement to these Terms. These Terms were
													last modified on November 04, 2019. Sequiter Inc. and its
													suppliers own the LegalFD trade name, brand and trademark
													and websites. Hereafter, LegalFD means Sequiter Inc.
													LegalFD Material is defined as any intellectual property,
													legal materials, documents, web pages, software, products,
													web links, email, information, or any other materials
													provided by or previously provided by LegalFD or the Site,
													including any portion thereof. LegalFD Services is defined
													as any LegalFD service. If you do not wish to be bound by
													these Terms, you are not granted authority to use or access
													the Site or LegalFD Material.</li>
												<li><b>Use of LegalFD Material and LegalFD Services</b>
													<ol type="A">
														<b>Generally</b>
														<br>
														<p>
															You agree not to use any LegalFD Material and LegalFD
															Services for any purpose which is against any law in your
															jurisdiction or for any purpose which would not give full
															effect to the Terms even if that purpose is otherwise
															allowed under the Terms. Final Document is defined as the
															finished legal document for legal document products or
															other document created through the use of a LegalFD
															product. You are granted a Licence when you enter into a
															free trial, have a subscription or pay for access to a
															product.<br>Any paid or Free Trial Licence granted
															is subject to the Terms and entitles you to:
														</p>
														<ol type="a">
															<li>use Final Documents of the products as specified
																by the Terms only.</li>

															<li>make five electronic copies of each Final
																Document for your personal use.</li>
															<li>make necessary mechanical copies (e.g. printed
																or photocopied) of the Final Documents for your personal
																records and as required for completion of the specific
																transactions for which the Final Documents are intended.
															</li>
														</ol>
													</ol></li>
												<li>You may end a Licence in the manner specified on
													the order page, your account area or the help
													documentation. LegalFD retains the right to cancel any sale
													or Site access at any time, in which case you will only be
													charged for the time the sale or Site access was in effect.
													<br>Your Licence is valid for the country of the
													document that you select when you purchase your Licence.
													You will be charged in the currency of that country.<br>
												<br>If you are not a party in transactions in which a
													Final Document is used or if you obtained the Final
													Document under a free trial, you are not allowed to enter
													into new transactions using the Final Document starting one
													month after the expiry of the corresponding product access
													time period.<br>
												<br>To access products, you must provide credit card
													details to LegalFD as required by the Site. LegalFD will
													charge credit cards in accordance with displayed pricing in
													return for access to products and lawful services and if
													free trials are not cancelled before the specified time
													period.<br>Subject to these Terms, if you are
													evaluating the Site strictly as a potential customer or to
													participate in our affiliate program, you are granted a
													licence to evaluate the Site for that purpose only.
												</li>
												<li><b>Legal Advice, Information and Decision
														Making Responsibility</b><br>
													<p>
														LegalFD is not a law firm and does not provide Legal
														Advice (as defined below). Your use of LegalFD Material or
														any LegalFD Services does not create a solicitor-client
														relationship between you and LegalFD.<br>
														<br>You agree that all decisions you make on legal
														matters are your full responsibility and you agree to
														retain legal counsel licensed to practice in your
														jurisdiction regarding any legal issue of enough
														importance to reasonably require it. <br>You agree
														that LegalFD does not provide Legal Advice. If you receive
														any communication from LegalFD, its agents, its employees
														or any other associated entity, which is Legal Advice, you
														agree that it is <b>NOT</b> a communication authorized by
														LegalFD and you agree to immediately delete and disregard
														it.<br>Except as expressly provided in these Terms,
														you agree to accept full responsibility for determining
														the value of and for any use you make of LegalFD Material,
														and for obtaining any needed assistance from a properly
														licensed attorney to assess the value of and appropriate
														uses for any LegalFD Material. <br>For the purposes
														of these Terms, Legal Advice is defined to include the
														following:
													</p>
													<ol type="a">
														<li>any legal related communication, work or service
															which, under the governing law of your jurisdiction, is
															only allowed to be performed by or under the supervision
															of a properly licensed attorney;</li>
														<li>advice on which legal document or documents you
															need or are best for your situation;</li>
														<li>determining the legal consequences that will or
															could result from how you have created your legal
															document;</li>
														<li>whether you have included inappropriate,
															conflicting, or ambiguous information in your legal
															documents;</li>
														<li>whether you have omitted any necessary provisions
															or details from your legal documents; and</li>
														<li>whether you require any additional legal
															documents or legal procedures.</li>
													</ol></li>
												<li><b>Programs</b> <br>
												<p>
														LegalFD retains the right to make changes to its Affiliate
														Program or other programs as it sees fit.<br>
													</p></li>
												<li></li>
											</ol>
										</div>
										<div class="modal-footer">
											<button class="btn btn-secondary" data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>

							<div class="modal" id="disclaimer">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" style="color: black">Disclaimer</h5>
											<button class="close" data-dismiss="modal">&times;</button>
										</div>
										<div class="modal-body" style="color: black">

											<h2>Legal Disclaimer</h2>
											<br>
											<p>LegalFD DOES NOT provide any legal advice and users of
												this web site should consult with their own lawyer for legal
												advice.</p>
											<br>
											<br>
											<p>This web site (the "Site") is a general service that
												provides legal information over the Internet. We are not a
												law firm and our employees are not acting as your attorney.
												The information contained in the Site is general legal
												information and should not be construed as legal advice to
												be applied to any specific factual situation. If you are
												unsure whether your particular situation requires that a
												document be changed, you should consult a lawyer. Any use of
												the Site DOES NOT create or constitute a solicitor-client
												relationship between LegalFD or any employee of or other
												person associated with LegalFD and a user of the Site. As
												the law differs in each legal jurisdiction and may be
												interpreted or applied differently depending on your
												location or situation, the information or use of documents
												on the Site is not a substitute for the advice of a lawyer.</p>
											<br>
											<br>
											<p>Any guarantee on the Site is subject to our Terms and
												Conditions. For the most part, our Terms and Conditions
												specify that there is no guarantee or warranty and that we
												are not responsible for any loss, injury, claim, liability,
												or damage ("damages") related to your use of the Site,
												whether from errors or omissions in the content of the Site
												or any other linked sites. We are not responsible for any
												damages from the Site being inaccessible to the user and use
												of the Site is at your own risk. Refer to our Terms and
												Conditions regarding details of any exceptions such as our
												Quality Guarantee.</p>
											<br>
											<br>
											<p>While we have worked to make our Site and all the
												features on our Site compatible with the most commonly used
												browsers, we cannot represent or guarantee that every
												feature will work with your browser.</p>
											<br>
											<br>
											<p>LegalFD does not endorse any content provided by any
												linked sites, nor does it assume any responsibility for the
												interpretation or application of any information originating
												from such content. In addition, LegalFD does not endorse any
												content contained in any advertising on the Site, nor does
												it assume any responsibility for the quality or integrity of
												such work.</p>
											<br>
											<br>
											<p>Use of our Site is governed by our Terms and
												Conditions; refer to this document for more information.</p>
											<br>
											<br>




										</div>
										<div class="modal-footer">
											<button class="btn btn-secondary" data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>

							<div class="modal" id="privacy">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" style="color: black">Privacy
												Policy</h5>
											<button class="close" data-dismiss="modal">&times;</button>
										</div>
										<div class="modal-body" style="color: black">

											<h2>LegalFD Privacy Policy</h2>
											<br>


											<p>
												<b>Our Commitment to your Privacy</b>
											</p>
											<br>
											<p>LegalFD is committed to protecting your privacy and
												ensuring that your visit to our website is completely
												secure.</p>
											<br>
											<p>If you have any questions or problems with any aspect
												of our privacy policy or its implementation, please contact
												our privacy officer.</p>
											<br>
											<br>
											<p>
												<b>Security of your Personal Information</b>
											</p>
											<br>
											<p>To maintain the security of your information, we use
												the Transport Layer Security (TLS) protocol with 128-bit or
												higher encryption strength to transmit sensitive
												information. This is the same technology used in
												transmitting sensitive information by banks, governments,
												and online businesses such as Amazon.com and eBay.</p>
											<br>
											<p>Once the information is in our system, it is
												accessible to authorized LegalFD personnel only. We strictly
												enforce our privacy policies with our employees and any
												breach of this policy will result in termination and the
												pressing of criminal charges where there are grounds.</p>
											<br>
											<br>
											<p>
												<b>How we use your Personal Information</b>
											</p>
											<br>
											<br>
											<p>Your personal information will be used in order to
												provide you with the requested products and services. This
												includes the use of information for completing transactions
												or communicating back to you. Credit card numbers are used
												only for payment processing and are not used for any other
												purpose.</p>
											<br>
											<p>We may also use personal information in a manner that
												does not identify you specifically nor allow you to be
												contacted but does identify certain criteria about our
												Site's users in general (such as we may inform third parties
												about the number of registered users, number of unique
												visitors, and the pages most frequently browsed).</p>
											<br>
											<br>
											<p>
												<b>Who we share your Personal Information with</b>
											</p>
											<br>
											<br>
											<p>We will NOT sell, trade or rent your name or personal
												information to anyone else. We DO NOT sell, trade, rent or
												provide outside access to our mailing list at all.</p>
											<br>
											<p>LegalFD will not release your personal information to
												authorities unless required by law, search warrant, court
												order, subpoena, or fraud investigation.</p>
											<br>
											<p>Except as otherwise stated in this policy, LegalFD
												will share your information with third parties only to the
												extent necessary to provide the services and products
												requested by you. All such third parties are prohibited from
												using your personal information except to provide these
												services and they are required to maintain the
												confidentiality of your information.</p>
											<br>
											<br>
											<p>
												<b>Collection of your Personal Information</b>
											</p>
											<br>
											<br>
											<p>LegalFD only saves such personal information that is
												necessary for you to access and use our services. This
												personal information includes, but is not limited to, first
												and last name, email address, phone number, other payment
												processing information and document creation data. LegalFD
												will store such personal information until you delete that
												personal information through your “My Documents” or “My
												Account” pages on our site, you formally request its
												deletion or revoke your consent to its storage, or LegalFD
												otherwise deletes that personal information in accordance
												with its decisions or internal policies.
											<p>
												<br>
												<br>
											<p>
												<b>Document Preparation and Privacy of Information</b>
											</p>
											<br>
											<br>
											<p>The information you provide when you prepare a
												document on our website is held strictly confidential. For
												your protection provide a valid email address that will not
												block email from LegalFD. To change your password, you must
												use the email address associated with your account. We do
												not give out passwords over the phone.</p>



										</div>
										<div class="modal-footer">
											<button class="btn btn-secondary" data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>



						</div>
					</div>
				</div>
			</div>
	</header>


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


</body>


</html>