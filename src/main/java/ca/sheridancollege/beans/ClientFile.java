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
	
	private String filename;
	private String clientID;
	private String uploadedBy;
	private Date uploadDate;
	
	public ClientFile(String filename, String clientID, String uploadedBy, Date uploadDate) {
		super();
		this.filename = filename;
		this.clientID = clientID;
		this.uploadedBy = uploadedBy;
		this.uploadDate = uploadDate;
	}
	
}

