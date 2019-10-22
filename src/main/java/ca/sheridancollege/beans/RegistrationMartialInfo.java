package ca.sheridancollege.beans;

import java.util.Date;

import javax.persistence.Entity;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class RegistrationMartialInfo {
	
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date marriageDate;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date cohabitationDate;
	private String marriagePlace;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date separationDate;
	private String courtCase;
	private String writtenAgreement;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date relevantDate;
	private String safetyConcerns;
	private String spouseCriminalRecord;
}
