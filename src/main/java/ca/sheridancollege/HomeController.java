
package ca.sheridancollege;

import java.io.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.HttpServletResponse;

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

	Dao dao = new Dao();
	FileDao fileDao = new FileDao();
	GeneralFormDao generalDao = new GeneralFormDao();
	
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
	
	
	//----**** BELOW this RIYA Code*******---------------------------------

	//-----------Sidebar Navigation STart--------------
		
		@RequestMapping(value = "documents", method = RequestMethod.GET)
		public String document(Model model, @ModelAttribute RegisterUser user) {

			return "Customer/document";
		}
		
		@RequestMapping(value = "forms", method = RequestMethod.GET)
		public String forms(Model model, @ModelAttribute RegisterUser user) {

			return "Customer/form";
		}
		
		@RequestMapping(value = "uploadDoc", method = RequestMethod.GET)
		public String uploadDoc(Model model, @ModelAttribute RegisterUser user) {

			return "Customer/uploadDocument";
		}
		@RequestMapping(value = "homePage", method = RequestMethod.GET)
		public String homePage(Model model, @ModelAttribute RegisterUser user) {

			return "Customer/form";
		}
		
		
		
	//----**** ABOVE this RIYA Code*******---------------------------------

		
		
		
		
		
	//----**** BELOW this HEET Code*******---------------------------------

	//----------Sidebar Navigation END-------------
		
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
				
				return "Customer/form";
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
	
	
//-----------------********		NAVIGATION TO DETAILS Start	********---------------------------------
	
	@RequestMapping("/details/{email}/{Useremail}/{UserPassword}")
	public String goDetails(Model model, @PathVariable String email, @PathVariable String Useremail, @PathVariable String UserPassword) {
	
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		model.addAttribute("firstName", firstNameStore);
		
		
		model.addAttribute("email", email);
		model.addAttribute("Useremail", Useremail);
		model.addAttribute("UserPassword", UserPassword);
		
		return "details";
	}

//-----------------********		NAVIGATION TO DETAILS End	********---------------------------------

//-----------------********		NAVIGATION TO DETAILS Start	********---------------------------------
	
		@RequestMapping("/docEdit/{Useremail}")
		public String goLegalDocumentEdit(Model model, @PathVariable String Useremail) {
		
			
			
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			
			return "Admin/DocumentEdit";
		}

//-----------------********		NAVIGATION TO DETAILS End	********---------------------------------

	
//-----------------********		NAVIGATION TO Edit & UPDATE User Function 	********---------------------------------
		
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
		
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		
		return "Customer/form";
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
		
		String firstNameStore = dao.getFirstName(Useremail).get(0);
		
		model.addAttribute("firstName", firstNameStore);
		model.addAttribute("Useremail", Useremail);
		
		return "Customer/form";
	}
	
//-----------------*******End OF New Customer Side UI*********---------------------------------

	
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
	
	@RequestMapping("/paymentPage/{Useremail}")
	public String goViewCart(Model model, @PathVariable String Useremail) {
			
			
			List<Payment> pay = dao.getPaymentInfo(Useremail);
			model.addAttribute("paymentData", pay);
			
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			
			//model.addAttribute("requestMessage", "You have successfully Requested those Legal Form");
			
			return "Customer/Payment";
	}
//-----------------******* Redirect Third Party Pay START *********---------------------------------
	
	@RequestMapping("/pay/{id}/{Useremail}")
	public String goDeleteOrder(Model model, @PathVariable String Useremail, @PathVariable int id) {
			
			dao.deleteOrderById(id);
		
			String firstNameStore = dao.getFirstName(Useremail).get(0);
			
			model.addAttribute("firstName", firstNameStore);
			model.addAttribute("Useremail", Useremail);
			
			List<Payment> pay = dao.getPaymentInfo(Useremail);
			model.addAttribute("paymentData", pay);
			
			model.addAttribute("requestMessage", "You have successfully Deleted that order");
			
			return "Customer/Payment";
	}
	
//-----------------********* Redirect Third Party Pay START *******---------------------------------

	
	
//-----------------********* General Registration Form  START *******---------------------------------

	@RequestMapping("/generalApplication/{Useremail}")	
	public String goGeneralApplication(Model model, @PathVariable String Useremail) {
	
		// Regular Code to send to General Application sos that Forms will work properly
		model.addAttribute("childExpenses", (generalDao.getChildExpenses(Useremail)));
		model.addAttribute("children", (generalDao.getChildren(Useremail)));
		model.addAttribute("clientInfo", (generalDao.getclientInfoList(Useremail)));
		model.addAttribute("martialInfo", (generalDao.getMartialInfo(Useremail)));
		model.addAttribute("matrimonialHome", (generalDao.getMatrimonialHome(Useremail)));
		model.addAttribute("spouseInfo", (generalDao.getSpouseInfo(Useremail)));
		// Needed in order to work with general application form
		
		// Regular Customer JSP EL tags needed code
				String firstNameStore = dao.getFirstName(Useremail).get(0);
				
				model.addAttribute("firstName", firstNameStore);
				model.addAttribute("Useremail", Useremail);
		// Needed for Customer JSP EL tags
		
		return "Customer/Application";
	}
	
	
// First Class Saving Data to DAO method	
	@RequestMapping("/childExpense/{Useremail}")	
	public String goChildExpenses(Model model, @PathVariable String Useremail, @ModelAttribute ChildExpenses childExpenses) {
		synchronized (ChildExpenses.class) {
			generalDao.addChildExpenses(childExpenses);
		}
		
				// Regular Code to send to General Application sos that Forms will work properly
				model.addAttribute("childExpenses", (generalDao.getChildExpenses(Useremail)));
				model.addAttribute("children", (generalDao.getChildren(Useremail)));
				model.addAttribute("clientInfo", (generalDao.getclientInfoList(Useremail)));
				model.addAttribute("martialInfo", (generalDao.getMartialInfo(Useremail)));
				model.addAttribute("matrimonialHome", (generalDao.getMatrimonialHome(Useremail)));
				model.addAttribute("spouseInfo", (generalDao.getSpouseInfo(Useremail)));
				// Needed in order to work with general application form
				
				// Regular Customer JSP EL tags needed code
						String firstNameStore = dao.getFirstName(Useremail).get(0);
						
						model.addAttribute("firstName", firstNameStore);
						model.addAttribute("Useremail", Useremail);
						model.addAttribute("confirmationMessage", "Successfully Added/Changed Child Expenses Data");
				// Needed for Customer JSP EL tags
				
				return "Customer/Application";
	}
// First Class Saving Data to DAO method __ END
	
// Second Class Saving Data to DAO method	
		@RequestMapping("/children/{Useremail}")	
		public String goChildren(Model model, @PathVariable String Useremail, @ModelAttribute Children children) {
			synchronized (Children.class) {
				generalDao.addChildren(children);
			}
			
					// Regular Code to send to General Application sos that Forms will work properly
					model.addAttribute("childExpenses", (generalDao.getChildExpenses(Useremail)));
					model.addAttribute("children", (generalDao.getChildren(Useremail)));
					model.addAttribute("clientInfo", (generalDao.getclientInfoList(Useremail)));
					model.addAttribute("martialInfo", (generalDao.getMartialInfo(Useremail)));
					model.addAttribute("matrimonialHome", (generalDao.getMatrimonialHome(Useremail)));
					model.addAttribute("spouseInfo", (generalDao.getSpouseInfo(Useremail)));
					// Needed in order to work with general application form
					
					// Regular Customer JSP EL tags needed code
							String firstNameStore = dao.getFirstName(Useremail).get(0);
							
							model.addAttribute("firstName", firstNameStore);
							model.addAttribute("Useremail", Useremail);
							model.addAttribute("confirmationMessage", "Successfully Added/Changed Children Data");
					// Needed for Customer JSP EL tags
					
					return "Customer/Application";
		}
// Second Class Saving Data to DAO method __ END
	
// Third Class Saving Data to DAO method	
				@RequestMapping("/clientInfo/{Useremail}")	
				public String goClientInfo(Model model, @PathVariable String Useremail, @ModelAttribute ClientInfo clientInfo) {
					synchronized (ClientInfo.class) {
						generalDao.addClientInfo(clientInfo);
					}
					
							// Regular Code to send to General Application sos that Forms will work properly
							model.addAttribute("childExpenses", (generalDao.getChildExpenses(Useremail)));
							model.addAttribute("children", (generalDao.getChildren(Useremail)));
							model.addAttribute("clientInfo", (generalDao.getclientInfoList(Useremail)));
							model.addAttribute("martialInfo", (generalDao.getMartialInfo(Useremail)));
							model.addAttribute("matrimonialHome", (generalDao.getMatrimonialHome(Useremail)));
							model.addAttribute("spouseInfo", (generalDao.getSpouseInfo(Useremail)));
							// Needed in order to work with general application form
							
							// Regular Customer JSP EL tags needed code
									String firstNameStore = dao.getFirstName(Useremail).get(0);
									
									model.addAttribute("firstName", firstNameStore);
									model.addAttribute("Useremail", Useremail);
									model.addAttribute("confirmationMessage", "Successfully Added/Changed Client(Your) Info Data");
							// Needed for Customer JSP EL tags
							
							return "Customer/Application";
				}
// Third Class Saving Data to DAO method __ END
		
// Fourth Class Saving Data to DAO method	
				@RequestMapping("/martialInfo/{Useremail}")	
				public String goMartialInfo(Model model, @PathVariable String Useremail, @ModelAttribute MartialInfo martialInfo) {
					synchronized (MartialInfo.class) {
						generalDao.addMartialInfo(martialInfo);
					}
					
							// Regular Code to send to General Application sos that Forms will work properly
							model.addAttribute("childExpenses", (generalDao.getChildExpenses(Useremail)));
							model.addAttribute("children", (generalDao.getChildren(Useremail)));
							model.addAttribute("clientInfo", (generalDao.getclientInfoList(Useremail)));
							model.addAttribute("martialInfo", (generalDao.getMartialInfo(Useremail)));
							model.addAttribute("matrimonialHome", (generalDao.getMatrimonialHome(Useremail)));
							model.addAttribute("spouseInfo", (generalDao.getSpouseInfo(Useremail)));
							// Needed in order to work with general application form
							
							// Regular Customer JSP EL tags needed code
									String firstNameStore = dao.getFirstName(Useremail).get(0);
									
									model.addAttribute("firstName", firstNameStore);
									model.addAttribute("Useremail", Useremail);
									model.addAttribute("confirmationMessage", "Successfully Added/Changed Martial Info Data");
							// Needed for Customer JSP EL tags
							
							return "Customer/Application";
				}
// Fourth Class Saving Data to DAO method __ END				

// Fifth Class Saving Data to DAO method	
				@RequestMapping("/matrimonialHome/{Useremail}")	
				public String goMatrimonialHome(Model model, @PathVariable String Useremail, @ModelAttribute MatrimonialHome matrimonialHome) {
					synchronized (MatrimonialHome.class) {
						generalDao.addMatrimonialHome(matrimonialHome);
					}
					
							// Regular Code to send to General Application sos that Forms will work properly
							model.addAttribute("childExpenses", (generalDao.getChildExpenses(Useremail)));
							model.addAttribute("children", (generalDao.getChildren(Useremail)));
							model.addAttribute("clientInfo", (generalDao.getclientInfoList(Useremail)));
							model.addAttribute("martialInfo", (generalDao.getMartialInfo(Useremail)));
							model.addAttribute("matrimonialHome", (generalDao.getMatrimonialHome(Useremail)));
							model.addAttribute("spouseInfo", (generalDao.getSpouseInfo(Useremail)));
							// Needed in order to work with general application form
							
							// Regular Customer JSP EL tags needed code
									String firstNameStore = dao.getFirstName(Useremail).get(0);
									
									model.addAttribute("firstName", firstNameStore);
									model.addAttribute("Useremail", Useremail);
									model.addAttribute("confirmationMessage", "Successfully Added/Changed Matrimonial Home Information Data");
							// Needed for Customer JSP EL tags
							
							return "Customer/Application";
				}
// Fifth Class Saving Data to DAO method __ END				
				
// Sixth Class Saving Data to DAO method	
				@RequestMapping("/spouseInfo/{Useremail}")	
				public String goSpouseInfo(Model model, @PathVariable String Useremail, @ModelAttribute SpouseInfo spouseInfo) {
					synchronized (SpouseInfo.class) {
						generalDao.addSpouseInfo(spouseInfo);
					}
					
							// Regular Code to send to General Application sos that Forms will work properly
							model.addAttribute("childExpenses", (generalDao.getChildExpenses(Useremail)));
							model.addAttribute("children", (generalDao.getChildren(Useremail)));
							model.addAttribute("clientInfo", (generalDao.getclientInfoList(Useremail)));
							model.addAttribute("martialInfo", (generalDao.getMartialInfo(Useremail)));
							model.addAttribute("matrimonialHome", (generalDao.getMatrimonialHome(Useremail)));
							model.addAttribute("spouseInfo", (generalDao.getSpouseInfo(Useremail)));
							// Needed in order to work with general application form
							
							// Regular Customer JSP EL tags needed code
									String firstNameStore = dao.getFirstName(Useremail).get(0);
									
									model.addAttribute("firstName", firstNameStore);
									model.addAttribute("Useremail", Useremail);
									model.addAttribute("confirmationMessage", "Successfully Added/Changed Spouse Information Data");
							// Needed for Customer JSP EL tags
							
							return "Customer/Application";
				}
// Sixth Class Saving Data to DAO method __ END				
				
//-----------------********* General Registration Form  END *******---------------------------------

	
	
//----**** ABOVE this PARAS Code*******---------------------------------

	
	
	
	

//----**** BELOW this PRODIP Code*******---------------------------------

//-----------------File View and Add --	START---------------------------------
	
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
		model.addAttribute("presentDirectory", folderName);
		
		model.addAttribute("dirSet", dirSet);
		return  "Admin/Files";
			
	  
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
		FileDao fileDao = new FileDao();
		String dir = fileDao.getDirPath( folderName );
		fileDao.addFile(file, dir);

		model.addAttribute("message",
		        "You successfully uploaded '" + file.getOriginalFilename() + "'");
		
		// showing the list of file in the folder
		
		Set<String> dirSet = null;;
		try {
			dirSet = fileDao.listFilesUsingFileWalkAndVisitor(
					fileDao.getDirPath( folderName )
					);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("presentDirectory", folderName);
		
		model.addAttribute("dirSet", dirSet);

        return "Admin/Files";
    }

			
//-----------------File View and Add --	END---------------------------------

//----**** ABOVE this PRODIP Code*******---------------------------------
			
	
	
	
	

	
	
}
	
	
	