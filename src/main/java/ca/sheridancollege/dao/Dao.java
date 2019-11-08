package ca.sheridancollege.dao;

import ca.sheridancollege.beans.*;
import java.util.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;		
import java.nio.file.Path;		
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.*;
import javax.persistence.Query;
import javax.persistence.criteria.*;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.hibernate.*;
import org.hibernate.cfg.*;
	import org.springframework.web.multipart.MultipartFile;		
import ca.sheridancollege.beans.*;


public class Dao {

	private static String location_string = "client_files";

	SessionFactory sessionFactory = new Configuration().
			configure("hibernate.cfg.xml").buildSessionFactory();

//-----------------------------------------------------------******************************------------------------------------	
	
	public boolean addUser(RegisterUser register)
	{
		if(register!=null) {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			session.save(register);
			
			session.getTransaction().commit();
			session.close();
			return true;
		}
		else {
			return false;
		}	
	}

//-----------------------------------------------------------******************************------------------------------------	
	
	public void addPayment(Payment payment)
	{
		
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			session.save(payment);
			
			session.getTransaction().commit();
			session.close();	
	}
	
//-----------------------------------------------------------******************************------------------------------------	
	public List<String> userExist(String email, String password)			
	{			
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			Query query = session.createQuery("SELECT role from RegisterUser WHERE email =:email AND password =:password");
			query.setParameter("email", email);
			query.setParameter("password", password);
			
			List<String> checkUser = (List<String>) query.getResultList();

			session.getTransaction().commit();
			session.close();
			
			return checkUser;	
	}
	
//-----------------------------------------------------------******************************------------------------------------	
	
	public List<String> getRole(String email){
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		
		Query query = session.createQuery("select role from RegisterUser where email =:email");
		query.setParameter("email", email);
		
		
		List<String> register = (List<String>) query.getResultList();
		
		session.getTransaction().commit();
		session.close();
		
		return register;
	}

//-----------------------------------------------------------******************************------------------------------------	
	
	public List<String> getPassword(String email){
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		
		Query query = session.createQuery("select password from RegisterUser where email =:email");
		query.setParameter("email", email);
		
		List<String> register = (List<String>) query.getResultList();
		
		session.getTransaction().commit();
		session.close();
		
		return register;
	}

//-----------------------------------------------------------******************************------------------------------------	
	
		public List<String> getEmail(String email){
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			//Register register = session.get(Register.class, email, password);
			
			Query query = session.createQuery("select email from RegisterUser where email =:email");
			query.setParameter("email", email);
			
			List<String> register = (List<String>) query.getResultList();
			
			session.getTransaction().commit();
			session.close();
			
			return register;
		}
		
		
//-----------------------------------------------------------******************************------------------------------------	

		public List<String> getFirstName(String email){
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			//Register register = session.get(Register.class, email, password);
			
			Query query = session.createQuery("select firstName from RegisterUser where email =:email");
			query.setParameter("email", email);
			
			List<String> register = (List<String>) query.getResultList();
			
			session.getTransaction().commit();
			session.close();
			
			return register;
		}
		
//-----------------------------------------------------------******************************------------------------------------	
	
		public List<String> getLastName(String email){
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			//Register register = session.get(Register.class, email, password);
			
			Query query = session.createQuery("select lastName from RegisterUser where email =:email");
			query.setParameter("email", email);
			
			List<String> register = (List<String>) query.getResultList();
			
			session.getTransaction().commit();
			session.close();
			
			return register;
		}
		
//-----------------------------------------------------------******************************------------------------------------	
		
		public List<String> getDataForLawyer(String email){
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			//Register register = session.get(Register.class, email, password);
			
			Query query = session.createQuery("from RegisterUser where email != :email AND role != :role");
			query.setParameter("email", email);
			query.setParameter("role", "Admin");
			
			
			List<String> register = (List<String>) query.getResultList();
			
			session.getTransaction().commit();
			session.close();
			
			return register;
		}

//-----------------------------------------------------------******************************------------------------------------	
		
		public List<String> getDataForAdmin(String email) {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			Query query = session.createQuery("from RegisterUser where email != :email");
			query.setParameter("email", email);
			
			
			List<String> register = (List<String>) query.getResultList();
			
			session.getTransaction().commit();
			session.close();
			
			return register;
		}
		
//-----------------------------------------------------------******************************------------------------------------	
		public void deleteUser(String email) {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			RegisterUser register = (RegisterUser)session.get(RegisterUser.class, email);
			session.delete(register);
			
			session.getTransaction().commit();
			session.close();
		}
		
//-----------------------------------------------------------******************************------------------------------------	
				public RegisterUser getUser(String email) {
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					RegisterUser register = (RegisterUser)session.get(RegisterUser.class, email);
					
					session.getTransaction().commit();
					session.close();
					
					return register;
				}
			
//-----------------------------------------------------------******************************------------------------------------	
				public List<LawyerDocEdit> getDocPrice() {
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					List<LawyerDocEdit> docPrice;
					
					Query query = session.createQuery("from LawyerDocEdit");
					docPrice= query.getResultList();
					
					
					session.getTransaction().commit();
					session.close();
					
					return docPrice;
				}
				
			
//-----------------------------------------------------------******************************------------------------------------	
				public void editUser(String email, RegisterUser reg) {
					//String firstName, String lastName, String role
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					RegisterUser registredUser = (RegisterUser) session.get(RegisterUser.class, email);
					
					registredUser.setFirstName(reg.getFirstName());
					registredUser.setLastName(reg.getLastName());
					registredUser.setRole(reg.getRole());
					
					session.getTransaction().commit();
					session.close();
				}
	
//-----------------------------------------------------------******************************------------------------------------	
				
				public List<Payment> getPaymentInfo(String email)
				{
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					List<Payment> pay;
					
					Query query = session.createQuery("from Payment where userEmail =:email");
					query.setParameter("email", email);
					
					pay= query.getResultList();
					
					session.getTransaction().commit();
					session.close();
					
					return pay;
				}
	
//-----------------------------------------------------------******************************------------------------------------	
				public void deleteOrderById(int id){
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					Payment pay = (Payment) session.get(Payment.class, id);
					session.delete(pay);
					
					session.getTransaction().commit();
					session.close();
				}
				
//-----------------------------------------------------------******************************------------------------------------	
				public boolean editFormPrice(int id, LawyerDocEdit lawPrice){
					
					//String firstName, String lastName, String role
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					LawyerDocEdit lawNew = (LawyerDocEdit) session.get(LawyerDocEdit.class, id);
					
					lawNew.setDocType((lawPrice.getDocType()));
					lawNew.setFormType((lawPrice.getFormType()));
					lawNew.setPrice((lawPrice.getPrice()));
					lawNew.setSale(lawPrice.getSale());
					session.getTransaction().commit();
					
					session.close();
					
					return true;
				}
//-----------------------------------------------------------******************************------------------------------------	

								
								public String getFormInfo(int id)
								{
									Session session = sessionFactory.openSession();
									session.beginTransaction();
									
									String form;
									
									Query query = session.createQuery("select formType from LawyerDocEdit where id =:id");
									query.setParameter("id", id);
									
									form= (String) query.getResultList().get(0);
									
									session.getTransaction().commit();
									session.close();
									
									return form;
								}
//-----------------------------------------------------------******************************------------------------------------	
								
								public String getDocumentInfo(int id)
								{
									Session session = sessionFactory.openSession();
									session.beginTransaction();
									
									String document;
									
									Query query = session.createQuery("select docType from LawyerDocEdit where id =:id");
									query.setParameter("id", id);
									
									document= (String) query.getResultList().get(0);
									
									session.getTransaction().commit();
									session.close();
									
									return document;
								}
//-----------------------------------------------------------******************************------------------------------------	
								
		public List<String> validateUser(RegisterUser reg) {
			List<String> err = new ArrayList<String>();
			
			ValidatorFactory vf = Validation.buildDefaultValidatorFactory();
			
			Validator val = vf.getValidator();
			
			Set<ConstraintViolation<RegisterUser>> violationError = val.validate(reg);
			
			if(!violationError.isEmpty()) {
				for(ConstraintViolation<RegisterUser> error: violationError) {
					err.add(error.getPropertyPath() + ": :" + error.getMessage());
				}
			}
			return err;
		}

	public boolean createFolder(RegisterUser user) {		
			String path = getUsersHomeDir() + File.separator + location_string + File.separator + user.getEmail() ;		
					
		    try {		
				if (new File(path).mkdirs()) {		
				    return true;		
				}		
			} catch (Exception e) {		
				// TODO Auto-generated catch block		
				e.printStackTrace();		
			}		
			return false;		
		}	
	public boolean createFolder(String useremail) {		
		String path = getUsersHomeDir() + File.separator + location_string + File.separator + useremail ;		
				
	    try {		
			if (new File(path).mkdirs()) {		
			    return true;		
			}		
		} catch (Exception e) {		
			// TODO Auto-generated catch block		
			e.printStackTrace();		
		}		
		return false;		
	}
		private static String getUsersHomeDir() {		
		    String users_home = System.getProperty("user.home");		
		    return users_home.replace("\\", "/"); // to support all platforms.		
		}		
		public  String getProjectFolder() {		
			return  getUsersHomeDir() + File.separator + location_string;		
		}		
		public  String getDirPath(String dirName) {		
			String path =  (getUsersHomeDir() + File.separator + location_string + File.separator + dirName).replace("\\", "/");	
			File f = new File(path);
			if (!f.exists() || ! f.isDirectory()) {
				createFolder(dirName);
			}
			return path;
			
		}		
		public List getFileList(String dir){		
					
					
			List<File> list = new ArrayList<File>();		
			File fileName = new File(dir);		
			File[] fileList = fileName.listFiles();		
	        		
	        for (File file: fileList) {		
	            		
	             list.add(file);		
	        }		
					
			return list;		
		}		
				
		public boolean addFile(MultipartFile file, String dir, String uploader) {		
			if(file.isEmpty()) return false;		
			try {		
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmm");  
				DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
				
				LocalDateTime now = LocalDateTime.now();  
				
				String date = dtf.format(now);
				
				byte[] bytes = file.getBytes();		
				String modifiedFileName = uploader + "-" + date + "-" + file.getOriginalFilename();
				Path path = Paths.get(dir + File.separator+ modifiedFileName);		
						
				Files.write(path, bytes);	
				addFileRecord(file.getOriginalFilename(), modifiedFileName , dir , uploader ,  dtf2.format(now));
				return true;		
			} catch (IOException e) {		
				// TODO Auto-generated catch block		
				e.printStackTrace();		
			}		
			return false;		
		}		
		public File getFile(String filename, String dir) throws IOException {		
			File fileName = new File(getDirPath(dir));		
			File[] fileList = fileName.listFiles();		
					
			for (File file: fileList) {		
			    		
			     if(file.getName().equals(filename)) {		
			    	 return file;		
			     }		
			}		
			return null;		
		}
		public boolean addFileRecord(String baseFileName, String modifiedFileName, String location, String uploadedAccount, String date)
		{
			if(baseFileName!=null) {
				Session session = sessionFactory.openSession();
				session.beginTransaction();
				
				ClientFile cfile = new ClientFile(baseFileName, modifiedFileName, location, uploadedAccount, date );
				
				session.save(cfile);
				
				session.getTransaction().commit();
				session.close();
				return true;
			}
			else {
				return false;
			}	
		}
	public String[] getFileInfo(String modifiedName) {
			String info[] = new String[] { modifiedName , "" , "" , ""};
			
			try {
				Session session = sessionFactory.openSession();
				session.beginTransaction();
				
				Query query1 = session.createQuery("SELECT cf.uploadedBy FROM ClientFile cf WHERE cf.modifiedFileName =:modifiedFileName");
				Query query2 = session.createQuery("SELECT cf.uploadDate FROM ClientFile cf WHERE cf.modifiedFileName =:modifiedFileName");
				Query query3 = session.createQuery("SELECT cf.baseFileName FROM ClientFile cf WHERE cf.modifiedFileName =:modifiedFileName");
				query1.setParameter("modifiedFileName", modifiedName);
				query2.setParameter("modifiedFileName", modifiedName);
				query3.setParameter("modifiedFileName", modifiedName);
				
				info[1] = ( (List<String>) query1.getResultList() ).get(0);
				info[2] = ( (List<String>) query2.getResultList() ).get(0);
				info[3] = ( (List<String>) query3.getResultList() ).get(0);
				
				session.getTransaction().commit();
				session.close();
			} catch (HibernateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return info;
		}

		


}
