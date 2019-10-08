package ca.sheridancollege.dao;

import java.io.File;

import ca.sheridancollege.beans.Payment;
import ca.sheridancollege.beans.RegisterUser;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class FileDao {
	
	
	private static String location_string = "client_files";
	
	public boolean createFolder(RegisterUser user) {
		String path = getUsersHomeDir() + File.separator + location_string + File.separator + user.getEmail() ;
		
	    try {
			if (new File(path).mkdirs()) {
			    return true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	private static String getUsersHomeDir() {
	    String users_home = System.getProperty("user.home");
	    return users_home.replace("\\", "/"); // to support all platforms.
	}
	
	

}
