package com.example.tvpssmis.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "program")
public class Program implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "program_id")
    private int programId;

    @ManyToOne
    @JoinColumn(name = "school_id")
    private School school;

    @Column(name = "youTube_channel_link")
    private String youTubeChannelLink;

    @Column(name = "establishment_date")
    @Temporal(TemporalType.DATE)
    private Date establishmentDate;

    @Column(name = "status", columnDefinition = "VARCHAR(20) DEFAULT 'Active'")
    private String status = "Active";
    
    @OneToMany(mappedBy = "program", cascade = CascadeType.PERSIST)
    private List<Studio> studios;


    // Default constructor
    public Program() {
    }

    // All-args constructor
    public Program(int programId, School school, String youTubeChannelLink, Date establishmentDate, String status) {
        this.programId = programId;
        this.school = school;
        this.youTubeChannelLink = youTubeChannelLink;
        this.establishmentDate = establishmentDate;
        this.status = status;
    }

    // Getters and Setters
    public int getProgramId() {
        return programId;
    }

    public void setProgramId(int programId) {
        this.programId = programId;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public String getYouTubeChannelLink() {
        return youTubeChannelLink;
    }

    public void setYouTubeChannelLink(String youTubeChannelLink) {
        this.youTubeChannelLink = youTubeChannelLink;
    }

    public Date getEstablishmentDate() {
        return establishmentDate;
    }

    public void setEstablishmentDate(Date establishmentDate) {
        this.establishmentDate = establishmentDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // toString method
    @Override
    public String toString() {
        return "Program{" +
                "programId=" + programId +
                ", school=" + school +
                ", youTubeChannelLink='" + youTubeChannelLink + '\'' +
                ", establishmentDate=" + establishmentDate +
                ", status='" + status + '\'' +
                '}';
    }
}
