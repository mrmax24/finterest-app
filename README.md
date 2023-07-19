# <img src="https://github.com/mrmax24/finterest-app/blob/main/src/main/resources/public/logo1.png?raw=true" align="center" width=35px> Finterest
## Project description:
```bash
Financial management tool that helps users track their expenses, savings, and
income securely and confidentially. Developed using Hibernate and Spring frameworks,
it ensures reliable data storage and retrieval ensuring user privacy is maintained.
```

#### [Link to the project]()

## How to use the app:
1. Register and log in;
2. Create an account with a budget on the "Overview" page;
3. Add the expenses you have incurred for the day;
4. You can enter an amount in another currency and save the conversion in the primary currency;
5. Try to edit and delete an expense in your expense history;
6. Create another account and add certain expenses to it;
7. Go to the "Reports" tab in the menu and explore your expenses using different combination of criteria;
8. Go to the "Accounts" tab in the menu and try to edit the information in your account or delete it and create new one;
9. Try to log out of the app and log back in;


## Project structure

The project has a Three-Tier Architecture:
- **Presentation layer** (Controllers) - accepts requests from clients and sends results back to them.
- **Application logic** layer (Service), provide logic to operate on the data sent to and from the DAO and the client.
- **Data access layer** (DAO), represents a bridge between the database and the application.

## Used technologies and libraries:
| Technology            | Version  |
|:----------------------|:---------|
| `JDK`                 | `11`     |
| `Maven`               | `4.0.0`  |
| `Hibernate`           | `5.6.14` |
| `Hibernate validator` | `6.1.6`  |
| `Spring Framework`    | `5.3.20` |
| `Spring Web MVC`      | `-`      |
| `Spring Security`     | `5.6.10` |
| `Apache Tomcat`       | `9.0.50` |
| `Javax Servlet`       | `4.0.1`  |
| `Javax Annotation`    | `1.0`    |
| `Java Server Pages`   | `-`      |
| `MySQL`               | `8.0.28` |
| `Checkstyle`          | `3.1.1`  |

## Technical details
- **Entities** represent columns in the database;
- **BCryptPasswordEncoder** is used for password encryption
- **Hibernate annotations** are used for field validation
- **Custom annotations** are used for email and password validation
- **Config package** contains classes allow to configure Spring and Hibernate
- **Security package** contains class, allows to create UserDetails which store user information;



## Steps to run the program on your computer:
1. Clone the repo: https://github.com/mrmax24/cinema-app;
2. Install MySQL;
3. Create new schema in database;
4. Add you DB properties to db.properties file;
5. Configure Apache Tomcat version 9.0.50 **Artifact**: `war-exploded artifact`, **Application context**: `"/"`;
6. Create connection to DB using Database option (Intellij Idea Ultimate).
7. If you haven't Database option, create ConnectionUtil class and connect to DB manually
   (https://github.com/mrmax24/taxi-service/blob/main/src/main/java/taxi/util/ConnectionUtil.java);
8. Done. Now just run it;
9. Use **Postman** to send some http requests;



## Team
[Maksym Hrytsyna](https://www.linkedin.com/in/maksym-hrytsyna-12b893274/) (Java developer)
[Khrystyna Tkachyk](https://www.linkedin.com/in/khrystyna-tkachyk-501433272/) (UI-UX designer)
```


