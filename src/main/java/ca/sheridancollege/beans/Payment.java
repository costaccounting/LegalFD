package ca.sheridancollege.beans;

import javax.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@NamedQuery(name = "Payment.byEmail", query = "delete from Payment where userEmail = :userEmail")
public class Payment {

	@Id
	@GeneratedValue
	private int id;
	
	private String userEmail;
	private String documentType;
	private String documentAmount;
	
	private String formType;
	
	
	public Payment(String userEmail, String documentType, String documentAmount) {
		this.userEmail = userEmail;
		this.documentType = documentType;
		this.documentAmount = documentAmount;
	}


	public Payment(String userEmail, String documentType, String formType, String documentAmount) {
		this.userEmail = userEmail;
		this.documentType = documentType;
		this.documentAmount = documentAmount;
		this.formType = formType;
	}
	
	
}
