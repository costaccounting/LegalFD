package ca.sheridancollege;

import java.io.*;
import java.nio.file.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ca.sheridancollege.beans.*;
import ca.sheridancollege.dao.*;

@Controller
public class HomeController {

	private static Dao dao = new Dao();
	GeneralFormDao generalDao = new GeneralFormDao();
	
	// Global Variable for Yes and No
	List<String> list = Arrays.asList(new String[]{"Yes", "No"});
	
	
// ****  Navigation between Pages START ***
	
	@RequestMapping("/")
	public String goHome(Model model) {
		model.addAttribute("registerUser", new RegisterUser());
		
		return "index";
	}
	
	@RequestMapping("/signIn")
	public String gosignIN(Model model) {
		model.addAttribute("registerUser", new RegisterUser());
		
		return "index";
	}
	
	@RequestMapping("/register")
	public String goRegisterPage(Model model, @ModelAttribute RegisterUser registerUser) {
		model.addAttribute("registerUser", new RegisterUser());
		
		return "signUP";
	}
	
	
	@RequestMapping("/logout")
	public String goLogOut(Model model) {
			
		model.addAttribute("logOutMess", "Thanks for using our services. See you again soon.");
		model.addAttribute("registerUser", new RegisterUser());
		
		return "index";
	}
	
	
	@RequestMapping("/files")			
	public String goFilesDir(Model model, @ModelAttribute String location) {			
			if(location.equals(null) || location.equals("")){					
				location = dao.getProjectFolder();						
			}					
								
			List<String> uploaders = new ArrayList<String>();		
					
			List<File> filelist = dao.getFileList(dao.getDirPath(location));		
		    List<String[]> fileinfo = compareWithFileDatabase(filelist);
					
				
					
			model.addAttribute("filelist", filelist);					
			model.addAttribute("fileinfo", fileinfo);		
					
								
			return "Admin/Files";					
	}
	
	@RequestMapping("/navclientInfo/{Useremail}")	
	public String navClientInfo(Model model, @PathVariable String Useremail) {
		
		
				// Regular Code to send to General Application sos that Forms will work properly
				
				model.addAttribute("clientInfo", (generalDao.getclientInfoList(Useremail)));
				// Needed in order to work with general application form
				
				// Regular Customer JSP EL tags needed code
						String firstNameStore = dao.getFirstName(Useremail).get(0);
						
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail);
						
				// Needed for Customer JSP EL tags
				
				return "Customer/GeneralApplication/ClientInfo";
	}
	
	@RequestMapping("/navspouseInfo/{Useremail}")	
	public String navSpouseInfo(Model model, @PathVariable String Useremail) {
		
		
				// Regular Code to send to General Application sos that Forms will work properly
				
				model.addAttribute("spouseInfo", (generalDao.getSpouseInfo(Useremail)));
				// Needed in order to work with general application form
				
				// Regular Customer JSP EL tags needed code
						String firstNameStore = dao.getFirstName(Useremail).get(0);
						
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail);
						
				// Needed for Customer JSP EL tags
				
				return "Customer/GeneralApplication/SpouseInfo";
	}
	
	@RequestMapping("/navmaritalInfo/{Useremail}")	
	public String navMaritalInfo(Model model, @PathVariable String Useremail) {
		
		
				model.addAttribute("optionsList", list);
				// Regular Code to send to General Application sos that Forms will work properly
				model.addAttribute("maritalInfo", (generalDao.getMartialInfo(Useremail)));
				// Needed in order to work with general application form
				
				// Regular Customer JSP EL tags needed code
						String firstNameStore = dao.getFirstName(Useremail).get(0);
						
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail);
						
				// Needed for Customer JSP EL tags
				
				return "Customer/GeneralApplication/MaritalInfo";
	}
	
	@RequestMapping("/navmatrimonialHome/{Useremail}")	
	public String navMatrimonialHome(Model model, @PathVariable String Useremail) {
		
		
				// Regular Code to send to General Application sos that Forms will work properly
				model.addAttribute("matrimonialHome", (generalDao.getMatrimonialHome(Useremail)));
				// Needed in order to work with general application form
				
				// Regular Customer JSP EL tags needed code
						String firstNameStore = dao.getFirstName(Useremail).get(0);
						
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail);
						
				// Needed for Customer JSP EL tags
				
				return "Customer/GeneralApplication/MatrimonialHome";
	}
	
	@RequestMapping("/navchildren/{Useremail}")	
	public String navChildren(Model model, @PathVariable String Useremail) {
		
		
				// Regular Code to send to General Application sos that Forms will work properly
				model.addAttribute("children", (generalDao.getChildren(Useremail)));
				// Needed in order to work with general application form
				
				// Regular Customer JSP EL tags needed code
						String firstNameStore = dao.getFirstName(Useremail).get(0);
						
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail);
						
				// Needed for Customer JSP EL tags
				
				return "Customer/GeneralApplication/Children";
	}
	
	
	@RequestMapping("/navchildExpense/{Useremail}")	
	public String navChildExpenses(Model model, @PathVariable String Useremail) {
		
		
				// Regular Code to send to General Application sos that Forms will work properly
				model.addAttribute("childExpenses", (generalDao.getChildExpenses(Useremail)));
				// Needed in order to work with general application form
				
				// Regular Customer JSP EL tags needed code
						String firstNameStore = dao.getFirstName(Useremail).get(0);
						
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail);
						
				// Needed for Customer JSP EL tags
				
				return "Customer/GeneralApplication/ChildExpenses";
	}
	
	
	
// ****  Navigation between Pages 	END ***
	
	
//----**** BELOW this RIYA Code*******---------------------------------

	
		
//----**** ABOVE this RIYA Code*******---------------------------------
		
	
	
		
		
//----**** BELOW this HEET Code*******---------------------------------
		
		@RequestMapping(value = "about", method = RequestMethod.GET)
		public String about(Model model, @ModelAttribute RegisterUser user) {

			return "About";
		}

//----**** ABOVE this HEET Code*******---------------------------------
		
		
		
	
	
//-----------------********		REGISTER   START	********---------------------------------
	
	@RequestMapping("/register1")
	public String goRegister(Model model, @ModelAttribute RegisterUser registerUser) {
		
			String email = registerUser.getEmail();
			
			
			if(dao.addUser(registerUser)==true) {
				model.addAttribute("message", "You have Successfully Created your Account");
				model.addAttribute("successMessage", "Please Login in with your credentials");
				 
				 
				model.addAttribute("registerUser", new RegisterUser());
				// Empty the field in form and sends it to register page
				
				//create a folder for the user
				if(dao.createFolder(registerUser))
					System.out.println("folder created");
				else
					System.out.println("folder not created");
				
				return "index";	
			}
			else
			{
				model.addAttribute("mess", "Un-expected Error. Please Try Again");
				model.addAttribute("register", registerUser); 
				// Stores the form inputed data and return back to register form
				
				return "index";	
			}
			
		
	}// end of method

//-----------------********		REGISTER   END	********---------------------------------
	
	
//-----------------********		LOGIN	START	********---------------------------------
	
	@RequestMapping("/login")
	public String goLogin(Model model, @RequestParam String email, @RequestParam String password) {
		
		
			if(dao.getEmail(email).isEmpty()==false){
			
			System.out.println("Test o/p -->" + dao.userExist(email, password).isEmpty());
			if(dao.userExist(email, password).isEmpty() == true)
			{
				model.addAttribute("loginMess", "Bad Credentials. Please Re-enter Your Details");
				model.addAttribute("registerUser", new RegisterUser());
				
				return "index";
			}
			else if((dao.userExist(email, password).get(0)).equals("Admin"))
			{
				String firstNameStore = dao.getFirstName(email).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", email );
				model.addAttribute("UserPassword", password);
				model.addAttribute("allData", dao.getDataForAdmin(email));
				
				return "Admin/Admin";
			}
			else if((dao.userExist(email, password).get(0)).equals("Client"))
			{
				List<LawyerDocEdit> docPrice = dao.getDocPrice();
				
				model.addAttribute("listOfAllForms", docPrice);
				
				String firstNameStore = dao.getFirstName(email).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", email );
				model.addAttribute("UserPassword", password );
				
				return "Customer/form";
			}
			else if((dao.userExist(email, password).get(0)).equals("Lawyer"))
			{
				String firstNameStore = dao.getFirstName(email).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", email );
				model.addAttribute("UserPassword", password);
				
				model.addAttribute("allDataForLawyer", dao.getDataForLawyer(email));
				
				return "Lawyer/Lawyer";
			}
			
			else 
			{
				model.addAttribute("loginMess", "Bad Credentials. Please Re enter Your Password");
				model.addAttribute("registerUser", new RegisterUser());
				
				return "index";
			}
		}
		else if(dao.getEmail(email).isEmpty()==true)
		{
			model.addAttribute("loginMess", "Your Account DOES NOT Exists. Please Register First");
			model.addAttribute("registerUser", new RegisterUser());
			
			return "index";
		}
		else {
			model.addAttribute("loginMess", "Your Account DOES NOT Exists. Please Register First");
			model.addAttribute("registerUser", new RegisterUser());
			
			return "index";
		}
		
	}
//-----------------********		LOGIN	END		********---------------------------------
	
	
//-----------------********		Admin or Lawyer	Dashboard START		********---------------------------------
	
	@RequestMapping("/dashboard/{Useremail}")
	public String goDashbaord(Model model, @PathVariable String Useremail) {
		
		
			if((dao.getRole(Useremail).get(0)).equals("Admin"))
			{
				String firstNameStore = dao.getFirstName(Useremail).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", Useremail);
				
				model.addAttribute("allData", dao.getDataForAdmin(Useremail));
				model.addAttribute("user", new RegisterUser());
				
				return "Admin/Admin";
			}
			else if((dao.getRole(Useremail).get(0)).equals("Lawyer"))
			{
				String firstNameStore = dao.getFirstName(Useremail).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", Useremail );
				
				model.addAttribute("allDataForLawyer", dao.getDataForLawyer(Useremail));
				return "Lawyer/Lawyer";
			}
			else if((dao.getRole(Useremail).get(0)).equals("Client")) {
				
				List<LawyerDocEdit> docPrice = dao.getDocPrice();
				
				model.addAttribute("listOfAllForms", docPrice);
				
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			
			return "Customer/form";
			}
			else {
				model.addAttribute("loginMess", "You DO NOT hold privileges to View that Page");
				model.addAttribute("registerUser", new RegisterUser());
				
				return "index";
			}
			
		}
//-----------------********		Admin or Lawyer	Dashboard STOP		********---------------------------------
	
	
//-----------------********		NAVIGATION TO DETAILS Start	********---------------------------------
// prodip edit 	

	@RequestMapping("/details/{email}/{Useremail}")
	public String goDetails(Model model, @PathVariable String email, @PathVariable String Useremail) {
	
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		model.addAttribute("firstName", firstNameStore);
		
		
		model.addAttribute("email", email);
		model.addAttribute("Useremail", Useremail);
		
		List<File> filelist;
		try {
			filelist = dao.getFileList(dao.getDirPath(email));
		} catch (Exception e) {
			dao.createFolder (email)  ;
			filelist = dao.getFileList(dao.getDirPath(email));
		}
		
		model.addAttribute("filelist", filelist);
		
		model.addAttribute("presentDirectory", email);
		
		return  "Admin/Files";
	}

//-----------------********		NAVIGATION TO DETAILS End	********---------------------------------

//-----------------********		NAVIGATION TO Document Edit for Admin Side Start	********---------------------------------
	
		@RequestMapping("/docEdit/{Useremail}")
		public String goLegalDocumentEdit(Model model, @PathVariable String Useremail) {
		
			if((dao.getRole(Useremail).get(0)).equals("Admin")) {
				
				String firstNameStore = dao.getFirstName(Useremail).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", Useremail);
				
				return "Admin/DocumentEdit";
				}
				else {
					model.addAttribute("logOutMess", "You DO NOT hold privileges to Edit Form Price");
					model.addAttribute("registerUser", new RegisterUser());
					
					return "index";
					
				}
			
		}

//-----------------********		NAVIGATION TO Document Edit for Admin Side End	********---------------------------------


//-----------------********		NAVIGATION TO View Client General Application Info for Lawyer and Admin  START********---------------------------------
			
				@RequestMapping("/application/{cleintEmail}/{Useremail}")
				public String goViewClientInfo(Model model, @PathVariable String clientEmail ,@PathVariable String Useremail) {
				
					if((dao.getRole(Useremail).get(0)).equals("Admin") || (dao.getRole(Useremail).get(0)).equals("Lawyer")) 
						{
						
						ChildExpenses childExpenses = generalDao.getChildExpenses(clientEmail);
						Children children = generalDao.getChildren(clientEmail);
						ClientInfo clientInfo= generalDao.getclientInfoList(clientEmail);
						MartialInfo martialInfo= generalDao.getMartialInfo(clientEmail);
						MatrimonialHome matrimonialHome= generalDao.getMatrimonialHome(clientEmail);
						SpouseInfo spouseInfo= generalDao.getSpouseInfo(clientEmail);
						
						
						String firstNameStore = dao.getFirstName(Useremail).get(0);
						String clientFirstName = dao.getFirstName(Useremail).get(0);
						
						// Getting Client data based on their Client Email
						model.addAttribute("childExpenses", childExpenses);
						model.addAttribute("children", children);
						model.addAttribute("clientInfo", clientInfo);
						model.addAttribute("maritalInfo", martialInfo);
						model.addAttribute("matrimonialHome", matrimonialHome);
						model.addAttribute("spouseInfo", spouseInfo);
						
						// Necessary code to send to JSP
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail);
						
						model.addAttribute("clientFirstName", clientFirstName);
						
						return "ViewData";
						}
						else {
							model.addAttribute("logOutMess", "You DO NOT hold privileges to View this Page");
							model.addAttribute("registerUser", new RegisterUser());
							
							return "index";
							
						}
					
				}

//-----------------********		NAVIGATION TO View Client General Application Info for Lawyer and Admin  START ********---------------------------------

			
		
		
//-----------------********		NAVIGATION TO Edit & UPDATE User Function 	********---------------------------------
		
		@RequestMapping("/edit/{email}/{Useremail}")
		public String goEditUser(Model model, @PathVariable String email, @PathVariable String Useremail) {
		
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			model.addAttribute("firstName", firstNameStore);
			
			RegisterUser reg = dao.getUser(email); 
			
			
			model.addAttribute("userInfo", reg);
			model.addAttribute("Useremail", Useremail);
			
			
			return "edit";
		}
		
//-----------------********		NAVIGATION TO Edit User & UPDATE Function 	STOP ********---------------------------------
	
		@RequestMapping("/editUser/{sessionEmail}/{userEmail}")
		public String goEditUserInDB(Model model, @PathVariable String sessionEmail, @PathVariable String userEmail, @RequestParam String userFirstName, String userLastName,String role) {
		
			String adminEmail = sessionEmail.trim();
						
			String formEmail = userEmail.trim();
			String formFirstName = userFirstName.trim();
			String formLastName = userLastName.trim();
			String formRole = role.trim();
			
			
			RegisterUser reg = new RegisterUser(formFirstName, formLastName, formRole);
			
			dao.editUser(formEmail, reg);
			
			model.addAttribute("confirmationMessage", "User's Detail modified successfully");
			
			if((dao.getRole(adminEmail).get(0)).equals("Admin"))
			{
				String firstNameStore = dao.getFirstName(adminEmail).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", adminEmail);
				
				model.addAttribute("allData", dao.getDataForAdmin(adminEmail));
				model.addAttribute("user", new RegisterUser());
				
				return "Admin/Admin";
			}
			else if((dao.getRole(adminEmail).get(0)).equals("Lawyer"))
			{
				String firstNameStore = dao.getFirstName(adminEmail).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", adminEmail );
				
				model.addAttribute("allDataForLawyer", dao.getDataForLawyer(adminEmail));
				
				return "Lawyer/Lawyer";
			}
			else {
				model.addAttribute("loginMess", "Bad Credentials. Please Re enter Your Password");
				model.addAttribute("registerUser", new RegisterUser());
				
				return "index";
			}
			
		}
		
//-----------------******* Edit User STOP *********---------------------------------

		
//-----------------******* Delete User START *********---------------------------------
	@RequestMapping(value = "/deleteAdmin/{email}/{Useremail}")	
	public String deleteAdminSide(Model model, @PathVariable String email, @PathVariable String Useremail) {
		
		if((dao.getRole(Useremail).get(0)).equals("Admin")) {
			
		dao.deleteUser(email);

		String firstNameStore = dao.getFirstName(Useremail).get(0);
		
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		
		model.addAttribute("allData", dao.getDataForAdmin(Useremail));
		model.addAttribute("message", "User Deleted Successfully");
		return "Admin/Admin";
		}
		else {
			model.addAttribute("loginMess", "Bad Credentials. Please Re-enter Your Login Credential");
			model.addAttribute("registerUser", new RegisterUser());
			
			return "index";
		}
	}
	
//-----------------******* Delete User END *********---------------------------------
	
	@RequestMapping(value = "/deletePayment/{Useremail}/{id}")	
	public String deletePayment(Model model, @PathVariable int id, @PathVariable String Useremail) {
		
		dao.deleteOrderById(id);

		List<Payment> pay = dao.getPaymentInfo(Useremail);
		model.addAttribute("paymentData", pay);
		
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		
		model.addAttribute("requestMessage", "Your Legal Form have successfully Deleted from the Cart");
		
		return "Customer/Payment";
	}

//-----------------********   Client Dashboard Side UI -- START********---------------------------------
	
	@RequestMapping(value = "/ClientSide/{Useremail}")	
	public String testingClientSide(Model model, @PathVariable String Useremail) {
		
		try {
		
		if((dao.getRole(Useremail).get(0)).equals("Client")) {
		
			List<LawyerDocEdit> docPrice = dao.getDocPrice();
			
			model.addAttribute("listOfAllForms", docPrice);
			
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		
		return "Customer/form";
		}
		
		else {
			model.addAttribute("logOutMess", "You DO NOT hold privileges to Edit Form Price");
			model.addAttribute("registerUser", new RegisterUser());
			
			return "index";
			
		}
		}
		catch (Exception e) {
			model.addAttribute("logOutMess", "Sorry But your Account Expired or got Deleted");
			model.addAttribute("registerUser", new RegisterUser());
			
			return "index";
		}
	}
	
//-----------------********   Client Side UI -- END********---------------------------------
	
//-----------------*******Navigation to Other Forms and Ppages*********---------------------------------
	
	@RequestMapping("/document/{Useremail}")
	public String goDocumentPage(Model model, @PathVariable String Useremail) {
		
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		
		return "Customer/document";
	}
	
	
	@RequestMapping("/form/{Useremail}")
	public String goFormPage(Model model, @PathVariable String Useremail) {
		
		if ((dao.getRole(Useremail).get(0)).equals("Client")) {
			
			List<LawyerDocEdit> docPrice = dao.getDocPrice();
			
			model.addAttribute("listOfAllForms", docPrice);
			
			
			// Regular Customer JSP EL tags needed code
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			// Needed for Customer JSP EL tags
			
			return "Customer/form";
			}
			else
			{
				model.addAttribute("logOutMess", "You DO NOT hold privileges to Edit Form Price");
				model.addAttribute("registerUser", new RegisterUser());
				
				return "index";
			}
	}
	
//-----------------*******End OF New Customer Side UI*********---------------------------------

	
//-----------------*******Legal Form STOP*********---------------------------------
	@RequestMapping("/legalDocumentFormMulti/{Useremail}")
	public String goLegalForm(Model model, @PathVariable String Useremail, @RequestParam List<String> legalForm) {
			
		String doc;
		String form;
		String price;
		
		
		for(int i=0; i <= legalForm.size()-1; i++)
		{
			String testForm = legalForm.get(i);
			
			int firstIndex = testForm.indexOf("^");
			int secondIndex = testForm.indexOf("^", firstIndex + 1);
			
			doc = testForm.substring(0, firstIndex);
			form = testForm.substring(firstIndex+1 , secondIndex);
			price = testForm.substring(secondIndex+1, testForm.length());
			
			dao.addPayment(new Payment(Useremail, doc, form, price));
		}
			
		
			List<LawyerDocEdit> docPrice = dao.getDocPrice();
			model.addAttribute("listOfAllForms", docPrice);
			
			List<Payment> pay = dao.getPaymentInfo(Useremail);
			model.addAttribute("paymentData", pay);
			
			// Regular Customer JSP EL tags needed code
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			// Needed for Customer JSP EL tags
			
			return "Customer/Payment";
	}
	
	@RequestMapping("/bookOfAuth/{Useremail}")
	public String goBookOfAuthority(Model model, @PathVariable String Useremail) {
			
			dao.addPayment(new Payment(Useremail, "Book of Authority", "50.00"));
		
			model.addAttribute("message", "Book of Authority requested Successfully");
			
			List<Payment> pay = dao.getPaymentInfo(Useremail);
			model.addAttribute("paymentData", pay);
			
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			
			return "Customer/Payment";
	}
	
	@RequestMapping("/factum/{Useremail}")
	public String goFactum(Model model, @PathVariable String Useremail) {
			
		dao.addPayment(new Payment(Useremail, "Factum", "55.00"));
			
		model.addAttribute("message", "Factum requested Successfully");
		
		List<Payment> pay = dao.getPaymentInfo(Useremail);
		model.addAttribute("paymentData", pay);
		
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			
			return "Customer/Payment";
	}
	
	@RequestMapping("/paymentPage/{Useremail}")
	public String goViewCart(Model model, @PathVariable String Useremail) {
			
			
			List<Payment> pay = dao.getPaymentInfo(Useremail);
			model.addAttribute("paymentData", pay);
			
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			
			
			
			return "Customer/Payment";
	}
//-----------------******* Redirect Third Party Pay START *********---------------------------------
	
	@RequestMapping("/pay/{id}/{Useremail}")
	public String goDeleteOrder(Model model, @PathVariable String Useremail, @PathVariable int id) {
			
			//dao.deleteOrderById(id);
		
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			
			List<Payment> pay = dao.getPaymentInfo(Useremail);
			model.addAttribute("paymentData", pay);
			
			model.addAttribute("requestMessage", "You have successfully Deleted that order");
			
			return "Customer/Payment";
	}
	
//-----------------********* Redirect Third Party Pay END*******---------------------------------

	
	
//-----------------********* General Registration Form  START *******---------------------------------

	@RequestMapping("/generalApplication/{Useremail}")	
	public String goGeneralApplication(Model model, @PathVariable String Useremail) {
	
		// Regular Code to send to General Application sos that Forms will work properly
		model.addAttribute("clientInfo", (generalDao.getclientInfoList(Useremail)));
		// Needed in order to work with general application form
		
		// Regular Customer JSP EL tags needed code
				String firstNameStore = dao.getFirstName(Useremail).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", Useremail);
		// Needed for Customer JSP EL tags
		
		// 	For Backup if Needed in case of emergency	
		
				
				return "Customer/GeneralApplication/ClientInfo";
	}
	
	
// First Class Saving Data to DAO method	
	@RequestMapping("/childExpense/{Useremail}")	
	public String goChildExpenses(Model model, @PathVariable String Useremail, @ModelAttribute ChildExpenses childExpenses) {
		synchronized (ChildExpenses.class) {
			generalDao.addChildExpenses(childExpenses);
		}
		
				// Regular Code to send to General Application sos that Forms will work properly
				model.addAttribute("childExpenses", (generalDao.getChildExpenses(Useremail)));
				// Needed in order to work with general application form
				
				// Regular Customer JSP EL tags needed code
						String firstNameStore = dao.getFirstName(Useremail).get(0);
						
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail);
						model.addAttribute("confirmationMessage", "Successfully Added/Changed Child Expenses Data");
				// Needed for Customer JSP EL tags
				
				return "Customer/GeneralApplication/ChildExpenses";
	}
// First Class Saving Data to DAO method __ END
	
// Second Class Saving Data to DAO method	
		@RequestMapping("/children/{Useremail}")	
		public String goChildren(Model model, @PathVariable String Useremail, @ModelAttribute Children children) {
			synchronized (Children.class) {
				generalDao.addChildren(children);
			}
			
					// Regular Code to send to General Application sos that Forms will work properly
					model.addAttribute("children", (generalDao.getChildren(Useremail)));
					// Needed in order to work with general application form
					
					// Regular Customer JSP EL tags needed code
							String firstNameStore = dao.getFirstName(Useremail).get(0);
							
							model.addAttribute("firstName", firstNameStore);
							model.addAttribute("Useremail", Useremail);
							model.addAttribute("confirmationMessage", "Successfully Added/Changed Children Data");
					// Needed for Customer JSP EL tags
					
					return "Customer/GeneralApplication/Children";
		}
// Second Class Saving Data to DAO method __ END
	
// Third Class Saving Data to DAO method	
				@RequestMapping("/clientInfo/{Useremail}")	
				public String goClientInfo(Model model, @PathVariable String Useremail, @ModelAttribute ClientInfo clientInfo) {
					//synchronized (ClientInfo.class) {
						generalDao.addClientInfo(clientInfo);
					//}
					
							// Regular Code to send to General Application sos that Forms will work properly
							model.addAttribute("clientInfo", (generalDao.getclientInfoList(Useremail)));
							// Needed in order to work with general application form
							
							// Regular Customer JSP EL tags needed code
									String firstNameStore = dao.getFirstName(Useremail).get(0);
									
									model.addAttribute("firstName", firstNameStore);
									model.addAttribute("Useremail", Useremail);
									model.addAttribute("confirmationMessage", "Successfully Added/Changed Client(Your) Info Data");
							// Needed for Customer JSP EL tags
							
							return "Customer/GeneralApplication/ClientInfo";
				}
// Third Class Saving Data to DAO method __ END
		
// Fourth Class Saving Data to DAO method	
				@RequestMapping("/maritalInfo/{Useremail}")	
				public String goMartialInfo(Model model, @PathVariable String Useremail, @ModelAttribute MartialInfo martialInfo) {
					synchronized (MartialInfo.class) {
						generalDao.addMartialInfo(martialInfo);
					}
					
							// Regular Code to send to General Application sos that Forms will work properly
							model.addAttribute("maritalInfo", (generalDao.getMartialInfo(Useremail)));
							// Needed in order to work with general application form
							
							// Regular Customer JSP EL tags needed code
									String firstNameStore = dao.getFirstName(Useremail).get(0);
									
									model.addAttribute("firstName", firstNameStore);
									model.addAttribute("Useremail", Useremail);
									model.addAttribute("confirmationMessage", "Successfully Added/Changed Martial Info Data");
							// Needed for Customer JSP EL tags
							
							return "Customer/GeneralApplication/MaritalInfo";
				}
// Fourth Class Saving Data to DAO method __ END				

// Fifth Class Saving Data to DAO method	
				@RequestMapping("/matrimonialHome/{Useremail}")	
				public String goMatrimonialHome(Model model, @PathVariable String Useremail, @ModelAttribute MatrimonialHome matrimonialHome) {
					synchronized (MatrimonialHome.class) {
						generalDao.addMatrimonialHome(matrimonialHome);
					}
					
							// Regular Code to send to General Application sos that Forms will work properly
							model.addAttribute("matrimonialHome", (generalDao.getMatrimonialHome(Useremail)));
							// Needed in order to work with general application form
							
							// Regular Customer JSP EL tags needed code
									String firstNameStore = dao.getFirstName(Useremail).get(0);
									
									model.addAttribute("firstName", firstNameStore);
									model.addAttribute("Useremail", Useremail);
									model.addAttribute("confirmationMessage", "Successfully Added/Changed Matrimonial Home Information Data");
							// Needed for Customer JSP EL tags
							
							return "Customer/GeneralApplication/MatrimonialHome";
				}
// Fifth Class Saving Data to DAO method __ END				
		
				// Sixth Class Saving Data to DAO method	
				@RequestMapping("/spouseInfo/{Useremail}")	
				public String goSpouseInfo(Model model, @PathVariable String Useremail, @ModelAttribute SpouseInfo spouseInfo) {
					synchronized (SpouseInfo.class) {
						generalDao.addSpouseInfo(spouseInfo);
					}
					
							// Regular Code to send to General Application sos that Forms will work properly
							model.addAttribute("spouseInfo", (generalDao.getSpouseInfo(Useremail)));
							// Needed in order to work with general application form
							
							// Regular Customer JSP EL tags needed code
									String firstNameStore = dao.getFirstName(Useremail).get(0);
									
									model.addAttribute("firstName", firstNameStore);
									model.addAttribute("Useremail", Useremail);
									model.addAttribute("confirmationMessage", "Successfully Added/Changed Spouse Information Data");
							// Needed for Customer JSP EL tags
							
							return "Customer/GeneralApplication/SpouseInfo";
				}
// Sixth Class Saving Data to DAO method __ END		
				
//-----------------********* General Registration Form  END *******---------------------------------

//-----------------******* Admin Editing Document and Form Price... START *********---------------------------------
				
				@RequestMapping("/editDocPrice/{Useremail}")
				public String goAdminEditPrice(Model model, @PathVariable String Useremail) {
					
						if ((dao.getRole(Useremail).get(0)).equals("Admin")) {
							
						List<LawyerDocEdit> docPrice = dao.getDocPrice();
						
						model.addAttribute("listOfAllForms", docPrice);
						
						
						// Regular Customer JSP EL tags needed code
						String firstNameStore = dao.getFirstName(Useremail).get(0);
						
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail);
						// Needed for Customer JSP EL tags
						
						return "Admin/DocumentEdit";
						}
						else
						{
							model.addAttribute("logOutMess", "You DO NOT hold privileges to Edit Form Price");
							model.addAttribute("registerUser", new RegisterUser());
							
							return "index";
						}
				}
				
				@RequestMapping("/editForm")
				public String goEditPriceForm(Model model, @RequestParam String Useremail, @RequestParam String id, @RequestParam String price, @RequestParam String sale) {
					
					
					int idDB = Integer.parseInt(id);
					double priceDB = Double.parseDouble(price);
					String saleDB = sale.trim();
					String formDB = dao.getFormInfo(idDB);
					String docDB = dao.getDocumentInfo(idDB);
					
					System.out.println(dao.getFormInfo(idDB));
					System.out.println(dao.getDocumentInfo(idDB));
					System.out.println(saleDB);
					
					LawyerDocEdit lawPrice = new LawyerDocEdit(docDB, formDB, priceDB, saleDB);
					
					/*
					RegisterUser reg = new RegisterUser(formFirstName, formLastName, formRole);
					
					dao.editUser(formEmail, reg);
					*/
					
					if ((dao.getRole(Useremail).get(0)).equals("Admin")) {
						
						if (dao.editFormPrice(idDB, lawPrice) == true)
						{	
					
							model.addAttribute("message", "Information Successfully Changed");
						// Required code to go back to DocumentEdit
						
						List<LawyerDocEdit> docPrice = dao.getDocPrice();
						
						model.addAttribute("listOfAllForms", docPrice);
						
						
						// Regular Customer JSP EL tags needed code
						String firstNameStore = dao.getFirstName(Useremail).get(0);
						
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail);
						// Needed for Customer JSP EL tags
						
						return "Admin/DocumentEdit";
						}
						else {
							model.addAttribute("message", "Information NOT Changed due to Error");
							// Required code to go back to DocumentEdit
							
							List<LawyerDocEdit> docPrice = dao.getDocPrice();
							
							model.addAttribute("listOfAllForms", docPrice);
							
							
							// Regular Customer JSP EL tags needed code
							String firstNameStore = dao.getFirstName(Useremail).get(0);
							
							model.addAttribute("firstName", firstNameStore);
							model.addAttribute("Useremail", Useremail);
							// Needed for Customer JSP EL tags
							
							return "Admin/DocumentEdit";
						}
					}
					else
					{
						model.addAttribute("logOutMess", "You DO NOT hold privileges to Edit Form Price");
						model.addAttribute("registerUser", new RegisterUser());
								
						return "index";
					}
				}
				
//-----------------********* Admin Editing Document and Form Price... END *******---------------------------------

	
//----**** ABOVE this PARAS Code*******---------------------------------

	
	
	

//----**** BELOW this PRODIP Code*******---------------------------------

//-----------------File View and Add --	START---------------------------------
	
	@RequestMapping(value = "/files/{folder_name}", method = RequestMethod.GET)
	public String getFolder(
			Model model,
			@PathVariable("folder_name") String folderName, 	
			HttpServletResponse response) 	
	{
		
		String Useremail = folderName;
		
		List<File> filelist = dao.getFileList(dao.getDirPath(folderName));		
	    List<String[]> fileinfo = compareWithFileDatabase(filelist);
		
	    model.addAttribute("filelist", filelist);
		model.addAttribute("fileinfo", fileinfo);
		
		model.addAttribute("presentDirectory", folderName);
		
		// Regular Customer JSP EL tags needed code
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		// Needed for Customer JSP EL tags
		
		return  "Admin/Files";
			
	  
	}
	@RequestMapping(value = "/uploadingDocLawyer/{folder_name}/{Useremail}")
	public String getFilesFromLawyer(
			Model model,
			@PathVariable("folder_name") String folderName, @PathVariable String Useremail,	
			HttpServletResponse response) 	
	{
		
		List<File> filelist = dao.getFileList(dao.getDirPath(folderName));		
	    List<String[]> fileinfo = compareWithFileDatabase(filelist);
		model.addAttribute("filelist", filelist);
		model.addAttribute("fileinfo", fileinfo);
		
		model.addAttribute("presentDirectory", folderName);
		
		// Regular Customer JSP EL tags needed code
				String firstNameStore = dao.getFirstName(Useremail).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", Useremail);
				// Needed for Customer JSP EL tags
		
		
		return  "Lawyer/uploadingDoc";
			
	  
	}
	@PostMapping("/upload/{folder_name}") // //new annotation since 4.3
    public String singleFileUpload(
    		Model model,
    		@RequestParam("file") MultipartFile file,
    		RedirectAttributes redirectAttributes,
    		@PathVariable("folder_name") String folderName) throws IOException 
	{

		//adding a file
        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:uploadStatus";
        }

        // Get the file and save it somewhere
		try {				
			String dir = dao.getDirPath( folderName );
			dao.addFile(file, dir, "uploader");		
			model.addAttribute("message",				
			        "You successfully uploaded '" + file.getOriginalFilename() + "'");				       
		} catch (Exception e) {		
			// TODO Auto-generated catch block		
			e.printStackTrace();		
			model.addAttribute("message",		
			        "Your file wasn't uploaded");		
		}
		// showing the list of file in the folder
		List<File> filelist = dao.getFileList(dao.getDirPath(folderName));		
	    List<String[]> fileinfo = compareWithFileDatabase(filelist);
			
						
		model.addAttribute("fileinfo", fileinfo);
		
		model.addAttribute("presentDirectory", folderName);
		model.addAttribute("filelist", filelist);
		System.out.println(fileinfo);
		
        return "Admin/Files";
    }
	@PostMapping("/uploadCustomer/{folder_name}") // //new annotation since 4.3
    public String singleFileUploadCustomer(
    		Model model,
    		@RequestParam("file") MultipartFile file,
    		RedirectAttributes redirectAttributes,
    		@PathVariable("folder_name") String folderName) throws IOException 
	{

		//adding a file
        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:uploadStatus";
        }

        // Get the file and save it somewhere
		try {				
			String dir = dao.getDirPath( folderName );
			dao.addFile(file, dir, "uploader");		
			model.addAttribute("message",				
			        "You successfully uploaded '" + file.getOriginalFilename() + "'");				       
		} catch (Exception e) {		
			// TODO Auto-generated catch block		
			e.printStackTrace();		
			model.addAttribute("message",		
			        "Your file wasn't uploaded");		
		}
		// showing the list of file in the folder
		List<File> filelist = dao.getFileList(dao.getDirPath(folderName));		
	    List<String[]> fileinfo = compareWithFileDatabase(filelist);
			
		// Regular Customer JSP EL tags needed code
		String firstNameStore = dao.getFirstName(folderName).get(0);
		
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", folderName);
		// Needed for Customer JSP EL tags
		
	    
	    
		model.addAttribute("fileinfo", fileinfo);
		
		model.addAttribute("presentDirectory", folderName);
		model.addAttribute("filelist", filelist);
		System.out.println(fileinfo);
		
        return "Customer/uploadDocument";
    }
	@PostMapping("/uploadLawyer/{folder_name}") // //new annotation since 4.3
    public String singleFileUploadLawyer(
    		Model model,
    		@RequestParam("file") MultipartFile file,
    		RedirectAttributes redirectAttributes,
    		@PathVariable("folder_name") String folderName) throws IOException 
	{

		//adding a file
        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:uploadStatus";
        }

        // Get the file and save it somewhere
		try {				
			String dir = dao.getDirPath( folderName );
			dao.addFile(file, dir, "uploader");		
			model.addAttribute("message",				
			        "You successfully uploaded '" + file.getOriginalFilename() + "'");				       
		} catch (Exception e) {		
			// TODO Auto-generated catch block		
			e.printStackTrace();		
			model.addAttribute("message",		
			        "Your file wasn't uploaded");		
		}
		// showing the list of file in the folder
		List<File> filelist = dao.getFileList(dao.getDirPath(folderName));		
	    List<String[]> fileinfo = compareWithFileDatabase(filelist);
			
						
		model.addAttribute("fileinfo", fileinfo);
		
		model.addAttribute("presentDirectory", folderName);
		model.addAttribute("filelist", filelist);
		System.out.println(fileinfo);
		
		// Regular Customer JSP EL tags needed code
		String firstNameStore = dao.getFirstName(folderName).get(0);
		
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", folderName);
		// Needed for Customer JSP EL tags

		
        return "Lawyer/uploadingDoc";
    }

	
	
	@RequestMapping(value = "/download", method = RequestMethod.POST )
	public void FileSystemResource (
			
			Model model,
			HttpServletRequest request,
            HttpServletResponse response,
            @RequestHeader String referer,
			@RequestParam("filename") String filename,
    		@RequestParam("foldername") String dirname
    		
    		) 
    				throws IOException 
	{
		// to prevent hotlinking a file
		if(referer != null && !referer.isEmpty()) {
            //do nothing
            //or send error
        }
        //If user is not authorized - he should be thrown out from here itself
         
        //Authorized user will download the file
		String dataDirectory = dao.getDirPath(dirname) ;
        Path file = Paths.get(dataDirectory, filename);
        if (Files.exists(file))
        {
            response.addHeader("Content-Disposition", "attachment; filename="+filename);
            try
            {
                Files.copy(file, response.getOutputStream());
                response.getOutputStream().flush();
                
            }
            catch (IOException ex) {
                ex.printStackTrace();
            }
        } 
        else {
        	
        }
		
		
	}
	@RequestMapping("/goToCustomerUpload/{folder_name}") // //new annotation since 4.3
    public String goToUploadCustomer(
    		Model model,
    		RedirectAttributes redirectAttributes,
    		@PathVariable("folder_name") String folderName) throws IOException 
	{

		//adding a file
       		// showing the list of file in the folder
		List<File> filelist = dao.getFileList(dao.getDirPath(folderName));		
	    List<String[]> fileinfo = compareWithFileDatabase(filelist);
			
						
		model.addAttribute("fileinfo", fileinfo);
		
		model.addAttribute("presentDirectory", folderName);
		model.addAttribute("filelist", filelist);
		System.out.println(fileinfo);
		
		// Regular Customer JSP EL tags needed code
				String firstNameStore = dao.getFirstName(folderName).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", folderName);
				// Needed for Customer JSP EL tags
		
        return "Customer/uploadDocument";
    }

	private List<String[]> compareWithFileDatabase(List<File> filelist) {
		// TODO Auto-generated method stub
		List<String[]> fileinfo = new ArrayList<String[]>();		
	    try {		
			for (File f : filelist) {		
				
				try {
					if( dao.getFileInfo( f.getName() )!=null ) {
						fileinfo.add( dao.getFileInfo(  f.getName()  ) );
					}else {
						fileinfo.add(new String[] {f.getName(), "", "" , "" } );
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}	
			}
		}catch (Exception ex){
			ex.printStackTrace();
			return new  ArrayList<String[]>();
		}
		return fileinfo;
	}

			
//-----------------File View and Add --	END---------------------------------

	
	
//----**** ABOVE this PRODIP Code*******---------------------------------
			
	
	
	
	

	
	
}