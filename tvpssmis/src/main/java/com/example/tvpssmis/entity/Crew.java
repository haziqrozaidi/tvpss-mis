package com.example.tvpssmis.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "crew")
public class Crew implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "crew_id")
    private int crewId;

    @ManyToOne
    @JoinColumn(name = "studio_id", nullable = false)
    private Studio studio;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "role", nullable = false, length = 50)
    private String role;

    @Column(name = "join_date", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date joinDate;

    @Column(name = "status", nullable = false, length = 20)
    private String status;

    // Default Constructor
    public Crew() {
    }

    // Getters and Setters
    public int getCrewId() {
        return crewId;
    }

    public void setCrewId(int crewId) {
        this.crewId = crewId;
    }

    public Studio getStudio() {
        return studio;
    }

    public void setStudio(Studio studio) {
        this.studio = studio;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // toString Method
    @Override
    public String toString() {
        return "Crew{" +
                "crewId=" + crewId +
                ", studio=" + studio +
                ", user=" + user +
                ", role='" + role + '\'' +
                ", joinDate=" + joinDate +
                ", status='" + status + '\'' +
                '}';
    }
}
