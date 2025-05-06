# TVPSS Management Information System

> A centralized digital system to manage, monitor, and support the TV PSS program, making data handling easier, faster, and more accurate across all schools.

## Table of Contents

- [About](#about)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Usage](#usage)
- [Contributing](#contributing)
- [Acknowledgments](#acknowledgments)

## About

TV Pusat Sumber Sekolah (PSS) is a creative school program that helps students learn skills in journalism, media, and hosting. It encourages students to think creatively and critically. However, managing the program across different schools is hard because the team still uses manual methods to collect and track data, which can lead to mistakes and missing information. To solve this, we suggest creating a Management Information System (MIS) that stores all the data in one place, making it easier to find and use. This system will help the team make better decisions, use resources more wisely, and improve the overall success of the TV PSS program.

## Features

- Consolidates all program-related data into a single system for easy access and management
- Tracks and monitors the availability of resources such as equipment and performance metrics across schools
- Simplifies the application process for students by managing form submissions and collecting student information
- Allows users to upload activity content and documents, ensuring that all relevant materials are readily available in the system
- Enables the organization, editing, and deletion of uploaded content to maintain a consistent and up-to-date content library

## Tech Stack

A list of technologies, frameworks, and tools used in the project. For example:

- **Frontend**: JSP (JavaServer Pages)
- **Backend**: Spring Framework (Spring Web MVC, Spring ORM, Spring Security), Hibernate
- **Database**: MySQL
- **Build Tool**: Maven
- **Languages**: Java, HTML, CSS, JavaScript, SQL

## Getting Started

Instructions on how to set up and use the project locally.

### Prerequisites

Before running the project, make sure you have the following installed:

- **Java Development Kit (JDK)**: Version 8 or higher
- **Apache Maven**: Version 3.6.3 or higher
- **MySQL**: Version 8.0.27 or compatible
- **Web Server**: Apache Tomcat (for deploying the WAR file)
- **Integrated Development Environment (IDE)**: IntelliJ IDEA, Eclipse, or any Java-supporting IDE

### Installation

Step-by-step instructions on how to install your project:

1. **Clone the Repository**: Clone the repository using Git or download the ZIP file and extract it.

   ```bash
   git clone <repository-url>
   ```

2. **Navigate to the Project Directory**: Open a terminal and navigate to the directory containing the project files.

   ```bash
   cd <repository-folder>
   ```

3. **Configure the Database**: Create a new MySQL database and update the `application.properties` file with the database credentials.

   Example configuration:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/tvpssmis
   spring.datasource.username=root
   spring.datasource.password=your_password
   ```

4. **Install Dependencies**: Use Maven to download and install all required dependencies.

   ```bash
   mvn clean install
   ```

5. **Build the Project**: Compile the project and build the WAR file.

   ```bash
   mvn package
   ```

6. **Deploy the WAR File**: Copy the generated `tvpssmis.war` file from the `target` folder to your Apache Tomcat `webapps` directory.

7. **Start the Server**: Start the Apache Tomcat server. Once the server is running, you can access the application.

8. **Access the Application**: Open your web browser and navigate to:

   ```url
   http://localhost:8080/tvpssmis/
   ```

### Usage

Once the system is up and running, you can start using the application by following these steps:

1. **Access the Application**:  
   Open your web browser and navigate to:

   ```url
   http://localhost:8080/tvpssmis/
   ```

2. **Log In**:  
   Use the credentials provided for your role (Teacher, Jabatan Pendidikan Negeri Johor, Pejabat Pendidikan Daerah, or Student) to log in to the system. Below is an example of login credentials:

   - **Teacher**  
     - Username: `teacher_user`  
     - Password: `teacher_pass`  

   - **Jabatan Pendidikan Negeri Johor**  
     - Username: `jpnj_user`  
     - Password: `jpnj_pass`  

   - **Pejabat Pendidikan Daerah**  
     - Username: `ppd_user`  
     - Password: `ppd_pass`  

   - **Student**  
     - Username: `student_user`  
     - Password: `student_pass`  

## Contributing

We welcome contributions to the **TV PSS Management Information System**! If you'd like to contribute, follow these steps:

1. **Fork the Repository**  
   Click the "Fork" button at the top-right of this repository to create a copy of the project under your GitHub account.

2. **Clone Your Forked Repository**  
   Clone the forked repository to your local machine:

   ```bash
   git clone <your-forked-repo-url>
   ```

3. **Create a Feature Branch**  
   Create a new branch for your feature or bug fix:

   ```bash
   git checkout -b my-new-feature
   ```

4. **Make Your Changes**  
   Implement the changes or additions you want to contribute, ensuring your code follows best practices and is well-documented.

5. **Run Tests**  
   Test your changes thoroughly to ensure they work as expected and do not break existing functionality.

6. **Commit Your Changes**  
   Once you're happy with the changes, commit them with a clear and concise message:

   ```bash
   git commit -m 'Add a new feature or fix a bug'
   ```

7. **Push to Your Branch**  
   Push your changes to your forked repository:

   ```bash
   git push origin my-new-feature
   ```

8. **Create a Pull Request**  
   Go to your repository on GitHub and open a pull request to the main repository. Provide a detailed description of the changes you’ve made, including the purpose of the changes and any relevant context.

## Acknowledgments

Special thanks to the following individuals for their invaluable contributions to the **Google Drive Resource Sharing Management System (GDRSMS)**:

- **Muhammad Haziq Bin Rozaidi**
- **Muhammad Syahmi Syazwan Bin Shuhairam**
- **Kevin Fachrezy**
- **Ghathfan Muhamad Afifazfa**

Their hard work, dedication, and collaboration were essential to the success of this project.
