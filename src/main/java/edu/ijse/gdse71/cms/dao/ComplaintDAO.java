package edu.ijse.gdse71.cms.dao;

import edu.ijse.gdse71.cms.db.DataSource;
import edu.ijse.gdse71.cms.model.Complaint;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComplaintDAO {

    public List<Complaint> getAllComplaints() {
        List<Complaint> complaints = new ArrayList<>();
        String sql = "SELECT c.*, u.username FROM complaints c JOIN users u ON c.submitted_by_user_id = u.user_id ORDER BY c.complaint_id DESC";

        try (Connection con = DataSource.getConnection();
             PreparedStatement pst = con.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                Complaint complaint = new Complaint();
                complaint.setId(rs.getInt("complaint_id"));
                complaint.setTitle(rs.getString("title"));
                complaint.setDescription(rs.getString("description"));
                complaint.setStatus(rs.getString("status"));
                complaint.setRemarks(rs.getString("remarks"));
                complaint.setUserId(rs.getInt("submitted_by_user_id"));
                complaint.setCrt(rs.getTimestamp("created_at"));
                complaint.setUpdate(rs.getTimestamp("updated_at"));
                complaint.setUsername(rs.getString("username"));
                complaints.add(complaint);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return complaints;
    }



    public List<Complaint> getComplaintsEmp(int userId) {
        List<Complaint> complaints = new ArrayList<>();
        String sql = "SELECT * FROM complaints WHERE submitted_by_user_id = ? ORDER BY complaint_id DESC";

        try (Connection con = DataSource.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, userId);

            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    Complaint complaint = new Complaint();
                    complaint.setId(rs.getInt("complaint_id"));
                    complaint.setTitle(rs.getString("title"));
                    complaint.setDescription(rs.getString("description"));
                    complaint.setStatus(rs.getString("status"));
                    complaint.setRemarks(rs.getString("remarks"));
                    complaint.setUserId(rs.getInt("submitted_by_user_id"));
                    complaint.setCrt(rs.getTimestamp("created_at"));
                    complaint.setUpdate(rs.getTimestamp("updated_at"));
                    complaints.add(complaint);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return complaints;
    }

    public Complaint getCompUp(int complaintId) {
        String sql = "SELECT * FROM complaints WHERE complaint_id = ?";
        Complaint complaint = null;

        try (Connection con = DataSource.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, complaintId);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    complaint = new Complaint();
                    complaint.setId(rs.getInt("complaint_id"));
                    complaint.setTitle(rs.getString("title"));
                    complaint.setDescription(rs.getString("description"));
                    complaint.setStatus(rs.getString("status"));
                    complaint.setRemarks(rs.getString("remarks"));
                    complaint.setUserId(rs.getInt("submitted_by_user_id"));
                    complaint.setCrt(rs.getTimestamp("created_at"));
                    complaint.setUpdate(rs.getTimestamp("updated_at"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return complaint;
    }
    public void updateComp(Complaint complaint) {
        String sql = "UPDATE complaints SET status = ?, remarks = ? WHERE complaint_id = ?";
        try (Connection con = DataSource.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, complaint.getStatus());
            pst.setString(2, complaint.getRemarks());
            pst.setInt(3, complaint.getId());


            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void deleteComp(int idDel) {

        String sql = "DELETE FROM complaints WHERE complaint_id = ?";
        try (Connection con = DataSource.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, idDel);
            pst.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addComplaint(Complaint comp) {

        String sql = "INSERT INTO complaints (title, description, submitted_by_user_id, status) VALUES (?, ?, ?, ?)";
        try (Connection con = DataSource.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, comp.getTitle());
            pst.setString(2, comp.getDescription());
            pst.setInt(3, comp.getUserId());
            pst.setString(4, "Submitted");

            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Complaint getComLoadU(int complaintId) {
        String sql = "SELECT * FROM complaints WHERE complaint_id = ?";
        Complaint complaint = null;

        try (Connection con = DataSource.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, complaintId);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    complaint = new Complaint();
                    complaint.setId(rs.getInt("complaint_id"));
                    complaint.setTitle(rs.getString("title"));
                    complaint.setDescription(rs.getString("description"));
                    complaint.setStatus(rs.getString("status"));
                    complaint.setRemarks(rs.getString("remarks"));
                    complaint.setUserId(rs.getInt("submitted_by_user_id"));
                    complaint.setCrt(rs.getTimestamp("created_at"));
                    complaint.setUpdate(rs.getTimestamp("updated_at"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return complaint;
    }

    public void updateCompEmp(Complaint compUpdateEmp) {
        String sql = "UPDATE complaints SET title = ?, description = ? WHERE complaint_id = ?";
        try (Connection con = DataSource.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, compUpdateEmp.getTitle());
            pst.setString(2, compUpdateEmp.getDescription());
            pst.setInt(3, compUpdateEmp.getId());

            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
