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
	private String firstValue;
	private String firstMortgage;
	
	private String secondAddress;
	private String secondTitle;
	private String secondValue;
	private String secondMortgage;
	
	private String excludePropertyClient;
	private String excludePropertySpouse;
	

}
