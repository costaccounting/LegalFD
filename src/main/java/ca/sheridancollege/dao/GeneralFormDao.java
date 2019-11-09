package ca.sheridancollege.dao;

import ca.sheridancollege.beans.*;
import java.util.*;

import javax.persistence.*;
import javax.persistence.Query;
import javax.persistence.criteria.*;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.hibernate.*;
import org.hibernate.cfg.*;


public class GeneralFormDao {

	SessionFactory sessionFactory = new Configuration().
			configure("hibernate.cfg.xml").buildSessionFactory();

// Code Getting Data From MYSQL START	
// ------------*********	Get Child Expenses Class Data	***********------------------------
	public ChildExpenses getChildExpenses(String userEmail){
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		List<ChildExpenses> childExpensesList;
		
		Query query = session.createQuery("from ChildExpenses where userEmail =:userEmail");
		query.setParameter("userEmail", userEmail);
		
		childExpensesList= query.getResultList();
		
		
		session.getTransaction().commit();
		session.close();
		
		if(childExpensesList == null || childExpensesList.size() == 0) {
			return new ChildExpenses();
		}
		else {
			return childExpensesList.get(0);
		}
	}
// ------------*********	Get Child Expenses Class Data ____END____***********------------------------
	
	
// ------------*********	Get Children Class Data	***********------------------------
		public Children getChildren(String userEmail){
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			List<Children> children;
			
			Query query = session.createQuery("from Children where userEmail =:userEmail");
			query.setParameter("userEmail", userEmail);
			
			children= query.getResultList();
			
			
			session.getTransaction().commit();
			session.close();
			
			if(children == null || children.size() == 0) {
				return new Children();
			}
			else {
				return children.get(0);
			}
		}
// ------------*********	Get Child Expenses Class Data ____END____***********------------------------
	
// ------------*********	Get Child Expenses Class Data	***********------------------------
		public ClientInfo getclientInfoList(String userEmail){
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			List<ClientInfo> clientInfoList;
			
			Query query = session.createQuery("from ClientInfo where userEmail =:userEmail");
			query.setParameter("userEmail", userEmail);
			
			clientInfoList= query.getResultList();
			
			
			session.getTransaction().commit();
			session.close();
			
			if(clientInfoList == null || clientInfoList.size() == 0) {
				return new ClientInfo();
			}
			else {
				return clientInfoList.get(0);
			}
		}
// ------------*********	Get Child Expenses Class Data ____END____***********------------------------
		
// ------------*********	Get Child Expenses Class Data	***********------------------------
		public MartialInfo getMartialInfo(String userEmail){
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			List<MartialInfo> martialInfoList;
			
			Query query = session.createQuery("from MartialInfo where userEmail =:userEmail");
			query.setParameter("userEmail", userEmail);
			
			martialInfoList= query.getResultList();
			
			
			session.getTransaction().commit();
			session.close();
			
			if(martialInfoList == null || martialInfoList.size() == 0) {
				return new MartialInfo();
			}
			else {
				return martialInfoList.get(0);
			}
		}
// ------------*********	Get Child Expenses Class Data ____END____***********------------------------

// ------------*********	Get Child Expenses Class Data	***********------------------------
		public MatrimonialHome getMatrimonialHome(String userEmail){
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			List<MatrimonialHome> matrimonialHomeList;
			
			Query query = session.createQuery("from MatrimonialHome where userEmail =:userEmail");
			query.setParameter("userEmail", userEmail);
			
			matrimonialHomeList= query.getResultList();
			
			
			session.getTransaction().commit();
			session.close();
			
			if(matrimonialHomeList == null || matrimonialHomeList.size() == 0) {
				return new MatrimonialHome();
			}
			else {
				return matrimonialHomeList.get(0);
			}
		}
// ------------*********	Get Child Expenses Class Data ____END____***********------------------------

// ------------*********	Get Child Expenses Class Data	***********------------------------
				public SpouseInfo getSpouseInfo(String userEmail){
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					List<SpouseInfo> spouseInfoList;
					
					Query query = session.createQuery("from SpouseInfo where userEmail =:userEmail");
					query.setParameter("userEmail", userEmail);
					
					spouseInfoList= query.getResultList();
					
					
					session.getTransaction().commit();
					session.close();
					
					if(spouseInfoList == null || spouseInfoList.size() == 0) {
						return new SpouseInfo();
					}
					else {
						return spouseInfoList.get(0);
					}
				}
// ------------*********	Get Child Expenses Class Data ____END____***********------------------------
// Code Getting Data From MYSQL -- END
				
				
//Code Saving Data in MYSQL Database  -- START
		
				public void addChildExpenses(ChildExpenses childExpenses, String email)
				{
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					//session.save(childExpenses);
					
					ChildExpenses childExp = (ChildExpenses) session.get(ChildExpenses.class, email);
					childExp.setMedical(childExpenses.getMedical());
					childExp.setEducational(childExpenses.getEducational());
					childExp.setPostEducational(childExpenses.getPostEducational());
					childExp.setDaycare(childExpenses.getDaycare());
					childExp.setExtraCurricular(childExpenses.getExtraCurricular());
					childExp.setOthers(childExpenses.getOthers());
					
					session.getTransaction().commit();
					session.close();
				}
				
				public void addClientInfo(ClientInfo clientInfo, String email)
				{
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					ClientInfo client = (ClientInfo) session.get(ClientInfo.class, email);
					
					client.setFullLegalName(clientInfo.getFullLegalName());
					client.setDateOfBirth(clientInfo.getDateOfBirth());
					client.setCitizenship(clientInfo.getCitizenship());
					client.setPlaceOfBirth(clientInfo.getPlaceOfBirth());
					client.setSIN(clientInfo.getSIN());
					client.setSurnameBirth(clientInfo.getSurnameBirth());
					client.setSurnameBeforeMarriage(clientInfo.getSurnameBeforeMarriage());
					client.setCurrentHomeAddress(clientInfo.getCurrentHomeAddress());
					client.setSinceWhen(clientInfo.getSinceWhen());
					client.setCurrentMailingAddress(clientInfo.getCurrentMailingAddress());
					client.setHomeTel(clientInfo.getHomeTel());
					client.setWorkTel(clientInfo.getWorkTel());
					client.setCell(clientInfo.getCell());
					client.setFax(clientInfo.getFax());
					client.setEmail(clientInfo.getEmail());
					client.setDivorcedBefore(clientInfo.getDivorcedBefore());
					client.setPlace(clientInfo.getPlace());
					client.setDate(clientInfo.getDate());
					client.setJobTitle(clientInfo.getJobTitle());
					client.setCurrentEmployer(clientInfo.getCurrentEmployer());
					client.setEmployerAddress(clientInfo.getEmployerAddress());
					client.setAnnualIncome(clientInfo.getAnnualIncome());
					client.setIncomeOtherSource(clientInfo.getIncomeOtherSource());
					
					
					
					session.getTransaction().commit();
					session.close();
				}
				
				public void addChildren(Children children, String email)
				{
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					Children child = (Children) session.get(Children.class, email);
					
					child.setChildName1(children.getChildName1());
					child.setDobChild1(children.getDobChild1());
					child.setLivingChild1(children.getLivingChild1());
					child.setGradeChild1(children.getGradeChild1());
					child.setSchoolChild1(children.getSchoolChild1());
					
					child.setChildName2(children.getChildName2());
					child.setDobChild2(children.getDobChild2());
					child.setLivingChild2(children.getLivingChild2());
					child.setGradeChild2(children.getGradeChild2());
					child.setSchoolChild2(children.getSchoolChild2());
					
					child.setChildName2(children.getChildName3());
					child.setDobChild2(children.getDobChild3());
					child.setLivingChild2(children.getLivingChild3());
					child.setGradeChild2(children.getGradeChild3());
					child.setSchoolChild2(children.getSchoolChild3());
					
					child.setChildName2(children.getChildName4());
					child.setDobChild2(children.getDobChild4());
					child.setLivingChild2(children.getLivingChild4());
					child.setGradeChild2(children.getGradeChild4());
					child.setSchoolChild2(children.getSchoolChild4());
				
					
					session.getTransaction().commit();
					session.close();
				}
				
				public void addMartialInfo(MartialInfo martialInfo, String email)
				{
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					MartialInfo martial = (MartialInfo) session.get(MartialInfo.class, email);
					
					martial.setMarriageDate(martialInfo.getMarriageDate());
					martial.setMarriagePlace(martialInfo.getMarriagePlace());
					martial.setCohabitationDate(martialInfo.getCohabitationDate());
					martial.setSeparationDate(martialInfo.getSeparationDate());
					martial.setCourtCase(martialInfo.getCourtCase());
					martial.setWrittenAgreement(martialInfo.getWrittenAgreement());
					martial.setRelevantDate(martialInfo.getRelevantDate());
					martial.setSafetyConcerns(martialInfo.getSafetyConcerns());
					martial.setSpouseCriminalRecord(martialInfo.getSpouseCriminalRecord());
					
					session.getTransaction().commit();
					session.close();
				}
				
				public void addMatrimonialHome(MatrimonialHome matrimonialHome, String email)
				{
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					MatrimonialHome matrimonial = (MatrimonialHome) session.get(MatrimonialHome.class, email);
					
					matrimonial.setFirstAddress(matrimonialHome.getFirstAddress());
					matrimonial.setFirstTitle(matrimonialHome.getFirstTitle());
					matrimonial.setFirstValue(matrimonialHome.getFirstValue());
					matrimonial.setFirstMortgage(matrimonialHome.getFirstMortgage());
					
					matrimonial.setSecondAddress(matrimonialHome.getSecondAddress());
					matrimonial.setSecondTitle(matrimonialHome.getSecondTitle());
					matrimonial.setSecondValue(matrimonialHome.getSecondValue());
					matrimonial.setSecondMortgage(matrimonialHome.getSecondMortgage());
					
					matrimonial.setExcludePropertyClient(matrimonialHome.getExcludePropertyClient());
					matrimonial.setExcludePropertySpouse(matrimonialHome.getExcludePropertySpouse());
					
					session.getTransaction().commit();
					session.close();
				}
				
				public void addSpouseInfo(SpouseInfo spouseInfo, String email)
				{
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					SpouseInfo spouse = (SpouseInfo) session.get(SpouseInfo.class, email);
					
					spouse.setSpouseName(spouseInfo.getSpouseName());
					spouse.setSpouseDateOfBirth(spouseInfo.getSpouseDateOfBirth());
					spouse.setSpousePlaceOfBirth(spouseInfo.getSpousePlaceOfBirth());
					spouse.setSpouseCitizenship(spouseInfo.getSpouseCitizenship());
					spouse.setSpouseSIN(spouseInfo.getSpouseSIN());	
					spouse.setSpouseSurnameBirth(spouseInfo.getSpouseSurnameBirth());
					spouse.setSpouseSurnameMarriage(spouseInfo.getSpouseSurnameMarriage());
					spouse.setSpouseCurrentAddress(spouseInfo.getSpouseCurrentAddress());
					spouse.setSpouseSinceWhen(spouseInfo.getSpouseSinceWhen());
					spouse.setSpouseMailingAddress(spouseInfo.getSpouseMailingAddress());
					spouse.setSpouseHomeTel(spouseInfo.getSpouseHomeTel());
					spouse.setSpouseWorkTel(spouseInfo.getSpouseWorkTel());
					spouse.setSpouseCell(spouseInfo.getSpouseCell());
					spouse.setSpouseFax(spouseInfo.getSpouseFax());
					spouse.setSpouseEmail(spouseInfo.getSpouseEmail());
					spouse.setSpouseDivorcedStatus(spouseInfo.getSpouseDivorcedStatus());
					spouse.setSpouseDivorcePlace(spouseInfo.getSpouseDivorcePlace());
					spouse.setSpouseDivorceDate(spouseInfo.getSpouseDivorceDate());
					spouse.setSpouseJobTitle(spouseInfo.getSpouseJobTitle());
					spouse.setSpouseCurrentEmployer(spouseInfo.getSpouseCurrentEmployer());
					spouse.setSpouseEmployerAddress(spouseInfo.getSpouseEmployerAddress());
					spouse.setSpouseAnnualIncome(spouseInfo.getSpouseAnnualIncome());
					spouse.setSpouseIncomeOtherSource(spouseInfo.getSpouseIncomeOtherSource());
										
					session.getTransaction().commit();
					session.close();
				}
				
//Code Saving Data in MYSQL Database  -- END
				
				
				
// ------------*********	Delete Rows for Tables	*******---------------				


// ------------*********	Delete Rows for Child Expense - Start	*******---------------					

			public void deleteChildExpenses(String email){

			Session session = sessionFactory.openSession();
			session.beginTransaction();
					
			ChildExpenses childExpenses = (ChildExpenses) session.get(ChildExpenses.class, email);
			session.delete(childExpenses);
				
			session.getTransaction().commit();
			session.close();
		}
		
		
		

// ------------*********	Delete Rows for Child Expense - End	*******---------------								

			// ------------*********	Delete Rows for Children - Start	*******---------------					

						public void deleteChildren(String email){
						Session session = sessionFactory.openSession();
						session.beginTransaction();
								
						Children child = (Children) session.get(Children.class, email);
						session.delete(child);
							
						session.getTransaction().commit();
						session.close();
					}

			// ------------*********	Delete Rows for Children - End	*******---------------								

						// ------------*********	Delete Rows for ClientInfo - Start	*******---------------					

						public void deleteClientInfo(String email){
						Session session = sessionFactory.openSession();
						session.beginTransaction();
								
						ClientInfo clientInfo = (ClientInfo) session.get(ClientInfo.class, email);
						session.delete(clientInfo);
							
						session.getTransaction().commit();
						session.close();
					}

			// ------------*********	Delete Rows for ClientInfo - End	*******---------------								

						
	 	// ------------*********	Delete Rows for MartialInfo - Start	*******---------------					

						public void deleteMartialInfo(String email){
						Session session = sessionFactory.openSession();
						session.beginTransaction();
								
						MartialInfo martialInfo = (MartialInfo) session.get(MartialInfo.class, email);
						session.delete(martialInfo);
							
						session.getTransaction().commit();
						session.close();
					}

			// ------------*********	Delete Rows for MartialInfo - End	*******---------------								

					 	// ------------*********	Delete Rows for MatrimonialHome - Start	*******---------------					

						public void deleteMatrimonialHome(String email){
						Session session = sessionFactory.openSession();
						session.beginTransaction();
								
						MatrimonialHome matrimonialHome = (MatrimonialHome) session.get(MatrimonialHome.class, email);
						session.delete(matrimonialHome);
							
						session.getTransaction().commit();
						session.close();
					}

			// ------------*********	Delete Rows for MatrimonialHome - End	*******---------------								

					 	// ------------*********	Delete Rows for SpouseInfo - Start	*******---------------					

						public void deleteSpouseInfo(String email){
						Session session = sessionFactory.openSession();
						session.beginTransaction();
								
						SpouseInfo spouseInfo = (SpouseInfo) session.get(SpouseInfo.class, email);
						session.delete(spouseInfo);
							
						session.getTransaction().commit();
						session.close();
					}

			// ------------*********	Delete Rows for SpouseInfo - End	*******---------------								

						
										
						
// ------------*********	Delete Rows for Tables	*******---------------				
				
}
