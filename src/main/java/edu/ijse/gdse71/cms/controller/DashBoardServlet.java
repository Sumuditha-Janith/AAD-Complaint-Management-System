package edu.ijse.gdse71.cms.controller;

import edu.ijse.gdse71.cms.dao.ComplaintDAO;
import edu.ijse.gdse71.cms.model.Complaint;
import edu.ijse.gdse71.cms.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class DashBoardServlet  extends HttpServlet {

    private ComplaintDAO complaintDAO;

    public void init() {
        complaintDAO = new ComplaintDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("signIn.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if ("Admin".equals(user.getRole())) {
            List<Complaint> complaints = complaintDAO.getAllComplaints();

            request.setAttribute("logUser", user);

            request.setAttribute("complaintsList", complaints);
            System.out.println("name " + user.getUsername());
            System.out.println("Com list: " + complaints);
            request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);

        } else {
            List<Complaint> complaints = complaintDAO.getComplaintsEmp(user.getId());
            request.setAttribute("logUser", user);
            request.setAttribute("complaintsList", complaints);
            request.getRequestDispatcher("employeeDashboard.jsp").forward(request, response);
        }
    }
}
