package com.example.tvpssmis.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name= "student_app")
public class StudentApplication implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "application_id")
	private int applicationID;
	
	@ManyToOne
	@JoinColumn(name = "user_id", nullable = false)
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "program_id", nullable = false)
	private Program programID;
	
	@Column(name = "apply_date")
	@Temporal(TemporalType.DATE)
	private Date applyDate;
	
	@Column(name = "status", columnDefinition = "VARCHAR(20) DEFAULT 'Pending'")
	private String status = "Pending";
	
	@Column(name = "interest")
	private String interest;

	@Column(name = "skills")
	private String skills;
	
	// Default constructor
    public StudentApplication() {}

	public StudentApplication(int applicationID, User user, Program programID, Date applyDate, String status,
			String interest, String skills) {
		super();
		this.applicationID = applicationID;
		this.user = user;
		this.programID = programID;
		this.applyDate = applyDate;
		this.status = status;
		this.interest = interest;
		this.skills = skills;
	}

	public int getApplicationID() {
		return applicationID;
	}



	public void setApplicationID(int applicationID) {
		this.applicationID = applicationID;
	}



	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}



	public Program getProgramID() {
		return programID;
	}



	public void setProgramID(Program programID) {
		this.programID = programID;
	}



	public Date getApplyDate() {
		return applyDate;
	}



	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getInterest() {
		return interest;
	}



	public void setInterest(String interest) {
		this.interest = interest;
	}



	public String getSkills() {
		return skills;
	}



	public void setSkills(String skills) {
		this.skills = skills;
	}

	@Override
	public String toString() {
		return "StudentApplication "+ "["
				+ "applicationID=" + applicationID + ", "
				+ "user=" + user + ", "
				+ "programID=" + programID + ", "
				+ "applyDate=" + applyDate + ", "
				+ "status=" + status + ", "
				+ "interest=" + interest + ", "
				+ "skills=" + skills + "]";
	}
	
	
	
	
}
