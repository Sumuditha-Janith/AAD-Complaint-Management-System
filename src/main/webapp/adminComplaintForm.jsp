<%--
  Created by IntelliJ IDEA.
  User: Sumuditha
  Date: 6/14/2025
  Time: 7:07 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ page import="edu.ijse.gdse71.cms.model.Complaint" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= (request.getAttribute("complaint") == null) ? "Add Complaint" : "Edit Complaint" %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
<div class="container mt-4 adminComplaintForm">
    <div class="card mx-auto shadow-sm" style="max-width: 700px;">
        <div class="card-header">
            <h3>
                <%= (request.getAttribute("complaint") == null)
                        ? "Submit New Complaint"
                        : "Edit Complaint #" + ((Complaint)request.getAttribute("complaint")).getId() %>
            </h3>
        </div>
        <div class="card-body">
            <form action="complaints" method="post">

                <%
                    Complaint comp = (Complaint) request.getAttribute("complaint");
                    if (comp != null) {
                %>
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= comp.getId() %>" />
                <%
                } else {
                %>
                <input type="hidden" name="action" value="create">
                <%
                    }
                %>

                <div class="mb-3">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="title" name="title"
                           value="<%= (comp != null) ? comp.getTitle() : "" %>" disabled>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <textarea class="form-control" id="description" name="description" rows="5" disabled><%= (comp != null) ? comp.getDescription() : "" %></textarea>
                </div>

                <hr>
                <h5 id="admsectext">Admin Section</h5>

                <div class="mb-3">
                    <label for="status" class="form-label">Status</label>
                    <select class="form-select" id="status" name="status">
                        <option value="Submitted" <%= (comp != null && "Submitted".equals(comp.getStatus())) ? "selected" : "" %>>Submitted</option>
                        <option value="In Progress" <%= (comp != null && "In Progress".equals(comp.getStatus())) ? "selected" : "" %>>In Progress</option>
                        <option value="Resolved" <%= (comp != null && "Resolved".equals(comp.getStatus())) ? "selected" : "" %>>Resolved</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="remarks" class="form-label">Remarks</label>
                    <textarea class="form-control" id="remarks" name="remarks" rows="3"><%= (comp != null) ? comp.getRemarks() : "" %></textarea>
                </div>

                <div class="d-flex justify-content-end">
                    <a href="dashboard" class="btn btn-secondary me-2">Cancel</a>
                    <button type="submit" class="btn btn-primary">Save Complaint</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
