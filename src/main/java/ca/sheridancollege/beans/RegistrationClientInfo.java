package ca.sheridancollege.beans;


import java.util.Date;

import javax.persistence.Entity;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.*;

@Data
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
	

}
