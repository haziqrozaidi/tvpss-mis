package com.example.tvpssmis.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table(name = "studio")
public class Studio implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "studio_id")
    private int studioId;

    @ManyToOne
    @JoinColumn(name = "program_id")
    private Program program;

    @Column(name = "studio_name", nullable = false, length = 100)
    private String studioName;

    @Column(name = "studio_level", length = 20)
    private String studioLevel;

    @Column(name = "location")
    private String location;

    @Column(name = "size", precision = 10, scale = 2)
    private BigDecimal size;

    @Column(name = "status", length = 20)
    private String status = "Operational";  // Default value as per schema

    // Default constructor
    public Studio() {
    }

    // All-args constructor
    public Studio(int studioId, Program program, String studioName, String studioLevel, 
                 String location, BigDecimal size, String status) {
        this.studioId = studioId;
        this.program = program;
        this.studioName = studioName;
        this.studioLevel = studioLevel;
        this.location = location;
        this.size = size;
        this.status = status;
    }

    // Getters and Setters
    public int getStudioId() {
        return studioId;
    }

    public void setStudioId(int studioId) {
        this.studioId = studioId;
    }

    public Program getProgram() {
        return program;
    }

    public void setProgram(Program program) {
        this.program = program;
    }

    public String getStudioName() {
        return studioName;
    }

    public void setStudioName(String studioName) {
        this.studioName = studioName;
    }

    public String getStudioLevel() {
        return studioLevel;
    }

    public void setStudioLevel(String studioLevel) {
        this.studioLevel = studioLevel;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public BigDecimal getSize() {
        return size;
    }

    public void setSize(BigDecimal size) {
        this.size = size;
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
        return "Studio{" +
                "studioId=" + studioId +
                ", program=" + program +
                ", studioName='" + studioName + '\'' +
                ", studioLevel='" + studioLevel + '\'' +
                ", location='" + location + '\'' +
                ", size=" + size +
                ", status='" + status + '\'' +
                '}';
    }

	@OneToMany(mappedBy = "studio", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Crew> crews;
	@OneToMany(mappedBy = "studio", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Equipment> equipmentList;

	public List<Crew> getCrews() {
		return crews;
	}

	public void setCrews(List<Crew> crews) {
		this.crews = crews;
	}

	public List<Equipment> getEquipmentList() {
		return equipmentList;
	}

	public void setEquipmentList(List<Equipment> equipmentList) {
		this.equipmentList = equipmentList;
	}

}
