package com.example.tvpssmis.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "equipment_request")
public class EquipmentRequest implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "request_id")
    private int requestId;

    @ManyToOne
    @JoinColumn(name = "studio_id")
    private Studio studio;

    @Column(name = "equipment_name", nullable = false, length = 100)
    private String equipmentName;

    @Column(name = "equipment_type", length = 50)
    private String equipmentType;

    @Column(name = "quantity")
    private int quantity = 1; // Default value as per schema

    @Column(name = "price", precision = 10, scale = 2)
    private BigDecimal price;

    @Column(name = "link")
    private String link;

    @Column(name = "request_reason", columnDefinition = "TEXT")
    private String requestReason;

    @Column(name = "status", length = 20)
    private String status = "Pending"; // Default value as per schema

    @Column(name = "request_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date requestDate;

    @Column(name = "approval_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date approvalDate;

    @ManyToOne
    @JoinColumn(name = "approved_by")
    private User approvedBy;

    @Column(name = "remarks", columnDefinition = "TEXT")
    private String remarks;

    // Default constructor
    public EquipmentRequest() {}

    // All-args constructor
    public EquipmentRequest(int requestId, Studio studio, String equipmentName, String equipmentType,
                          int quantity, BigDecimal price, String link, String requestReason,
                          String status, Date requestDate, Date approvalDate, User approvedBy,
                          String remarks) {
        this.requestId = requestId;
        this.studio = studio;
        this.equipmentName = equipmentName;
        this.equipmentType = equipmentType;
        this.quantity = quantity;
        this.price = price;
        this.link = link;
        this.requestReason = requestReason;
        this.status = status;
        this.requestDate = requestDate;
        this.approvalDate = approvalDate;
        this.approvedBy = approvedBy;
        this.remarks = remarks;
    }

    // Getters and Setters
    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public Studio getStudio() {
        return studio;
    }

    public void setStudio(Studio studio) {
        this.studio = studio;
    }

    public String getEquipmentName() {
        return equipmentName;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName;
    }

    public String getEquipmentType() {
        return equipmentType;
    }

    public void setEquipmentType(String equipmentType) {
        this.equipmentType = equipmentType;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getRequestReason() {
        return requestReason;
    }

    public void setRequestReason(String requestReason) {
        this.requestReason = requestReason;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public Date getApprovalDate() {
        return approvalDate;
    }

    public void setApprovalDate(Date approvalDate) {
        this.approvalDate = approvalDate;
    }

    public User getApprovedBy() {
        return approvedBy;
    }

    public void setApprovedBy(User approvedBy) {
        this.approvedBy = approvedBy;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    // toString method
    @Override
    public String toString() {
        return "EquipmentRequest{" +
                "requestId=" + requestId +
                ", studio=" + studio +
                ", equipmentName='" + equipmentName + '\'' +
                ", equipmentType='" + equipmentType + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                ", link='" + link + '\'' +
                ", requestReason='" + requestReason + '\'' +
                ", status='" + status + '\'' +
                ", requestDate=" + requestDate +
                ", approvalDate=" + approvalDate +
                ", approvedBy=" + approvedBy +
                ", remarks='" + remarks + '\'' +
                '}';
    }
}
