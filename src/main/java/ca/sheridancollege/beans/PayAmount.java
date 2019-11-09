package ca.sheridancollege.beans;

import java.util.*;

import javax.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class PayAmount {

	@Id
	@GeneratedValue
	private int id;
	
	private String email;
	private String amount;
	private String timePayment;
	private List<String> requestedDocs;
	
	
	public PayAmount(String email, String amount, String timePayment, List<String> requestedDocs) {
		super();
		this.email = email;
		this.amount = amount;
		this.timePayment = timePayment;
		this.requestedDocs = requestedDocs;
	} 
	
}
