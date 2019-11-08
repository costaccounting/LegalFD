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
		
				public void addChildExpenses(ChildExpenses childExpenses)
				{
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					session.save(childExpenses);
					
					session.getTransaction().commit();
					session.close();
				}
				
				public void addClientInfo(ClientInfo clientInfo)
				{
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					session.save(clientInfo);
					
					session.getTransaction().commit();
					session.close();
				}
				
				public void addChildren(Children children)
				{
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					session.save(children);
					
					session.getTransaction().commit();
					session.close();
				}
				
				public void addMartialInfo(MartialInfo martialInfo)
				{
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					session.save(martialInfo);
					
					session.getTransaction().commit();
					session.close();
				}
				
				public void addMatrimonialHome(MatrimonialHome matrimonialHome)
				{
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					session.save(matrimonialHome);
					
					session.getTransaction().commit();
					session.close();
				}
				
				public void addSpouseInfo(SpouseInfo spouseInfo)
				{
					Session session = sessionFactory.openSession();
					session.beginTransaction();
					
					session.save(spouseInfo);
					
					session.getTransaction().commit();
					session.close();
				}
				
//Code Saving Data in MYSQL Database  -- END
				
				
}
