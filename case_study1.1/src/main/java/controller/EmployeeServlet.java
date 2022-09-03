package controller;

import service.*;
import service.impl.EmployeeDivisionService;
import service.impl.EmployeeEducationDegreeService;
import service.impl.EmployeePositionService;
import service.impl.EmployeeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService iEmployeeService = new EmployeeService();
    private IEmployeeEducationDegreeService iEmployeeEducationDegreeService = new EmployeeEducationDegreeService();
    private IEmployeePositionService iEmployeePositionService = new EmployeePositionService();
    private IEmployeeDivisionService iEmployeeDivisionService = new EmployeeDivisionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showCreateFrom(request, response);
                break;
            case "edit":
//                showEditForm(request, response);
                break;
            case "delete":
//                deleteCustomer(request, response);
                break;
            case "find":
//                findCustomer(request, response);
            default:
                findAll(request, response);
        }
    }

    private void findAll(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showCreateFrom(HttpServletRequest request, HttpServletResponse response) {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
//                createCustomer(request, response);
                break;
            case "edit":
//                updateCustomer(request, response);
                break;
            default:
                break;
        }
    }
}
