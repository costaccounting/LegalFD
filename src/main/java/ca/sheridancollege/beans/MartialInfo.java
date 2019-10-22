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
public class MartialInfo {
	
	@Id
	private String userEmail;
	
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
