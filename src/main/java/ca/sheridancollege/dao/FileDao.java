package ca.sheridancollege.dao;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
	public static String getProjectFolder() {
		return  getUsersHomeDir() + File.separator + location_string;
	}
	public static String getDirPath(String dirName) {
		return  getUsersHomeDir() + File.separator + location_string + File.separator + dirName;
	}
	public List getFileList(String dir){
		
		String location = getUsersHomeDir() + File.separator + location_string + File.separator + dir  ;
		
		List<File> list = new ArrayList<File>();
		
		File fileName = new File(location);
        File[] fileList = fileName.listFiles();
        
        for (File file: fileList) {
            
             list.add(file);
        }
		
		return list;
	}
	public Set<String> listFilesUsingFileWalkAndVisitor(String dir) throws IOException {
	    Set<String> fileList = new HashSet<>();
	    Files.walkFileTree(Paths.get(dir), new SimpleFileVisitor<Path>() {
	        @Override
	        public FileVisitResult visitFile(Path file, BasicFileAttributes attrs)
	          throws IOException {
	            if (!Files.isDirectory(file)) {
	                fileList.add(file.getFileName().toString());
	            }
	            return FileVisitResult.CONTINUE;
	        }
	    });
	    return fileList;
	}
	

}
