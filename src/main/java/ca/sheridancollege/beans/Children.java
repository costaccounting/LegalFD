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
public class Children {
	
	@Id
	private String userEmail;
	
	// First Child Info Fields to be Filled (If ANY)
	private String childName1;
	private String dobChild1;
	private String livingChild1;
	private String gradeChild1;
	private String schoolChild1;
	
	
	// Second Child Info Fields to be Filled (If ANY)
	private String childName2;
	private String dobChild2;
	private String livingChild2;
	private String gradeChild2;
	private String schoolChild2;
	
	// Third Child Info Fields to be Filled (If ANY)
	private String childName3;
	private String dobChild3;
	private String livingChild3;
	private String gradeChild3;
	private String schoolChild3;
	
	// Fourth Child Info Fields to be Filled (If ANY)
	private String childName4;
	private String dobChild4;
	private String livingChild4;
	private String gradeChild4;
	private String schoolChild4;
	
}
