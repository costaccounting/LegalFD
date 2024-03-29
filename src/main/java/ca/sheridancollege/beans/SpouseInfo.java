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
public class SpouseInfo {
	
	@Id
	private String userEmail;
	
	private String spouseName;
	//@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private String spouseDateOfBirth;
	private String spousePlaceOfBirth;
	private String spouseCitizenship;
	private String spouseSIN;
	private String spouseSurnameBirth;
	private String spouseSurnameMarriage;
	private String spouseCurrentAddress;
	//@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private String spouseSinceWhen;
	private String spouseMailingAddress;
	private String spouseHomeTel;
	private String spouseWorkTel;
	private String spouseCell;
	private String spouseFax;
	private String spouseEmail;
	private String spouseDivorcedStatus;
	private String spouseDivorcePlace;
	//@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private String spouseDivorceDate;
	private String spouseJobTitle;
	private String spouseCurrentEmployer;
	private String spouseEmployerAddress;
	private String spouseAnnualIncome;
	private String spouseIncomeOtherSource;


}
