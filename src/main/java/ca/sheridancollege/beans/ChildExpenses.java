package ca.sheridancollege.beans;

import java.io.Serializable;
import java.util.*;
import javax.persistence.*;
import lombok.*;
import javax.validation.constraints.*;

import org.hibernate.validator.constraints.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity

public class ChildExpenses {

	@Id
	private String userEmail;
	
	private String medical;
	private String educational;
	private String postEducational;
	private String daycare;
	private String extraCurricular;
	private String others;
	
}
