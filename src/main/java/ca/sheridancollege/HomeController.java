
package ca.sheridancollege;

import java.io.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import ca.sheridancollege.beans.*;
import ca.sheridancollege.dao.*;

@Controller
public class HomeController {

	Dao dao = new Dao();
	FileDao fileDao = new FileDao();
	
	
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
	
	@RequestMapping("/admin")
	public String goAdminPage(Model model, @ModelAttribute RegisterUser registerUser) {
		model.addAttribute("registerUser", new RegisterUser());
		
		return "Admin/Admin";
	}
	
	@RequestMapping("/logout")
	public String goLogOut(Model model) {
			
		model.addAttribute("logOutMess", "Thanks for using our services. See you again soon.");
		model.addAttribute("registerUser", new RegisterUser());
		
		return "index";
	}
	
	
	@RequestMapping("/LegalDoc")
	public String goLegalDoc(Model model, @RequestParam String userNameStore) {
		model.addAttribute("userNameStore", userNameStore );
		
		return "LegalDocument";
	}
	
	
	@RequestMapping("/LegalForm")
	public String goLegalForm(Model model, @RequestParam String userNameStore) {
		
		return "legalForm";
	}

	
	@RequestMapping("/legalDocumentForm")
	public String goLegalDocument(Model model) {
			
			return "Customer/SelectService";
	}
	
	@RequestMapping("/files")
	public String goFilesDir(Model model, @ModelAttribute String location) {
			if(location.equals(null) || location.equals("")){
				location = "";
			}
			
			List<File> filelist = fileDao.getFileList(location);
			model.addAttribute("filelist", filelist);
			
			return "Admin/Files";
	}
	
	
// ****  Navigation between Pages 	END ***
	
	
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
				if(fileDao.createFolder(registerUser))
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
		
		if(dao.getEmail(email).isEmpty())
		{
			model.addAttribute("loginMess", "Your Account DOES NOT Exists. Please Register First");
			model.addAttribute("registerUser", new RegisterUser());
			
			return "index";
		}
		else {
			if((dao.getRole(email).get(0)).equals("Admin"))
			{
				String firstNameStore = dao.getFirstName(email).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", email );
				model.addAttribute("UserPassword", password);
				model.addAttribute("allData", dao.getDataForAdmin(email));
				
				return "Admin/Admin";
			}
			else if((dao.getRole(email).get(0)).equals("Client"))
			{
				String firstNameStore = dao.getFirstName(email).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", email );
				model.addAttribute("UserPassword", password );
				
				return "Customer/Customer";
			}
			else if((dao.getRole(email).get(0)).equals("Lawyer"))
			{
				String firstNameStore = dao.getFirstName(email).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", email );
				model.addAttribute("UserPassword", password);
				
				model.addAttribute("allDataForLawyer", dao.getDataForLawyer(email));
				
				return "Lawyer/Lawyer";
			}
			else {
				model.addAttribute("loginMess", "Bad Credentials. Please Re enter Your Password");
				model.addAttribute("registerUser", new RegisterUser());
				
				return "index";
			}
			
		}
		
	}
//-----------------********		LOGIN	END		********---------------------------------
	
	
//-----------------********		Admin or Lawyer	Dashboard START		********---------------------------------
	
	@RequestMapping("/dashboard/{Useremail}/{UserPassword}")
	public String goDashbaord(Model model, @PathVariable String Useremail, @PathVariable String UserPassword) {
		
		
			if((dao.getRole(Useremail).get(0)).equals("Admin"))
			{
				String firstNameStore = dao.getFirstName(Useremail).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", Useremail);
				model.addAttribute("UserPassword", UserPassword);
				
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
				model.addAttribute("UserPassword", UserPassword);
				
				return "Lawyer/Lawyer";
			}
			else {
				model.addAttribute("loginMess", "Bad Credentials. Please Re enter Your Password");
				model.addAttribute("registerUser", new RegisterUser());
				
				return "index";
			}
			
		}
//-----------------********		Admin or Lawyer	Dashboard STOP		********---------------------------------
	
	
//-----------------********		NAVIGATION TO DETAILS 	********---------------------------------
	@RequestMapping("/details/{email}/{Useremail}/{UserPassword}")
	public String goDetails(Model model, @PathVariable String email, @PathVariable String Useremail, @PathVariable String UserPassword) {
	
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		model.addAttribute("firstName", firstNameStore);
		
		
		model.addAttribute("email", email);
		model.addAttribute("Useremail", Useremail);
		model.addAttribute("UserPassword", UserPassword);
		
		return "details";
	}
	
	
//-----------------********		NAVIGATION TO Edit User & UPDATE Function 	********---------------------------------
		@RequestMapping("/edit/{email}/{Useremail}/{UserPassword}")
		public String goEditUser(Model model, @PathVariable String email, @PathVariable String Useremail, @PathVariable String UserPassword) {
		
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			model.addAttribute("firstName", firstNameStore);
			
			RegisterUser reg = dao.getUser(email); 
			/*
			String fName = dao.getFirstName(email).get(0);
			String lName = dao.getLastName(email).get(0);
			
			
			model.addAttribute("email", email);
			model.addAttribute("firstName",fName);
			model.addAttribute("lastName", lName);
			*/
			
			model.addAttribute("userInfo", reg);
			model.addAttribute("Useremail", Useremail);
			model.addAttribute("UserPassword", UserPassword);
			
			
			return "edit";
		}
		
		
//-----------------********		NAVIGATION TO Edit User & UPDATE Function 	STOP ********---------------------------------
		@RequestMapping("/editUser/{sessionEmail}/{sessionPassword}/{userEmail}")
		public String goEditUserInDB(Model model, @PathVariable String sessionEmail, @PathVariable String sessionPassword, @PathVariable String userEmail, @RequestParam String userFirstName, String userLastName,String role) {
		
			String adminEmail = sessionEmail.trim();
			String adminPassword = sessionPassword.trim();
			
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
				model.addAttribute("UserPassword", adminPassword);
				
				model.addAttribute("allData", dao.getDataForAdmin(adminEmail));
				model.addAttribute("user", new RegisterUser());
				
				return "Admin/Admin";
			}
			else if((dao.getRole(adminEmail).get(0)).equals("Lawyer"))
			{
				String firstNameStore = dao.getFirstName(adminEmail).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", adminEmail );
				model.addAttribute("UserPassword", adminPassword);
				
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
	@RequestMapping(value = "/deleteAdmin/{email}/{Useremail}/{UserPassword}")	
	public String deleteAdminSide(Model model, @PathVariable String email, @PathVariable String Useremail, @PathVariable String UserPassword) {
		
		dao.deleteUser(email);

		String firstNameStore = dao.getFirstName(Useremail).get(0);
		
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		model.addAttribute("UserPassword", UserPassword);
		
		model.addAttribute("allData", dao.getDataForAdmin(Useremail));
		model.addAttribute("confirmationMessage", "User Deleted Successfully");
		return "Admin/Admin";
	}
//-----------------******* Delete User START *********---------------------------------
	
	@RequestMapping(value = "/deletePayment/{Useremail}/{UserPassword}/{id}")	
	public String deletePayment(Model model, @PathVariable int id, @PathVariable String Useremail, @PathVariable String UserPassword) {
		
		dao.deleteOrderById(id);

		List<Payment> pay = dao.getPaymentInfo(Useremail);
		model.addAttribute("paymentData", pay);
		
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		model.addAttribute("UserPassword", UserPassword);

		model.addAttribute("requestMessage", "Your Legal Form have successfully Deleted from the Cart");
		
		return "Customer/Payment";
	}

//-----------------******** Testing New Client Side UI ********---------------------------------
	@RequestMapping(value = "/ClientSide/{Useremail}/{UserPassword}")	
	public String testingClientSide(Model model, @PathVariable String Useremail, @PathVariable String UserPassword) {
		
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		model.addAttribute("UserPassword", UserPassword);
		
		return "Customer/Customer";
	}
	
	
//-----------------*******Navigation to Other Forms and Ppages*********---------------------------------
	
	@RequestMapping("/document/{Useremail}/{UserPassword}")
	public String goDocumentPage(Model model, @PathVariable String Useremail, @PathVariable String UserPassword) {
		
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		model.addAttribute("UserPassword", UserPassword);
		
		
		return "Customer/document";
	}
	
	
	@RequestMapping("/form/{Useremail}/{UserPassword}")
	public String goFormPage(Model model, @PathVariable String Useremail, @PathVariable String UserPassword) {
		
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		model.addAttribute("UserPassword", UserPassword);
		
		
		return "Customer/form";
	}
	
//-----------------*******End OF New Customer Side UI*********---------------------------------

//-----------------*******Processing Requests START *********---------------------------------

//	@RequestMapping(value = "/MainPage/{Useremail}/{UserPassword}")	
//	public String goMainPage(Model model, @PathVariable String Useremail, @PathVariable String UserPassword, @RequestParam String documentValue) {
//		
//		String firstNameStore = dao.getFirstName(Useremail).get(0);
//		
//		model.addAttribute("firstName", firstNameStore);
//		model.addAttribute("Useremail", Useremail);
//		model.addAttribute("UserPassword", UserPassword);
//
//		model.addAttribute("requestMessage", "You have successfully Requested those Legal Document");
//		
//		return "Customer/Customer";
//	}
	
//-----------------*******Processing Requests STOP *********---------------------------------
	
//-----------------******Legal Form START**********---------------------------------
	
//	@RequestMapping(value = "/legalDocumentFormMulti/{Useremail}/{UserPassword}")	
//	public String goMainPage(Model model, @PathVariable String Useremail, @PathVariable String UserPassword, @RequestParam String documentValue) {
//		
//		String firstNameStore = dao.getFirstName(Useremail).get(0);
//		
//		model.addAttribute("firstName", firstNameStore);
//		model.addAttribute("Useremail", Useremail);
//		model.addAttribute("UserPassword", UserPassword);
//
//		model.addAttribute("requestMessage", "You have successfully Requested those Legal Document");
//		
//		return "Customer/Customer";
//	}
	
//-----------------*******Legal Form STOP*********---------------------------------
	@RequestMapping("/legalDocumentFormMulti/{Useremail}")
	public String goLegalForm(Model model, @PathVariable String Useremail, @RequestParam List<String> legalForm, @RequestParam String legalFormType) {
			
			//System.out.println("Test --> "+legalForm);
			for(int i=0; i <= legalForm.size()-1; i++)
			{
				String testForm = legalForm.get(i);
				
				String testDoc = legalFormType;
				String testPrice = testForm.substring(testForm.length()-2, testForm.length());
				String formType = testForm.substring(0, testForm.length()-2);
				
				
				System.out.println("Test Loop-->" + " " + testPrice+ " " + testDoc + " " + formType);
				
				dao.addPayment(new Payment(Useremail, testDoc, testPrice, formType));
			}
			
			List<Payment> pay = dao.getPaymentInfo(Useremail);
			model.addAttribute("paymentData", pay);
			
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			

			model.addAttribute("requestMessage", "You have successfully Requested those Legal Form");
			
			return "Customer/Payment";
	}
	
	@RequestMapping("/paymentPage/{Useremail}/{UserPassword}")
	public String goViewCart(Model model, @PathVariable String Useremail, @PathVariable String UserPassword) {
			
			
			List<Payment> pay = dao.getPaymentInfo(Useremail);
			model.addAttribute("paymentData", pay);
			
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			model.addAttribute("UserPassword", UserPassword);

			//model.addAttribute("requestMessage", "You have successfully Requested those Legal Form");
			
			return "Customer/Payment";
	}
//-----------------******* Redirect Third Party Pay START *********---------------------------------
	
	@RequestMapping("/pay/{id}/{Useremail}/{UserPassword}")
	public String goDeleteOrder(Model model, @PathVariable String Useremail, @PathVariable String UserPassword, @PathVariable int id) {
			
			dao.deleteOrderById(id);
		
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			model.addAttribute("UserPassword", UserPassword);
			
			List<Payment> pay = dao.getPaymentInfo(Useremail);
			model.addAttribute("paymentData", pay);
			
			model.addAttribute("requestMessage", "You have successfully Deleted that order");
			
			return "Customer/Payment";
	}
	
//-----------------********* Redirect Third Party Pay START *******---------------------------------

		
	//-----------------File View and Add---------------------------------
	
	@RequestMapping(value = "/files/{folder_name}", method = RequestMethod.GET)
	public String getFolder(
			Model model,
			@PathVariable("folder_name") String folderName, 	
			HttpServletResponse response) 	
	{
		Set<String> dirSet = null;;
		FileDao fileDao= new FileDao();
		try {
			dirSet = fileDao.listFilesUsingFileWalkAndVisitor(
					fileDao.getDirPath( folderName )
					);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("dirSet", dirSet);
		return  "Admin/Files";
			
	  
	}
			
//-----------------****************---------------------------------

//-----------------****************---------------------------------
			

}
	
	
	