# LegalFD


Web App for people who represents them self in Family Court. It helps them to fill out necessary Legal Forms and Legal Document by avoiding the leagal fees.

## Project Introduction Video(YouTube)
[Intro YouTube Video](https://www.youtube.com/watch?v=zhDkvyx1j10)

## Github Repo Link

Clone [Github Repository Link](https://github.com/costaccounting/LegalFD.git)

## Project URL

[LegalFD](http://52.15.179.77) 

## Project Structure


```
.
 ├── src/main/java                  # Contains all config files and Home controller
 ├── src/main/resources             # Contains the application properties and hibernate config xml file 
 ├── src                            # Contains all the jsp pages
 └── pom.xml                        # Dependencies xml file
```

### src structure

```
 ├── ...                 
 ├── src                            
      ├── main     
        ├── webapp                  # Contains all the front end pages
            ├── css                 # CSS files
            ├── img                 # Image files
            ├── WEB-INF
                ├── jsps            
                    ├── Admin       # Admin-Side portal jsp pages
                    ├── Customer    # Customer-Side portal jsp pages
                    ├── Lawyer      # Lawyer-Side portal jsp pages                
 └── pom.xml 
```

## Functionalities

### Admin 

* **Edit User** - Can edit any user personal information including assiging the role                 to any user.
* **List User** - List and Filter out user list.
* **Delete User** - Delete any user including lawyers and clients.
* **Upload Documents** - Upload prepared requested document to any client folder.
* **Edit Form Price** - Admin can edit form price and enable sale symbol for more customer to use this as a promotion.

### Lawyer

* **Edit User** - Can edit any user personal information including assiging the role                 to any user.
* **List User** - List and Filter out user list.
* **Upload Documents** - Upload prepared requested document to any client folder.

### Client

* **Request Legal Document/Forms** - Request necessary documents to lawyer.
* **Payment** - Pays for requested document.
* **Contact** - Can contact client via mail. 
* **General Information Form** - Application form for detailed information about client.
* **Uplaod Document** - can upload request document from lawyer.

 ## Hosting Service

 We are using **AWS** as our hosting service. 
 **RDS** as Relational Database and **EC2** instance to run our **Spring Boot** project as well as to maintain and store uploaded files.
