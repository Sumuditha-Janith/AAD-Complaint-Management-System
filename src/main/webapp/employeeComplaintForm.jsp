<%--
  Created by IntelliJ IDEA.
  User: Sumuditha
  Date: 6/14/2025
  Time: 7:07 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="edu.ijse.gdse71.cms.model.Complaint" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%
        Complaint complaint = (Complaint) request.getAttribute("complaint");
        System.out.println(complaint == null ? "Add Complaint" : "Edit Complaint");
    %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>

<div class="container mt-4">
    <div class="card mx-auto shadow-sm" style="max-width: 700px;">

        <div class="card-header">
            <h3>

                <%
                    if (complaint == null) {
                        System.out.println("Submit New Complaint");
                    } else {
                        System.out.println("Edit Complaint #" + complaint.getId());
                    }
                %>

            </h3>
        </div>
        <div class="card-body">
            <form action="complaints" method="post">

                <input type="hidden" name="action" value="<%= complaint == null ? "create" : "eupdate" %>">

                <%
                    if (complaint != null) {
                %>
                <input type="hidden" name="id" value="<%= complaint.getId() %>">
                <%
                    }
                %>

                <div class="mb-3">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="title" name="title"
                           value="<%= complaint != null ? complaint.getTitle() : "" %>"
                        <%= complaint != null ? "required" : "" %> required>
                </div>

                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="5"
                        <%= complaint != null ? "required" : "" %> required><%= complaint != null ? complaint.getDescription() : "" %></textarea>

                <br>
                <div class="d-flex justify-content-end">
                    <a href="dashboard" class="btn btn-secondary me-2">Cancel</a>
                    <button type="submit" class="btn btn-primary"><%= complaint == null ? "Submit" : "Save" %></button>
                </div>

            </form>
        </div>
    </div>
</div>
</body>
</html>
