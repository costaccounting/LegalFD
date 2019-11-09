package ca.sheridancollege.beans;

import java.util.List;

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
	private String[] requestedDocs;
	
	public PayAmount(String email, String amount, String timePayment, String[] requestDoc) {
		super();
		this.email = email;
		this.amount = amount;
		this.timePayment = timePayment;
		this.requestedDocs = requestDoc;
	}
	
}
