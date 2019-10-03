package ca.sheridancollege;

import java.text.*;
import java.util.*;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import ca.sheridancollege.beans.*;
import ca.sheridancollege.dao.*;

@Controller
public class HomeController {

	Dao dao = new Dao();
	
	
// ****  Navigation between Pages  ***
	
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
	
// ****  Navigation between Pages 	**END**   ***
	
	
//-----------------********		REGISTER   START	********---------------------------------
	
	@RequestMapping("/register1")
	public String goRegister(Model model, @ModelAttribute RegisterUser registerUser) {
		
			String email = registerUser.getEmail();
			
			
			if(dao.addUser(registerUser)==true) {
				model.addAttribute("message", "You have Successfully Created your Account");
				model.addAttribute("successMessage", "Please Login in with your credentials");
				 
				 
				model.addAttribute("registerUser", new RegisterUser());
				// Empty the field in form and sends it to register page
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
			if((dao.getRole(email, password).get(0)).equals("Admin"))
			{
				String firstNameStore = dao.getFirstName(email).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", email );
				model.addAttribute("UserPassword", password);
				model.addAttribute("allData", dao.getDataForAdmin(email));
				
				return "Admin/Admin";
			}
			else if((dao.getRole(email, password).get(0)).equals("Client"))
			{
				String firstNameStore = dao.getFirstName(email).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", email );
				model.addAttribute("UserPassword", password );
				
				return "Customer/Customer";
			}
			else if((dao.getRole(email, password).get(0)).equals("Lawyer"))
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
	
	@RequestMapping("/dashboard/{Useremail}/{UserPassword}")
	public String goDashbaord(Model model, @PathVariable String Useremail, @PathVariable String UserPassword) {
		
		
			if((dao.getRole(Useremail, UserPassword).get(0)).equals("Admin"))
			{
				String firstNameStore = dao.getFirstName(Useremail).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", Useremail);
				model.addAttribute("UserPassword", UserPassword);
				
				model.addAttribute("allData", dao.getDataForAdmin(Useremail));
				model.addAttribute("user", new RegisterUser());
				
				return "Admin/Admin";
			}
			else if((dao.getRole(Useremail, UserPassword).get(0)).equals("Lawyer"))
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
			
			String fName = dao.getFirstName(email).get(0);
			String lName = dao.getLastName(email).get(0);
			
			
			model.addAttribute("email", email);
			model.addAttribute("firstName",fName);
			model.addAttribute("lastName", lName);
			
			model.addAttribute("Useremail", Useremail);
			model.addAttribute("UserPassword", UserPassword);
			
			return "edit";
		}
		/*
		@RequestMapping("/editUser")
		public String goEditUser(Model model, @RequestAttribute sessionEmail, @RequestAttribute sessionPassword, @RequestParam email,@RequestParam firstName, @RequestParam lastName, @RequestParam role) {
		
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			model.addAttribute("firstName", firstNameStore);
			
			String fName = dao.getFirstName(email).get(0);
			String lName = dao.getLastName(email).get(0);
			
			
			model.addAttribute("email", email);
			model.addAttribute("firstName",fName);
			model.addAttribute("lastName", lName);
			
			model.addAttribute("Useremail", Useremail);
			model.addAttribute("UserPassword", UserPassword);
			
			return "edit";
		}
		*/
//-----------------****************---------------------------------

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

	@RequestMapping(value = "/MainPage/{Useremail}/{UserPassword}")	
	public String goMainPage(Model model, @PathVariable String Useremail, @PathVariable String UserPassword, @RequestParam String documentValue) {
		
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		model.addAttribute("UserPassword", UserPassword);

		model.addAttribute("requestMessage", "You have successfully Requested those Legal Document");
		
		return "Customer/Customer";
	}
	
//-----------------*******Processing Requests STOP *********---------------------------------
	
//-----------------****************---------------------------------

		
	//-----------------****************---------------------------------
			
//-----------------****************---------------------------------

//-----------------****************---------------------------------
			
			
}
