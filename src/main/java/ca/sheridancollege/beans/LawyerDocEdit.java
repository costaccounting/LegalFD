package ca.sheridancollege.beans;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class LawyerDocEdit {

	@Id
	@GeneratedValue
	private int id;
	
	private String docType;
	private String formType;
	private String price;
	private boolean sale;
}
