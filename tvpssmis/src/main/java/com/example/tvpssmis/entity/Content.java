package com.example.tvpssmis.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "Content")
public class Content implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "content_id")
    private int content_id;

    @ManyToOne
    @JoinColumn(name = "program_id")
    private Program program;

    @Column(name = "title")
    private String title;

    @Column(name = "description")
    private String description;

    @Column(name = "video_url")
    private String contentName;

    @Column(name = "upload_date")
    @Temporal(TemporalType.DATE)
    private Date upload_date;

    @Column(name = "category")
    private String category;

    // Default constructor
    public Content() {
    }

    // All-args constructor
    public Content(int content_id, Program program, String contentName, String title, 
                 String description, Date upload_date, String category) {
        this.content_id = content_id;
        this.program = program;
        this.contentName = contentName;
        this.title = title;
        this.description = description;
        this.upload_date = upload_date;
        this.category = category;
    }

    // Getters and Setters
    public int getContent_id() {
        return content_id;
    }

    public void setContent_id(int content_id) {
        this.content_id = content_id;
    }

    public Program getProgram() {
        return program;
    }

    public void setProgram(Program program) {
        this.program = program;
    }

    public String getContentName() {
        return contentName;
    }

    public void setContentName(String contentName) {
        this.contentName = contentName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
        return upload_date;
    }

    public void setDate(Date upload_date) {
        this.upload_date = upload_date;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    // toString method
    @Override
    public String toString() {
        return "Content{" +
                "contentId=" + content_id +
                ", program=" + program +
                ", content_name ='" + contentName + '\'' +
                ", video_title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", upload_date=" + upload_date +
                ", category='" + category + '\'' +
                '}';
    }
}
