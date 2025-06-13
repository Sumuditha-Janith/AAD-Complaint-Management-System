package edu.ijse.gdse71.cms.model;

import java.sql.Timestamp;

public class Complaint {

    private int id;
    private String title;
    private String description;
    private String status;
    private String remarks;
    private int userId;
    private Timestamp crt;
    private Timestamp update;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Timestamp getCrt() {
        return crt;
    }

    public void setCrt(Timestamp crt) {
        this.crt = crt;
    }

    public Timestamp getUpdate() {
        return update;
    }

    public void setUpdate(Timestamp update) {
        this.update = update;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    private String username;

    public Complaint() {
    }



    @Override
    public String toString() {
        return "Complaint{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", status='" + status + '\'' +
                ", remarks='" + remarks + '\'' +
                ", userId=" + userId +
                ", createdAt=" + crt +
                ", updatedAt=" + update +
                ", username='" + username + '\'' +
                '}';
    }
}
