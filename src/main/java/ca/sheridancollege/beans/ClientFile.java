package ca.sheridancollege.beans;

import java.io.Serializable;
import java.util.*;
import javax.persistence.*;
import lombok.*;
import javax.validation.constraints.*;

import org.hibernate.validator.constraints.UniqueElements;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
//@NamedQuery(name = "Registered", query = "select * from RegisterUser")
public class ClientFile {

	@Id
	@GeneratedValue
	private int id;
	
	private String baseFileName;
	private String modifiedFileName;
	private String location;
	private String uploadedBy;
	private String uploadDate;
	
	public ClientFile(String baseFileName, String modifiedFileName, String location, String uploadedBy, String uploadDate) {
		super();
		this.baseFileName = baseFileName;
		this.modifiedFileName = modifiedFileName;
		this.location = location;
		this.uploadedBy = uploadedBy;
		this.uploadDate = uploadDate;
	}
	
}

