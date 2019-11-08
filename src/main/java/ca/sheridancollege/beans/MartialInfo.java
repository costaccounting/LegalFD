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
	
	
	private String marriageDate;
	
	private String cohabitationDate;
	private String marriagePlace;
	
	private String separationDate;
	private String courtCase;
	private String writtenAgreement;
	
	private String relevantDate;
	private String safetyConcerns;
	private String spouseCriminalRecord;
}
