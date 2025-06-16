<%--
  Created by IntelliJ IDEA.
  User: Sumuditha
  Date: 6/14/2025
  Time: 7:13 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.ijse.gdse71.cms.model.Complaint" %>
<%@ page import="edu.ijse.gdse71.cms.model.User" %>
<html>
<head>
  <title>Dashboard</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
  <link rel="stylesheet" href="assets/style.css">
  <style>
    .remarks-cell {
      max-width: 200px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#">CMS</a>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link active" href="#">My Complaints</a></li>
      </ul>

      <span class="navbar-text text-white me-3">
        Welcome, <%= ((User) request.getAttribute("logUser")).getUsername() %>!
      </span>

      <a href="logout" class="btn btn-outline-light">Logout</a>
    </div>
  </div>
</nav>

<div class="container mt-4">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h3>My Submitted Complaints</h3>
    <a href="complaints?action=add" class="btn btn-primary"><i class="bi bi-plus-circle"></i> Add New Complaint</a>
  </div>

  <div class="card shadow-sm">
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-hover">
          <thead>
          <tr>
            <th style="width: 10%">ID</th>
            <th style="width: 25%">Title</th>
            <th style="width: 15%">Status</th>
            <th style="width: 30%">Remarks</th>
            <th style="width: 20%">Actions</th>
          </tr>
          </thead>

          <tbody>
          <%
            List<Complaint> complaintsList = (List<Complaint>) request.getAttribute("complaintsList");

            if (complaintsList != null && !complaintsList.isEmpty()) {
              for (Complaint complaint : complaintsList) {
          %>
          <tr>
            <td>#<%= complaint.getId() %></td>
            <td><%= complaint.getTitle() %></td>
            <td>
              <% if ("Resolved".equals(complaint.getStatus())) { %>
              <span class="badge bg-success">Resolved</span>
              <% } else if ("In Progress".equals(complaint.getStatus())) { %>
              <span class="badge bg-warning text-dark">In Progress</span>
              <% } else { %>
              <span class="badge bg-info text-dark">Submitted</span>
              <% } %>
            </td>
            <td class="remarks-cell" title="<%= complaint.getRemarks() != null ? complaint.getRemarks() : "No remarks" %>">
              <%= complaint.getRemarks() != null ? complaint.getRemarks() : "No remarks" %>
            </td>
            <td>
              <% if ("Resolved".equals(complaint.getStatus())) { %>
              <a href="#" class="btn btn-sm btn-outline-secondary disabled" aria-disabled="true">Edit</a>
              <a href="#" class="btn btn-sm btn-outline-danger disabled" aria-disabled="true">Delete</a>
              <% } else { %>
              <a href="complaints?action=uedit&id=<%= complaint.getId() %>" class="btn btn-sm btn-outline-secondary">Edit</a>
              <a href="complaints?action=delete&id=<%= complaint.getId() %>" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure you want to delete this complaint?')">Delete</a>
              <% } %>
            </td>
          </tr>
          <%
            }
          } else {
          %>
          <tr>
            <td colspan="5" class="text-center text-muted">You have not submitted any complaints yet.</td>
          </tr>
          <%
            }
          %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
