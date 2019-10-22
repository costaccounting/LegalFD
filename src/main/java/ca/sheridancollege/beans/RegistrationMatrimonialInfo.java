package ca.sheridancollege.beans;

import javax.persistence.Entity;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class RegistrationMatrimonialInfo {
	
	private String firstAddress;
	private String firstTitle;
	private double firstValue;
	private double firstMortgage;
	
	private String secondAddress;
	private String secondTitle;
	private double secondValue;
	private double secondMortgage;

}
