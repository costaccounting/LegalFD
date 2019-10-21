package ca.sheridancollege.beans;


import java.util.Date;

import javax.persistence.Entity;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class RegistrationClientInfo {
	
	private String fullLegalName;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date dateOfBirth;
	private String citizenship;
	private String placeOfBirth;
	private int SIN;
	private String surnameBirth;
	private String surnameBeforeMarriage;
	private String currentHomeAddress;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date sinceWhen;
	private String currentMailingAddress;
	private int homeTel;
	private int workTel;
	private int cell;
	private int fax;
	private String email;
	private String divorcedBefore;
	private String place;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date date;
	private String jobTitle;
	private String currentEmployer;
	private String employerAddress;
	private double annualIncome;
	private double incomeOtherSource;


}
