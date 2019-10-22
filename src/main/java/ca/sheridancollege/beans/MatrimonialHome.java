package ca.sheridancollege.beans;

import org.springframework.format.annotation.*;
import java.io.*;
import java.util.*;
import javax.persistence.*;
import lombok.*;
import javax.validation.constraints.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class MatrimonialHome {
	
	@Id
	private String userEmail;
	
	private String firstAddress;
	private String firstTitle;
	private double firstValue;
	private double firstMortgage;
	
	private String secondAddress;
	private String secondTitle;
	private double secondValue;
	private double secondMortgage;
	
	private String excludePropertyClient;
	private String excludePropertySpouse;
	

}
