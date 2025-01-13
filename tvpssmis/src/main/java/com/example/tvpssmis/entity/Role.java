package com.example.tvpssmis.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "role")
public class Role implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "role_id")
    private int roleId;

    @Column(name = "role_name", nullable = false, length = 50)
    private String roleName;

    @Column(name = "description")
    private String description;

    @Column(name = "access_level")
    private int accessLevel;

    @Column(name = "status", length = 20)
    private String status;

    // Default constructor
    public Role() {}

    // All-args constructor
    public Role(int roleId, String roleName, String description, int accessLevel, String status) {
        this.roleId = roleId;
        this.roleName = roleName;
        this.description = description;
        this.accessLevel = accessLevel;
        this.status = status;
    }

    // Getters and Setters
    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAccessLevel() {
        return accessLevel;
    }

    public void setAccessLevel(int accessLevel) {
        this.accessLevel = accessLevel;
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
        return "Role{" +
                "roleId=" + roleId +
                ", roleName='" + roleName + '\'' +
                ", description='" + description + '\'' +
                ", accessLevel=" + accessLevel +
                ", status='" + status + '\'' +
                '}';
    }
}
