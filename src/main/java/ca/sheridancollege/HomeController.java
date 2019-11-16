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
	
	
//***************___Navigation between Pages -- START******************
	
//	@RequestMapping("/error")
//	public String goError(Model model) {
//		model.addAttribute("registerUser", new RegisterUser());
//		
//		model.addAttribute("logOutMess", "You are trying to access things which are out of your limit");
//		
//		return "index";
//	}
	
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
	
	@RequestMapping("/about")
	public String about(Model model, @ModelAttribute RegisterUser user) {

		return "About";
	}
	
	@RequestMapping("/logout")
	public String goLogOut(Model model) {
			
		model.addAttribute("logOutMess", "Thanks for using our services. See you again soon.");
		model.addAttribute("registerUser", new RegisterUser());
		
		return "index";
	}
				
	@RequestMapping("/edit/{email}/{Useremail}")
	public String goEditUser(Model model, @PathVariable String email, @PathVariable String Useremail) {
				
		RegisterUser reg = dao.getUser(email); 
		model.addAttribute("userInfo", reg);
		
		// Code to required to go to other pages
		model.addAttribute("notiList", dao.getList());
		model.addAttribute("count", dao.getList().size());
		
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		String role = dao.getRole(Useremail).get(0);
		model.addAttribute("role", role);
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		
		return "edit";
	}
	
	@RequestMapping("/settings/{Useremail}")
	public String clientSettings(Model model, @PathVariable String Useremail) {
		
		RegisterUser reg = dao.getUser(Useremail); 
		model.addAttribute("userInfo", reg);
		
		// Code to required to go to other pages
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
				
		return "Settings";
	}
	
	@RequestMapping("/Lawsettings/{Useremail}")
	public String lawyerSetting(Model model, @PathVariable String Useremail) {
		
		RegisterUser reg = dao.getUser(Useremail); 
		model.addAttribute("userInfo", reg);
		
		// Code to required to go to other pages
		model.addAttribute("notiList", dao.getList());
		model.addAttribute("count", dao.getList().size());
		
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
				
		return "Lawyer/LawSettings";
	}
	
	@RequestMapping("/paymentPage/{Useremail}")
	public String goViewCart(Model model, @PathVariable String Useremail) {
			
			List<Payment> pay = dao.getPaymentInfo(Useremail);
			model.addAttribute("paymentData", pay);
			
			// Code to required to go to other pages
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			
			ArrayList<String> clientList = dao.getClientList();
			ArrayList<String> list = new ArrayList<String>();				
			for(int i=0; i < clientList.size(); i++)
			{
				if (clientList.get(i).indexOf(Useremail) != -1) {
					list.add(clientList.get(i));
					System.out.println("Noti Test o/p -> " + clientList.get(i));
					System.out.println("Noti Test o/p -> " + list);
					System.out.println("Noti Test o/p -> " + list.size());
					
				}
			}
			model.addAttribute("clientList", list);
			model.addAttribute("countClient", list.size());
			
			return "Customer/Payment";
	}
	
//-------- 	Navigation to General Application Client Side __ START  -----------			
	@RequestMapping("/navclientInfo/{Useremail}")	
	public String navClientInfo(Model model, @PathVariable String Useremail) {
		
				model.addAttribute("clientInfo", (generalDao.getclientInfoList(Useremail)));
				
				// Code to required to go to other pages
				String firstNameStore = dao.getFirstName(Useremail).get(0);	
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", Useremail);
				
				ArrayList<String> clientList = dao.getClientList();
				ArrayList<String> list = new ArrayList<String>();				
				for(int i=0; i < clientList.size(); i++)
				{
					if (clientList.get(i).indexOf(Useremail) != -1) {
						list.add(clientList.get(i));
						System.out.println("Noti Test o/p -> " + clientList.get(i));
						System.out.println("Noti Test o/p -> " + list);
						System.out.println("Noti Test o/p -> " + list.size());
						
					}
				}
				return "Customer/GeneralApplication/ClientInfo";
	}
	
	@RequestMapping("/navspouseInfo/{Useremail}")	
	public String navSpouseInfo(Model model, @PathVariable String Useremail) {
		
		model.addAttribute("spouseInfo", (generalDao.getSpouseInfo(Useremail)));
				
		// Code to required to go to other pages
		String firstNameStore = dao.getFirstName(Useremail).get(0);				
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		
		ArrayList<String> clientList = dao.getClientList();
		ArrayList<String> list = new ArrayList<String>();				
		for(int i=0; i < clientList.size(); i++)
		{
			if (clientList.get(i).indexOf(Useremail) != -1) {
				list.add(clientList.get(i));
				System.out.println("Noti Test o/p -> " + clientList.get(i));
				System.out.println("Noti Test o/p -> " + list);
				System.out.println("Noti Test o/p -> " + list.size());
				
			}
		}
		return "Customer/GeneralApplication/SpouseInfo";
	}
	
	@RequestMapping("/navmaritalInfo/{Useremail}")	
	public String navMaritalInfo(Model model, @PathVariable String Useremail) {
		
		model.addAttribute("maritalInfo", (generalDao.getMartialInfo(Useremail)));
		
		// Code to required to go to other pages
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		
		ArrayList<String> clientList = dao.getClientList();
		ArrayList<String> list = new ArrayList<String>();				
		for(int i=0; i < clientList.size(); i++)
		{
			if (clientList.get(i).indexOf(Useremail) != -1) {
				list.add(clientList.get(i));
				System.out.println("Noti Test o/p -> " + clientList.get(i));
				System.out.println("Noti Test o/p -> " + list);
				System.out.println("Noti Test o/p -> " + list.size());
				
			}
		}
		return "Customer/GeneralApplication/MaritalInfo";
	}
	
	@RequestMapping("/navmatrimonialHome/{Useremail}")	
	public String navMatrimonialHome(Model model, @PathVariable String Useremail) {

		model.addAttribute("matrimonialHome", (generalDao.getMatrimonialHome(Useremail)));

		// Code to required to go to other pages
		String firstNameStore = dao.getFirstName(Useremail).get(0);				
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		
		ArrayList<String> clientList = dao.getClientList();
		ArrayList<String> list = new ArrayList<String>();				
		for(int i=0; i < clientList.size(); i++)
		{
			if (clientList.get(i).indexOf(Useremail) != -1) {
				list.add(clientList.get(i));
				System.out.println("Noti Test o/p -> " + clientList.get(i));
				System.out.println("Noti Test o/p -> " + list);
				System.out.println("Noti Test o/p -> " + list.size());
				
			}
		}
		return "Customer/GeneralApplication/MatrimonialHome";
	}
	
	@RequestMapping("/navchildren/{Useremail}")	
	public String navChildren(Model model, @PathVariable String Useremail) {

		model.addAttribute("children", (generalDao.getChildren(Useremail)));

		// Code to required to go to other pages
		String firstNameStore = dao.getFirstName(Useremail).get(0);						
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		
		ArrayList<String> clientList = dao.getClientList();
		ArrayList<String> list = new ArrayList<String>();				
		for(int i=0; i < clientList.size(); i++)
		{
			if (clientList.get(i).indexOf(Useremail) != -1) {
				list.add(clientList.get(i));
				System.out.println("Noti Test o/p -> " + clientList.get(i));
				System.out.println("Noti Test o/p -> " + list);
				System.out.println("Noti Test o/p -> " + list.size());
				
			}
		}
		return "Customer/GeneralApplication/Children";
	}
	
	
	@RequestMapping("/navchildExpense/{Useremail}")	
	public String navChildExpenses(Model model, @PathVariable String Useremail) {
		
		model.addAttribute("childExpenses", (generalDao.getChildExpenses(Useremail)));

		// Code to required to go to other pages
		String firstNameStore = dao.getFirstName(Useremail).get(0);				
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		
		ArrayList<String> clientList = dao.getClientList();
		ArrayList<String> list = new ArrayList<String>();				
		for(int i=0; i < clientList.size(); i++)
		{
			if (clientList.get(i).indexOf(Useremail) != -1) {
				list.add(clientList.get(i));
				System.out.println("Noti Test o/p -> " + clientList.get(i));
				System.out.println("Noti Test o/p -> " + list);
				System.out.println("Noti Test o/p -> " + list.size());
				
			}
		}
		return "Customer/GeneralApplication/ChildExpenses";
	}
//------ Navigation to General Application Client Side __ END  ------		
	
	
//-----	Navigation to Other Forms, Documents __ START  -----------		
		@RequestMapping("/document/{Useremail}")
		public String goDocumentPage(Model model, @PathVariable String Useremail) {
			
			// Code to required to go to other pages
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("role", dao.getRole(Useremail).get(0));
			model.addAttribute("Useremail", Useremail);
			
			ArrayList<String> clientList = dao.getClientList();
			ArrayList<String> list = new ArrayList<String>();				
			for(int i=0; i < clientList.size(); i++)
			{
				if (clientList.get(i).indexOf(Useremail) != -1) {
					list.add(clientList.get(i));
					System.out.println("Noti Test o/p -> " + clientList.get(i));
					System.out.println("Noti Test o/p -> " + list);
					System.out.println("Noti Test o/p -> " + list.size());
				}
			}
			
			model.addAttribute("clientList", list);
			model.addAttribute("countClient", list.size());
			
			return "Customer/document";
		}
		
		
		@RequestMapping("/form/{Useremail}")
		public String goFormPage(Model model, @PathVariable String Useremail) {
			
			if ((dao.getRole(Useremail).get(0)).equals("Client")) {
				
				List<LawyerDocEdit> docPrice = dao.getDocPrice();
				model.addAttribute("listOfAllForms", docPrice);
				
				// Code to required to go to other pages
				String firstNameStore = dao.getFirstName(Useremail).get(0);
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", Useremail);
				
				ArrayList<String> clientList = dao.getClientList();
				ArrayList<String> list = new ArrayList<String>();				
				for(int i=0; i < clientList.size(); i++)
				{
					if (clientList.get(i).indexOf(Useremail) != -1) {
						list.add(clientList.get(i));
						System.out.println("Noti Test o/p -> " + clientList.get(i));
						System.out.println("Noti Test o/p -> " + list);
						System.out.println("Noti Test o/p -> " + list.size());
						
					}
				}
				model.addAttribute("clientList", list);
				model.addAttribute("countClient", list.size());
				
				//model.addAttribute("clientList", dao.getClientList());
				//model.addAttribute("countClient", dao.getClientList().size());
				
				return "Customer/form";
				}
				else
				{
					model.addAttribute("logOutMess", "You DO NOT hold privileges to View this Page");
					model.addAttribute("registerUser", new RegisterUser());
					
					return "index";
				}
		}
//-------- 	Navigation to Other Forms, Documents __ STOP  -----------	


//-------- 	Navigation to Document Price Edit __ START  -----------		
		@RequestMapping("/docEdit/{Useremail}")
		public String goLegalDocumentEdit(Model model, @PathVariable String Useremail) {
		
			if((dao.getRole(Useremail).get(0)).equals("Admin")) {
				
				String firstNameStore = dao.getFirstName(Useremail).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", Useremail);
				
				return "Admin/DocumentEdit";
				}
				else {
					model.addAttribute("logOutMess", "You DO NOT hold privileges to View this page");
					model.addAttribute("registerUser", new RegisterUser());
					
					return "index";		
				}
		}
//-------- 	Navigation to Document Price Edit __ END  -----------	

		
//-------- 	Dash board __ START  -----------					
			@RequestMapping("/dashboard/{Useremail}")
			public String goDashbaord(Model model, @PathVariable String Useremail) {
				
				try {	
					if((dao.getRole(Useremail).get(0)).equals("Admin"))
					{
						model.addAttribute("allData", dao.getDataForAdmin(Useremail));
						model.addAttribute("user", new RegisterUser());
						
						String firstNameStore = dao.getFirstName(Useremail).get(0);			
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail);
											
						model.addAttribute("notiList", dao.getList());
						model.addAttribute("count", dao.getList().size());
						
						return "Admin/Admin";
					}
					else if((dao.getRole(Useremail).get(0)).equals("Lawyer"))
					{
						model.addAttribute("allDataForLawyer", dao.getDataForLawyer(Useremail));
						
						String firstNameStore = dao.getFirstName(Useremail).get(0);
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail );
											
						model.addAttribute("notiList", dao.getList());
						model.addAttribute("count", dao.getList().size());
						
						return "Lawyer/Lawyer";
					}
					else if((dao.getRole(Useremail).get(0)).equals("Client")) {
						
						List<LawyerDocEdit> docPrice = dao.getDocPrice();				
						model.addAttribute("listOfAllForms", docPrice);
											
						String firstNameStore = dao.getFirstName(Useremail).get(0);			
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail);
						
						ArrayList<String> clientList = dao.getClientList();
						ArrayList<String> list = new ArrayList<String>();				
						for(int i=0; i < clientList.size(); i++)
						{
							if (clientList.get(i).indexOf(Useremail) != -1) {
								list.add(clientList.get(i));
								System.out.println("Noti Test o/p -> " + clientList.get(i));
								System.out.println("Noti Test o/p -> " + list);
								System.out.println("Noti Test o/p -> " + list.size());
								
							}
						}
						model.addAttribute("clientList", list);
						model.addAttribute("countClient", list.size());
						
						return "Customer/form";
					}
					else {
						model.addAttribute("loginMess", "You DO NOT hold privileges to View that Page");
						model.addAttribute("registerUser", new RegisterUser());
						
						return "index";
					}
				}
				catch (Exception e) {
					
					model.addAttribute("loginMess", "Sorry, but your Account got Deleted or Expired");
					model.addAttribute("registerUser", new RegisterUser());
					
					return "index";
				}
			}
//-------- 	Dash board __ STOP  -----------		
				

//-------- 	Remove Notification  __ START  -----------					
		@RequestMapping("/deleteNotification/{id}/{Useremail}")
		public String removeNotification(Model model, @PathVariable int id, @PathVariable String Useremail) {
							
		try {	
			if((dao.getRole(Useremail).get(0)).equals("Admin"))
			{
				
				List<String> notification = dao.getList();
				notification.remove(id);
				
				model.addAttribute("allData", dao.getDataForAdmin(Useremail));
				model.addAttribute("user", new RegisterUser());
				
				String firstNameStore = dao.getFirstName(Useremail).get(0);			
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", Useremail);
									
				model.addAttribute("notiList", notification);
				model.addAttribute("count", dao.getList().size());
									
				return "Admin/Admin";
			}
			else if((dao.getRole(Useremail).get(0)).equals("Lawyer"))
			{
				List<String> notification = dao.getList();
				notification.remove(id);
				
				model.addAttribute("allDataForLawyer", dao.getDataForLawyer(Useremail));
				
				String firstNameStore = dao.getFirstName(Useremail).get(0);
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", Useremail );
									
				model.addAttribute("notiList", notification);
				model.addAttribute("count", dao.getList().size());
									
				return "Lawyer/Lawyer";
			}
			else if((dao.getRole(Useremail).get(0)).equals("Client")) 
			{
				List<String> notifiClient = dao.getClientList();
				notifiClient.remove(id);
				
				List<LawyerDocEdit> docPrice = dao.getDocPrice();				
				model.addAttribute("listOfAllForms", docPrice);
									
				String firstNameStore = dao.getFirstName(Useremail).get(0);			
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", Useremail);
				
				ArrayList<String> clientList = dao.getClientList();
				ArrayList<String> list = new ArrayList<String>();				
				for(int i=0; i < clientList.size(); i++)
				{
					if (clientList.get(i).indexOf(Useremail) != -1) {
						list.add(clientList.get(i));
						System.out.println("Noti Test o/p -> " + clientList.get(i));
						System.out.println("Noti Test o/p -> " + list);
						System.out.println("Noti Test o/p -> " + list.size());
						
					}
				}
				model.addAttribute("clientList", list);
				model.addAttribute("countClient", list.size());
				
				return "Customer/form";
			}
			else {
				model.addAttribute("loginMess", "You DO NOT hold privileges to Delete Notification");
				model.addAttribute("registerUser", new RegisterUser());
									
				return "index";
			}
			}// Try End
			catch (Exception e) {
								
				model.addAttribute("loginMess", "Sorry, but your Account got Deleted or Expired");
				model.addAttribute("registerUser", new RegisterUser());
								
				return "index";
			}// Catch End 
		}
	
//-------- 	Remove Notification __ STOP  -----------		
					
		
//***************___Navigation between Pages -- END******************
	


	
	
//----------------- 		REGISTER   START	 ---------------------------------
	
	@RequestMapping("/register1")
	public String goRegister(Model model, @ModelAttribute RegisterUser registerUser) {
		
		try {
			if(dao.addUser(registerUser)==true) {
				String Useremail = registerUser.getEmail();
				
				// Regular Code to send to General Application sos that Forms will work properly
				model.addAttribute("clientInfo", (generalDao.getclientInfoList(Useremail)));
				// Needed in order to work with general application form
				
				// Regular Customer JSP EL tags needed code
						String firstNameStore = dao.getFirstName(Useremail).get(0);
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail);
				
						ArrayList<String> clientList = dao.getClientList();
						ArrayList<String> list = new ArrayList<String>();				
						for(int i=0; i < clientList.size(); i++)
						{
							if (clientList.get(i).indexOf(Useremail) != -1) {
								list.add(clientList.get(i));
								System.out.println("Noti Test o/p -> " + clientList.get(i));
								System.out.println("Noti Test o/p -> " + list);
								System.out.println("Noti Test o/p -> " + list.size());
								
							}
						}
						model.addAttribute("clientList", list);
						model.addAttribute("countClient", list.size());
						
						
						//create a folder for the user
						if(dao.createFolder(registerUser))
							System.out.println("folder created");
						else
							System.out.println("folder not created");
						
						
						return "Customer/GeneralApplication/ClientInfo";// Empty the field in form and sends it to register page
				
				
				
			}
			else
			{
				model.addAttribute("message", "Un-expected Error. Please Try Again");
				model.addAttribute("register", registerUser); 
				// Stores the form inputed data and return back to register form
				
				return "index";	
			}
		}
		catch (Exception e) {
			model.addAttribute("message", "You already have an account. Try contact the Admin to reset Password");
			model.addAttribute("register", registerUser); 
			// Stores the form inputed data and return back to register form
			
			return "index";	
		}
		
	}// end of method

//----------------- 		REGISTER   END	 ---------------------------------
	
	
//----------------- 		LOGIN	START	 ---------------------------------
	
	@RequestMapping("/login")
	public String goLogin(Model model, @RequestParam String email, @RequestParam String password) {
		
		
			if(dao.getEmail(email).isEmpty()==false){
			
			
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
				
				model.addAttribute("notiList", dao.getList());
				model.addAttribute("count", dao.getList().size());
				
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
				
				ArrayList<String> clientList = dao.getClientList();
				ArrayList<String> list = new ArrayList<String>();				
				for(int i=0; i < clientList.size(); i++)
				{
					if (clientList.get(i).indexOf(email) != -1) {
						list.add(clientList.get(i));
						System.out.println("Noti Test o/p -> " + clientList.get(i));
						System.out.println("Noti Test o/p -> " + list);
						System.out.println("Noti Test o/p -> " + list.size());
						
					}
				}
				model.addAttribute("clientList", list);
				model.addAttribute("countClient", list.size());
				
				return "Customer/form";
			}
			else if((dao.userExist(email, password).get(0)).equals("Lawyer"))
			{
				String firstNameStore = dao.getFirstName(email).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", email );
				model.addAttribute("UserPassword", password);
				
				model.addAttribute("allDataForLawyer", dao.getDataForLawyer(email));
				
				model.addAttribute("notiList", dao.getList());
				model.addAttribute("count", dao.getList().size());
				
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
//----------------- 		LOGIN	END		 ---------------------------------
	
	
	
//----------------- 		NAVIGATION TO Case Request (Admin and Lawyer) -- Start	 ---------------------------------

	@RequestMapping("/caseRequest/{Useremail}")
	public String goCaseRequest(Model model, @PathVariable String Useremail) {
	
		if((dao.getRole(Useremail).get(0)).equals("Admin") || (dao.getRole(Useremail).get(0)).equals("Lawyer") ) {
			
			List<PayAmount> payAmount = dao.getPayAmount();
			
			model.addAttribute("payAmount", payAmount);
			
			model.addAttribute("notiList", dao.getList());
			model.addAttribute("count", dao.getList().size());
			
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			String role = dao.getRole(Useremail).get(0);
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("role", role);
			model.addAttribute("Useremail", Useremail);
			
			return "ClientRequest";
			}
			else {
				model.addAttribute("logOutMess", "You DO NOT hold privileges to View this page");
				model.addAttribute("registerUser", new RegisterUser());
				
				return "index";
				
			}
		
	}
	
//----------------- 		NAVIGATION TO Case Request (Admin and Lawyer) -- End	 ---------------------------------


//----------------- 		NAVIGATION TO Case Request (ALL) -- Start	 ---------------------------------

		@RequestMapping("/customerRequest/{Useremail}/{SessionEmail}")
		public String goCustomerRequest(Model model, @PathVariable String Useremail, @PathVariable String SessionEmail) {
		
			if((dao.getRole(SessionEmail).get(0)).equals("Client") || (dao.getRole(SessionEmail).get(0)).equals("Admin") || (dao.getRole(SessionEmail).get(0)).equals("Lawyer")) {
				
				List<PayAmount> payAmount = dao.getPayAmountCustomer(Useremail);
				model.addAttribute("payAmount", payAmount);
				
				String firstNameStore = dao.getFirstName(SessionEmail).get(0);
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", SessionEmail);
				
				ArrayList<String> clientList = dao.getClientList();
				ArrayList<String> list = new ArrayList<String>();				
				for(int i=0; i < clientList.size(); i++)
				{
					if (clientList.get(i).indexOf(Useremail) != -1) {
						list.add(clientList.get(i));
						System.out.println("Noti Test o/p -> " + clientList.get(i));
						System.out.println("Noti Test o/p -> " + list);
						System.out.println("Noti Test o/p -> " + list.size());
						
					}
				}
				model.addAttribute("clientList", list);
				model.addAttribute("countClient", list.size());
				
				return "/Customer/CustomerRequest";
				}
				else {
					model.addAttribute("logOutMess", "You DO NOT hold privileges to View this page");
					model.addAttribute("registerUser", new RegisterUser());
					
					return "index";	
				}
		}
		
//----------------- 		NAVIGATION TO Case Request (ALL) -- End	 ---------------------------------

	
//----------------- 		NAVIGATION TO Document Edit for Admin Side Start	 ---------------------------------
	
		

//----------------- 		NAVIGATION TO Document Edit for Admin Side End	 ---------------------------------


//----------------- 		NAVIGATION TO View Client General Application Info for Lawyer and Admin  START ---------------------------------
			
				@RequestMapping("/application/{email}/{Useremail}")
				public String goViewClientInfo(Model model, @PathVariable String email ,@PathVariable String Useremail) {
				
					if((dao.getRole(Useremail).get(0)).equals("Admin") || (dao.getRole(Useremail).get(0)).equals("Lawyer")) 
						{
	
						
						// Sending Client and Session Email First Name to display
						String firstNameStore = dao.getFirstName(Useremail).get(0);
						String clientFirstName = dao.getFirstName(email).get(0);
						
						// Getting Client data based on their Client Email
						model.addAttribute("childExpenses", generalDao.getChildExpenses(email));
						model.addAttribute("children", generalDao.getChildren(email));
						model.addAttribute("clientInfo", generalDao.getclientInfoList(email));
						model.addAttribute("maritalInfo", generalDao.getMartialInfo(email));
						model.addAttribute("matrimonialHome", generalDao.getMatrimonialHome(email));
						model.addAttribute("spouseInfo", generalDao.getSpouseInfo(email));
						
						model.addAttribute("clientFirstName", clientFirstName);
						
						// Necessary code to send to JSP
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail);
						String role = dao.getRole(Useremail).get(0);
						model.addAttribute("role", role);
						
						model.addAttribute("notiList", dao.getList());
						model.addAttribute("count", dao.getList().size());
						
						return "ViewData";
						}
						else {
							model.addAttribute("logOutMess", "You DO NOT hold privileges to View this Page");
							model.addAttribute("registerUser", new RegisterUser());
							
							return "index";
							
						}
					
				}

//----------------	NAVIGATION TO View Client General Application Info for Lawyer and Admin  START -------------

			
		
//-----------------	Edit User & UPDATE Function Role & Data - 	START -----------------------------
	
		@RequestMapping("/editUser/{sessionEmail}/{userEmail}")
		public String goEditUserInDB(Model model, @PathVariable String sessionEmail, @PathVariable String userEmail, @RequestParam String userFirstName, String userLastName,String role) {
			
			try {
			String adminEmail = sessionEmail.trim();
						
			String formEmail = userEmail.trim();
			String formFirstName = userFirstName.trim();
			String formLastName = userLastName.trim();
			String formRole = role.trim();
			
			RegisterUser reg = new RegisterUser(formFirstName, formLastName, formRole);
			dao.editUserRole(formEmail, reg);
			
			model.addAttribute("confirmationMessage", "User's Detail modified successfully");
			
				if((dao.getRole(adminEmail).get(0)).equals("Admin"))
				{
					String firstNameStore = dao.getFirstName(adminEmail).get(0);
					
					model.addAttribute("firstName", firstNameStore);
					model.addAttribute("Useremail", adminEmail);
					
					model.addAttribute("allData", dao.getDataForAdmin(adminEmail));
					model.addAttribute("user", new RegisterUser());
					
					model.addAttribute("notiList", dao.getList());
					model.addAttribute("count", dao.getList().size());
					
					return "Admin/Admin";
				}
				else if((dao.getRole(adminEmail).get(0)).equals("Lawyer"))
				{
					String firstNameStore = dao.getFirstName(adminEmail).get(0);
					
					model.addAttribute("firstName", firstNameStore);
					model.addAttribute("Useremail", adminEmail );
					
					model.addAttribute("allDataForLawyer", dao.getDataForLawyer(adminEmail));
					
					model.addAttribute("notiList", dao.getList());
					model.addAttribute("count", dao.getList().size());
					
					return "Lawyer/Lawyer";
				}
				else {
					model.addAttribute("loginMess", "Bad Credentials. Please Re enter Your Password");
					model.addAttribute("registerUser", new RegisterUser());
					
					return "index";
				}
			}// Try block closes
			catch (Exception e) {
				model.addAttribute("loginMess", "OOPS, Something Broke at our Side. Please try again after some time.");
				model.addAttribute("registerUser", new RegisterUser());
				
				return "index";
			}
		}
		
//-----------------  Edit User STOP  -------------------------------


//----------------- 	Edit User & UPDATE Function Role & Data -- 	START ---------------------------------
			
	@RequestMapping("/editPassword/{userEmail}")
	public String editPassword(Model model, @PathVariable String userEmail, @RequestParam String userFirstName,@RequestParam String userLastName, @RequestParam String userNewPassword) {
					
		try {
				
			RegisterUser regUser = new RegisterUser(userEmail, userFirstName, userLastName, userNewPassword);
			dao.editUser(regUser);
					
				model.addAttribute("confirmationMessage", "Your Information is modified successfully");
					
				RegisterUser reg = dao.getUser(userEmail); 
				model.addAttribute("userInfo", reg);
				
				String firstNameStore = dao.getFirstName(userEmail).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", userEmail );
				
					return "Settings";
				
					}// Try block closes
					catch (Exception e) {
						model.addAttribute("loginMess", "OOPS, Something Broke at our Side. Please try again after some time.");
						model.addAttribute("registerUser", new RegisterUser());
						
						return "index";
					}
				}
				
//-----------------  Edit User STOP  ---------------------------------

		
		
//-----------------  Delete User START  ---------------------------------
	@RequestMapping(value = "/deleteAdmin/{email}/{Useremail}")	
	public String deleteAdminSide(Model model, @PathVariable String email, @PathVariable String Useremail) {
		
		if((dao.getRole(Useremail).get(0)).equals("Admin")) {
			
		// Code Required to Delete all Data from other Tables as well
		dao.deleteUser(email);
		/*dao.deleteUserPayment(email);
		generalDao.deleteChildExpenses(email);
		generalDao.deleteChildren(email);
		generalDao.deleteClientInfo(email);
		generalDao.deleteMartialInfo(email);
		generalDao.deleteMatrimonialHome(email);
		generalDao.deleteSpouseInfo(email);*/
		// Code to delete other Dependency of that user
		
		
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		
		model.addAttribute("notiList", dao.getList());
		model.addAttribute("count", dao.getList().size());
		
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
	
//---------------- Delete User END  --------------------------------
	

//----------------  Delete Payment for User -- START  --------------------------------

	@RequestMapping(value = "/deletePayment/{Useremail}/{id}")	
	public String deletePayment(Model model, @PathVariable int id, @PathVariable String Useremail) {
		
		dao.deleteOrderById(id);

		List<Payment> pay = dao.getPaymentInfo(Useremail);
		model.addAttribute("paymentData", pay);
		
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		
		model.addAttribute("requestMessage", "Your Legal Form have successfully Deleted from the Cart");
		
		ArrayList<String> clientList = dao.getClientList();
		ArrayList<String> list = new ArrayList<String>();				
		for(int i=0; i < clientList.size(); i++)
		{
			if (clientList.get(i).indexOf(Useremail) != -1) {
				list.add(clientList.get(i));
				System.out.println("Noti Test o/p -> " + clientList.get(i));
				System.out.println("Noti Test o/p -> " + list);
				System.out.println("Noti Test o/p -> " + list.size());
				
			}
		}
		model.addAttribute("clientList", list);
		model.addAttribute("countClient", list.size());
		
		return "Customer/Payment";
	}
	
//---------------  Delete Payment for User -- END  --------------------------------

		
	
//----------------- Legal Form -- START ---------------------------------
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
			
			ArrayList<String> clientList = dao.getClientList();
			ArrayList<String> list = new ArrayList<String>();				
			for(int i=0; i < clientList.size(); i++)
			{
				if (clientList.get(i).indexOf(Useremail) != -1) {
					list.add(clientList.get(i));
					System.out.println("Noti Test o/p -> " + clientList.get(i));
					System.out.println("Noti Test o/p -> " + list);
					System.out.println("Noti Test o/p -> " + list.size());
					
				}
			}
			model.addAttribute("clientList", list);
			model.addAttribute("countClient", list.size());
			
			return "Customer/Payment";
	}
//----------------- Legal Form -- END --------------------------------
	
	
//----------------- Documents  START --------------------------------	
	@RequestMapping("/bookOfAuth/{Useremail}")
	public String goBookOfAuthority(Model model, @PathVariable String Useremail) {
			
			dao.addPayment(new Payment(Useremail, "Book of Authority", "", "50.00"));
		
			model.addAttribute("message", "Book of Authority requested Successfully");
			
			List<Payment> pay = dao.getPaymentInfo(Useremail);
			model.addAttribute("paymentData", pay);
			
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			
			ArrayList<String> clientList = dao.getClientList();
			ArrayList<String> list = new ArrayList<String>();				
			for(int i=0; i < clientList.size(); i++)
			{
				if (clientList.get(i).indexOf(Useremail) != -1) {
					list.add(clientList.get(i));
					System.out.println("Noti Test o/p -> " + clientList.get(i));
					System.out.println("Noti Test o/p -> " + list);
					System.out.println("Noti Test o/p -> " + list.size());
					
				}
			}
			model.addAttribute("clientList", list);
			model.addAttribute("countClient", list.size());
			
			return "Customer/Payment";
	}


	@RequestMapping("/factum/{Useremail}")
	public String goFactum(Model model, @PathVariable String Useremail) {
			
		dao.addPayment(new Payment(Useremail, "Factum", "", "55.00"));
			
		model.addAttribute("message", "Factum requested Successfully");
		
		List<Payment> pay = dao.getPaymentInfo(Useremail);
		model.addAttribute("paymentData", pay);
		
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			
			ArrayList<String> clientList = dao.getClientList();
			ArrayList<String> list = new ArrayList<String>();				
			for(int i=0; i < clientList.size(); i++)
			{
				if (clientList.get(i).indexOf(Useremail) != -1) {
					list.add(clientList.get(i));
					System.out.println("Noti Test o/p -> " + clientList.get(i));
					System.out.println("Noti Test o/p -> " + list);
					System.out.println("Noti Test o/p -> " + list.size());
					
				}
			}
			model.addAttribute("clientList", list);
			model.addAttribute("countClient", list.size());
			
			return "Customer/Payment";
	}

//------------- Documents END -------------------------------
	
	
//-------------- Redirect Third Party Pay START -------------------------------
	
	@RequestMapping("/pay/{Useremail}/{amount}")
	public String goConfirmPayment(Model model, @PathVariable String Useremail, @PathVariable String amount) {
		
		
		// To get Current Data
		List<Payment> pay = dao.getPaymentInfo(Useremail);
		
		// To Convert Amount to 2 decimal places
		double d = Double.parseDouble(amount);
		String finalAmount = String.format("%.2f", d);
		
		
		// Extract Current Date to Log Data
				Date date = Calendar.getInstance().getTime();  
				DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm");  
				String strDate = dateFormat.format(date);  
				// Extract Current Date to Log Data
				
				System.out.println(strDate);
				
				
		String requestDoc;
		for(Payment list : pay) {
			
			
			if(!list.getFormType().equals("")) {
				requestDoc = list.getFormType();
				
				PayAmount payAmount = new PayAmount(Useremail, finalAmount, strDate, requestDoc);
				
				dao.addPayAmount(payAmount);
			}
				
		}
		
		for(Payment list : pay) {
			if(list.getFormType().equals(null) || list.getFormType().equals("") || list.getFormType().equals(" ")) {
				requestDoc = list.getDocumentType();
				
				PayAmount payAmount = new PayAmount(Useremail, finalAmount, strDate, requestDoc);
				
				dao.addPayAmount(payAmount);
			}
		}
		
		
		model.addAttribute("message", "Request is processed, you will get your documents once the Lawyer contacts you");
		
		List<Integer> listID = dao.getIDFromPayAmount(Useremail);
		
		for(int i : listID) {
			dao.deleteUserPayment(i);
		}
		
		
		// Required code for Payment.jsp
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			
			model.addAttribute("paymentData", dao.getPaymentInfo(Useremail));
		
			dao.getList().add("New Request: "+firstNameStore + "(" + Useremail + ")" );
			
			ArrayList<String> clientList = dao.getClientList();
			ArrayList<String> list = new ArrayList<String>();				
			for(int i=0; i < clientList.size(); i++)
			{
				if (clientList.get(i).indexOf(Useremail) != -1) {
					list.add(clientList.get(i));
					System.out.println("Noti Test o/p -> " + clientList.get(i));
					System.out.println("Noti Test o/p -> " + list);
					System.out.println("Noti Test o/p -> " + list.size());
					
				}
			}
			model.addAttribute("clientList", list);
			model.addAttribute("countClient", list.size());
			
			return "Customer/Payment";
	}
	
//------------- Redirect Third Party Pay END-------------------------------

	
//------------- General Registration Form  START ----------------------------

	@RequestMapping("/generalApplication/{Useremail}")	
	public String goGeneralApplication(Model model, @PathVariable String Useremail) {
	
		// Regular Code to send to General Application sos that Forms will work properly
		model.addAttribute("clientInfo", (generalDao.getclientInfoList(Useremail)));
		// Needed in order to work with general application form
		
		// Regular Customer JSP EL tags needed code
				String firstNameStore = dao.getFirstName(Useremail).get(0);
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", Useremail);
		
				ArrayList<String> clientList = dao.getClientList();
				ArrayList<String> list = new ArrayList<String>();				
				for(int i=0; i < clientList.size(); i++)
				{
					if (clientList.get(i).indexOf(Useremail) != -1) {
						list.add(clientList.get(i));
						System.out.println("Noti Test o/p -> " + clientList.get(i));
						System.out.println("Noti Test o/p -> " + list);
						System.out.println("Noti Test o/p -> " + list.size());
						
					}
				}
				model.addAttribute("clientList", list);
				model.addAttribute("countClient", list.size());
				
				return "Customer/GeneralApplication/ClientInfo";
	}
	
	
// First Class Saving Data to DAO method	
	@RequestMapping("/childExpense/{Useremail}")	
	public String goChildExpenses(Model model, @PathVariable String Useremail, @ModelAttribute ChildExpenses childExpenses) {
		
		synchronized (ChildExpenses.class) {
			generalDao.addChildExpenses(childExpenses, Useremail);
		}
		
				// Regular Code to send to General Application sos that Forms will work properly
				model.addAttribute("childExpenses", (generalDao.getChildExpenses(Useremail)));
				
				// Regular Customer JSP EL tags needed code
				String firstNameStore = dao.getFirstName(Useremail).get(0);
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", Useremail);
				model.addAttribute("confirmationMessage", "Successfully Added/Changed Child Expenses Data");

				ArrayList<String> clientList = dao.getClientList();
				ArrayList<String> list = new ArrayList<String>();				
				for(int i=0; i < clientList.size(); i++)
				{
					if (clientList.get(i).indexOf(Useremail) != -1) {
						list.add(clientList.get(i));
						System.out.println("Noti Test o/p -> " + clientList.get(i));
						System.out.println("Noti Test o/p -> " + list);
						System.out.println("Noti Test o/p -> " + list.size());
						
					}
				}
				model.addAttribute("clientList", list);
				model.addAttribute("countClient", list.size());
				
				return "Customer/GeneralApplication/ChildExpenses";
	}
// First Class Saving Data to DAO method __ END
	
// Second Class Saving Data to DAO method	
		@RequestMapping("/children/{Useremail}")	
		public String goChildren(Model model, @PathVariable String Useremail, @ModelAttribute Children children) {
			synchronized (Children.class) {
				generalDao.addChildren(children, Useremail);
			}
			
					// Regular Code to send to General Application sos that Forms will work properly
					model.addAttribute("children", (generalDao.getChildren(Useremail)));
					
					// Regular Customer JSP EL tags needed code
					String firstNameStore = dao.getFirstName(Useremail).get(0);
							
					model.addAttribute("firstName", firstNameStore);
					model.addAttribute("Useremail", Useremail);
					model.addAttribute("confirmationMessage", "Successfully Added/Changed Children Data");

					ArrayList<String> clientList = dao.getClientList();
					ArrayList<String> list = new ArrayList<String>();				
					for(int i=0; i < clientList.size(); i++)
					{
						if (clientList.get(i).indexOf(Useremail) != -1) {
							list.add(clientList.get(i));
							System.out.println("Noti Test o/p -> " + clientList.get(i));
							System.out.println("Noti Test o/p -> " + list);
							System.out.println("Noti Test o/p -> " + list.size());
							
						}
					}
					model.addAttribute("clientList", list);
					model.addAttribute("countClient", list.size());
					
					return "Customer/GeneralApplication/Children";
		}
// Second Class Saving Data to DAO method __ END
	
// Third Class Saving Data to DAO method	
				@RequestMapping("/clientInfo/{Useremail}")	
				public String goClientInfo(Model model, @PathVariable String Useremail, @ModelAttribute ClientInfo clientInfo) {
					
					
					synchronized (ClientInfo.class) {
						generalDao.addClientInfo(clientInfo, Useremail);
					}
					
							// Regular Code to send to General Application sos that Forms will work properly
							model.addAttribute("clientInfo", (generalDao.getclientInfoList(Useremail)));
							
							// Regular Customer JSP EL tags needed code
							String firstNameStore = dao.getFirstName(Useremail).get(0);
									
							model.addAttribute("firstName", firstNameStore);
							model.addAttribute("Useremail", Useremail);
							model.addAttribute("confirmationMessage", "Successfully Added/Changed Client(Your) Info Data");

							ArrayList<String> clientList = dao.getClientList();
							ArrayList<String> list = new ArrayList<String>();				
							for(int i=0; i < clientList.size(); i++)
							{
								if (clientList.get(i).indexOf(Useremail) != -1) {
									list.add(clientList.get(i));
									System.out.println("Noti Test o/p -> " + clientList.get(i));
									System.out.println("Noti Test o/p -> " + list);
									System.out.println("Noti Test o/p -> " + list.size());
									
								}
							}
							model.addAttribute("clientList", list);
							model.addAttribute("countClient", list.size());
							
							return "Customer/GeneralApplication/ClientInfo";
				}
// Third Class Saving Data to DAO method __ END
		
// Fourth Class Saving Data to DAO method	
				@RequestMapping("/maritalInfo/{Useremail}")	
				public String goMartialInfo(Model model, @PathVariable String Useremail, @ModelAttribute MartialInfo martialInfo) {
					synchronized (MartialInfo.class) {
						generalDao.addMartialInfo(martialInfo, Useremail);
					}
					
							// Regular Code to send to General Application sos that Forms will work properly
							model.addAttribute("maritalInfo", (generalDao.getMartialInfo(Useremail)));

							// Regular Customer JSP EL tags needed code
							String firstNameStore = dao.getFirstName(Useremail).get(0);
							model.addAttribute("firstName", firstNameStore);
							model.addAttribute("Useremail", Useremail);
							model.addAttribute("confirmationMessage", "Successfully Added/Changed Martial Info Data");

							ArrayList<String> clientList = dao.getClientList();
							ArrayList<String> list = new ArrayList<String>();				
							for(int i=0; i < clientList.size(); i++)
							{
								if (clientList.get(i).indexOf(Useremail) != -1) {
									list.add(clientList.get(i));
									System.out.println("Noti Test o/p -> " + clientList.get(i));
									System.out.println("Noti Test o/p -> " + list);
									System.out.println("Noti Test o/p -> " + list.size());
									
								}
							}
							model.addAttribute("clientList", list);
							model.addAttribute("countClient", list.size());
							
							return "Customer/GeneralApplication/MaritalInfo";
				}
// Fourth Class Saving Data to DAO method __ END				

// Fifth Class Saving Data to DAO method	
				@RequestMapping("/matrimonialHome/{Useremail}")	
				public String goMatrimonialHome(Model model, @PathVariable String Useremail, @ModelAttribute MatrimonialHome matrimonialHome) {
					synchronized (MatrimonialHome.class) {
						generalDao.addMatrimonialHome(matrimonialHome, Useremail);
					}
					
							// Regular Code to send to General Application sos that Forms will work properly
							model.addAttribute("matrimonialHome", (generalDao.getMatrimonialHome(Useremail)));
							
							// Regular Customer JSP EL tags needed code
							String firstNameStore = dao.getFirstName(Useremail).get(0);		
							model.addAttribute("firstName", firstNameStore);
							model.addAttribute("Useremail", Useremail);
							model.addAttribute("confirmationMessage", "Successfully Added/Changed Matrimonial Home Information Data");

							ArrayList<String> clientList = dao.getClientList();
							ArrayList<String> list = new ArrayList<String>();				
							for(int i=0; i < clientList.size(); i++)
							{
								if (clientList.get(i).indexOf(Useremail) != -1) {
									list.add(clientList.get(i));
									System.out.println("Noti Test o/p -> " + clientList.get(i));
									System.out.println("Noti Test o/p -> " + list);
									System.out.println("Noti Test o/p -> " + list.size());
									
								}
							}
							model.addAttribute("clientList", list);
							model.addAttribute("countClient", list.size());
							
							return "Customer/GeneralApplication/MatrimonialHome";
				}
// Fifth Class Saving Data to DAO method __ END				
		
				// Sixth Class Saving Data to DAO method	
				@RequestMapping("/spouseInfo/{Useremail}")	
				public String goSpouseInfo(Model model, @PathVariable String Useremail, @ModelAttribute SpouseInfo spouseInfo) {
					synchronized (SpouseInfo.class) {
						generalDao.addSpouseInfo(spouseInfo, Useremail);
					}
					
							// Regular Code to send to General Application sos that Forms will work properly
							model.addAttribute("spouseInfo", (generalDao.getSpouseInfo(Useremail)));
							
							// Regular Customer JSP EL tags needed code
							String firstNameStore = dao.getFirstName(Useremail).get(0);		
							model.addAttribute("firstName", firstNameStore);
							model.addAttribute("Useremail", Useremail);
							model.addAttribute("confirmationMessage", "Successfully Added/Changed Spouse Information Data");

							ArrayList<String> clientList = dao.getClientList();
							ArrayList<String> list = new ArrayList<String>();				
							for(int i=0; i < clientList.size(); i++)
							{
								if (clientList.get(i).indexOf(Useremail) != -1) {
									list.add(clientList.get(i));
									System.out.println("Noti Test o/p -> " + clientList.get(i));
									System.out.println("Noti Test o/p -> " + list);
									System.out.println("Noti Test o/p -> " + list.size());
									
								}
							}
							model.addAttribute("clientList", list);
							model.addAttribute("countClient", list.size());
							
							return "Customer/GeneralApplication/SpouseInfo";
				}
// Sixth Class Saving Data to DAO method __ END		
				
//------- General Registration Form  END --------------------------------

//------- Admin Editing Document and Form Price... START --------------------------------
				
				@RequestMapping("/editDocPrice/{Useremail}")
				public String goAdminEditPrice(Model model, @PathVariable String Useremail) {
					
						if ((dao.getRole(Useremail).get(0)).equals("Admin")) {
							
						List<LawyerDocEdit> docPrice = dao.getDocPrice();
						
						model.addAttribute("listOfAllForms", docPrice);
						
						model.addAttribute("notiList", dao.getList());
						model.addAttribute("count", dao.getList().size());
						
						// Regular Customer JSP EL tags needed code
						String firstNameStore = dao.getFirstName(Useremail).get(0);
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail);
						// Needed for Customer JSP EL tags
						
						return "Admin/DocumentEdit";
						}
						else
						{
							model.addAttribute("logOutMess", "You DO NOT hold privileges to View this page");
							model.addAttribute("registerUser", new RegisterUser());
							
							return "index";
						}
				}
				
				@RequestMapping("/editForm")
				public String goEditPriceForm(Model model, @RequestParam String Useremail, @RequestParam String id, @RequestParam String price, @RequestParam String sale) {
					
					
					int idDB = Integer.parseInt(id);
					double priceDB = Double.parseDouble(price);
					
					LawyerDocEdit lawPrice = new LawyerDocEdit(dao.getDocumentInfo(idDB), dao.getFormInfo(idDB), priceDB, sale.trim());
					
					if ((dao.getRole(Useremail).get(0)).equals("Admin")) {
						
						if (dao.editFormPrice(idDB, lawPrice) == true)
						{	
					
							model.addAttribute("message", "Information Successfully Changed");
						
							// Required code to go back to DocumentEdit
							List<LawyerDocEdit> docPrice = dao.getDocPrice();
							model.addAttribute("listOfAllForms", docPrice);
						
							model.addAttribute("notiList", dao.getList());
							model.addAttribute("count", dao.getList().size());
							
							// Code to required to go to other pages
							String firstNameStore = dao.getFirstName(Useremail).get(0);
							model.addAttribute("firstName", firstNameStore);
							model.addAttribute("Useremail", Useremail);
						
						return "Admin/DocumentEdit";
						}
						else {
							model.addAttribute("message", "Information NOT Changed due to Error");
							// Required code to go back to DocumentEdit
							
							List<LawyerDocEdit> docPrice = dao.getDocPrice();
							model.addAttribute("listOfAllForms", docPrice);
							
							model.addAttribute("notiList", dao.getList());
							model.addAttribute("count", dao.getList().size());
							
							// Code to required to go to other pages
							String firstNameStore = dao.getFirstName(Useremail).get(0);
							model.addAttribute("firstName", firstNameStore);
							model.addAttribute("Useremail", Useremail);
							
							return "Admin/DocumentEdit";
						}
					}
					else
					{
						model.addAttribute("logOutMess", "You DO NOT hold privileges to View this page");
						model.addAttribute("registerUser", new RegisterUser());
								
						return "index";
					}
				}
				
//----------- Admin Editing Document and Form Price... END ----------

	
//----************************************ ABOVE this PARAS Code  **************************---------------------------------

	
	
				
	

//----**************************** BELOW this PRODIP Code ********************---------------------------------

//-----------------File View and Add --	START---------------------------------
	
	@RequestMapping(value = "/details/{folder_name}/{Useremail}", method = RequestMethod.GET)
	public String getFolder(
			Model model,
			@PathVariable("Useremail") String Useremail,
			@PathVariable("folder_name") String folderName, 	
			HttpServletResponse response) 	
	{
		
		List<File> filelist = dao.getFileList(dao.getDirPath(folderName));		
	    List<String[]> fileinfo = compareWithFileDatabase(filelist);
		model.addAttribute("filelist", filelist);
		model.addAttribute("fileinfo", fileinfo);
		
		model.addAttribute("presentDirectory", folderName);
		
		// Code to required to go to other pages
		model.addAttribute("notiList", dao.getList());
		model.addAttribute("count", dao.getList().size());
		
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		String role = dao.getRole(Useremail).get(0);
		model.addAttribute("role", role);
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		
		return  "Admin/Files";
			
	  
	}
	
	@PostMapping("/upload/{folder_name}") // //new annotation since 4.3
    public String singleFileUpload(
    		Model model,
    		@RequestParam("file") MultipartFile file,
    		@RequestParam("Useremail") String useremail,
    		RedirectAttributes redirectAttributes,
    		@PathVariable("folder_name") String folderName) throws IOException 
	{

		String Useremail = folderName;
		
		String role = dao.getRole(useremail).get(0);
		String firstName = dao.getFirstName(useremail).get(0);
		String firstNameCustomer = dao.getFirstName(Useremail).get(0);
		
		System.out.println("Test o/p ->" + folderName);
		System.out.println("Test o/p ->" + role);
		System.out.println("Test o/p ->" + firstNameCustomer);
		System.out.println("Test o/p ->" + firstName);
		
		if(role.equals("Lawyer") || role.equals("Admin"))
		{
			dao.getClientList().add("Lawyer has sent you new Documents " + folderName);
			
		}
		else {
			System.out.println("Something went wrong at line: 1337 HomeController");
		}
		//adding a file
        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:uploadStatus";
        }

        // Get the file and save it somewhere
		try {				
			String dir = dao.getDirPath( folderName );
			dao.addFile(file, dir, firstName);		
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
	    
		// Code to required to go to other pages
	    model.addAttribute("notiList", dao.getList());
		model.addAttribute("count", dao.getList().size());
		
	    String firstNameStore = dao.getFirstName(useremail).get(0);
	
		model.addAttribute("role", dao.getRole(useremail).get(0));
		model.addAttribute("firstName", firstNameStore);	
		model.addAttribute("Useremail", useremail);
		
        return "Admin/Files";
    }
	@PostMapping("/uploadCustomer/{folder_name}") // //new annotation since 4.3
    public String singleFileUploadCustomer(
    		Model model,
    		@RequestParam("file") MultipartFile file,
    		RedirectAttributes redirectAttributes,
    		@PathVariable("folder_name") String folderName) throws IOException 
	{
		// Code for Notification at Customer side
		
		String role = dao.getRole(folderName).get(0);
		String firstName = dao.getFirstName(folderName).get(0);
		
		if(role.equals("Client")) 
		{
			dao.getList().add(firstName + "(" + folderName + ")" + " uploaded new files");
		}
		else {
			System.out.println("Something went wrong at line: 1405 HomeController");
		}
		//adding a file
        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:uploadStatus";
        }

        // Get the file and save it somewhere
		try {				
			String dir = dao.getDirPath( folderName );
			dao.addFile(file, dir, firstName);		
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
		
		// Code to required to go to other pages
		String firstNameStore = dao.getFirstName(folderName).get(0);
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", folderName);
		model.addAttribute("role", role);
		
		
		ArrayList<String> clientList = dao.getClientList();
		ArrayList<String> list = new ArrayList<String>();				
		for(int i=0; i < clientList.size(); i++)
		{
			if (clientList.get(i).indexOf(folderName) != -1) {
				list.add(clientList.get(i));
				System.out.println("Noti Test o/p -> " + clientList.get(i));
				System.out.println("Noti Test o/p -> " + list);
				System.out.println("Noti Test o/p -> " + list.size());
				
			}
		}
		model.addAttribute("clientList", list);
		model.addAttribute("countClient", list.size());
		
		
        return "Customer/uploadDocument";
    }
		
	@PostMapping("/deleteFileAdmin/{folder_name}")
	  public String deleteFile(Model model,
	    		@RequestParam(required=false, name="hiddenInp") String[] selectedChecks,
	    		@RequestParam(required=true, name="Useremail") String Useremail,
	    		RedirectAttributes redirectAttributes,
	    		@PathVariable("folder_name") String folderName) throws IOException 
		{
			for(String name : selectedChecks) {
				dao.deleteFile(name, folderName);
			}
			
			// showing the list of file in the folder
			List<File> filelist = dao.getFileList(dao.getDirPath(folderName));		
		    List<String[]> fileinfo = compareWithFileDatabase(filelist);
							
			model.addAttribute("fileinfo", fileinfo);
			
			model.addAttribute("presentDirectory", folderName);
			model.addAttribute("filelist", filelist);
			
			// Code to required to go to other pages
			model.addAttribute("notiList", dao.getList());
			model.addAttribute("count", dao.getList().size());
			
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			model.addAttribute("role", dao.getRole(Useremail).get(0));
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			
	        return "Admin/Files";
	    }
	@PostMapping("/deleteFileUser/{folder_name}")
	  public String deleteFileUser(Model model,
	    		@RequestParam(required=false, name="hiddenInp") String[] selectedChecks,
	    		@RequestParam(required=true, name="Useremail") String Useremail,
	    		RedirectAttributes redirectAttributes,
	    		@PathVariable("folder_name") String folderName) throws IOException 
		{
			for(String name : selectedChecks) {
				
				dao.deleteFile(name, folderName, Useremail);
			}
			
			// showing the list of file in the folder
			List<File> filelist = dao.getFileList(dao.getDirPath(folderName));		
		    List<String[]> fileinfo = compareWithFileDatabase(filelist);
							
			model.addAttribute("fileinfo", fileinfo);
			
			model.addAttribute("presentDirectory", folderName);
			model.addAttribute("filelist", filelist);
			
			// Code to required to go to other pages
			model.addAttribute("notiList", dao.getList());
			model.addAttribute("count", dao.getList().size());
			
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			model.addAttribute("role", dao.getRole(Useremail).get(0));
			
			ArrayList<String> clientList = dao.getClientList();
			ArrayList<String> list = new ArrayList<String>();				
			for(int i=0; i < clientList.size(); i++)
			{
				if (clientList.get(i).indexOf(Useremail) != -1) {
					list.add(clientList.get(i));
					System.out.println("Noti Test o/p -> " + clientList.get(i));
					System.out.println("Noti Test o/p -> " + list);
					System.out.println("Noti Test o/p -> " + list.size());
					
				}
			}
			model.addAttribute("clientList", list);
			model.addAttribute("countClient", list.size());
			
	        return "Customer/uploadDocument";
	    }
	
	@RequestMapping(value = "/download", method = RequestMethod.POST )
	public void FileSystemResource (Model model, HttpServletRequest request, HttpServletResponse response,
            @RequestHeader String referer, @RequestParam("filename") String filename, 
            @RequestParam("foldername") String dirname) throws IOException  
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
		model.addAttribute("role", dao.getRole(folderName).get(0));

		ArrayList<String> clientList = dao.getClientList();
		ArrayList<String> list = new ArrayList<String>();				
		for(int i=0; i < clientList.size(); i++)
		{
			if (clientList.get(i).indexOf(folderName) != -1) {
				list.add(clientList.get(i));
				System.out.println("Noti Test o/p -> " + clientList.get(i));
				System.out.println("Noti Test o/p -> " + list);
				System.out.println("Noti Test o/p -> " + list.size());
				
			}
		}
		model.addAttribute("clientList", list);
		model.addAttribute("countClient", list.size());
		
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
					fileinfo.add(new String[] {f.getName(), "", "" , "" } );
				}	
			}
		}catch (Exception ex){
			ex.printStackTrace();
			return new  ArrayList<String[]>();
		}
		return fileinfo;
	}

					
//-----------------File View and Add --	END---------------------------------
	
	
//----************************ 		ABOVE this PRODIP Code  *****************************---------------------------------
			
		
}
