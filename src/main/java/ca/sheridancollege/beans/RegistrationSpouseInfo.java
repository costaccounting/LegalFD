package ca.sheridancollege.beans;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity

public class RegistrationSpouseInfo {
	
	private String spouseName;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date spouseDateOfBirth;
	private String spousePlaceOfBirth;
	private String spouseCitizenship;
	private int spouseSIN;
	private String spouseSurnameBirth;
	private String spouseSurnameMarriage;
	private String spouseCurrentAddress;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date spouseSinceWhen;
	private String spouseMailingAddress;
	private int spouseHomeTel;
	private int spouseWorkTel;
	private int spouseCell;
	private String spouseEmail;
	private String spouseDivorcedStatus;
	private String spouseDivorcePlace;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date spouseDivorceDate;
	private String spouseCurrentEmployer;
	private String spouseEmployerAddress;
	private double spouseAnnualIncome;
	private double spouseIncomeOtherSource;


}
