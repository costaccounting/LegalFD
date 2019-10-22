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

	
}
