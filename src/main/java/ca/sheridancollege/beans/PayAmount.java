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
	private String email;
	
	private String amount;
	private String timePayment;
	private List<String> requestedDocs; 
	
	
}
