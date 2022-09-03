package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import service.ICustomerService;
import service.ICustomerTypeService;
import service.impl.CustomerService;
import service.impl.CustomerTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService iCustomerService = new CustomerService();
    private ICustomerTypeService iCustomerTypeService = new CustomerTypeService();

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
                showEditForm(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            case "find":
                findCustomer(request, response);
            default:
                findAll(request, response);
        }
    }

    private void findCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/list.jsp");

        String name = request.getParameter("nameSearch");
        String address = request.getParameter("addressSearch");
        String phone = request.getParameter("phoneSearch");

        List<Customer> customerList = iCustomerService.find(name, address, phone);
        List<CustomerType> customerTypeList = iCustomerTypeService.findAll();

        for (Customer customer : customerList) {
            String[] arr = customer.getCustomerBirthday().split("-");
            customer.setCustomerBirthday(arr[2] + "/" + arr[1] + "/" + arr[0]);
        }

        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iCustomerService.delete(id);
        findAll(request, response);
    }

    private void showCreateFrom(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = iCustomerTypeService.findAll();
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/create.jsp");
        request.setAttribute("customerTypeList", customerTypeList);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        List<CustomerType> customerTypeList = iCustomerTypeService.findAll();
        Customer customer = iCustomerService.findById(id);
        RequestDispatcher dispatcher;

        if (customer == null) {
            dispatcher = request.getRequestDispatcher("view/error_404.jsp");
        } else {
            request.setAttribute("customer", customer);
            dispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
            request.setAttribute("customerTypeList", customerTypeList);
        }

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void findAll(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/list.jsp");

        List<Customer> customerList = iCustomerService.findAll();
        List<CustomerType> customerTypeList = iCustomerTypeService.findAll();

        for (Customer customer : customerList) {
            String[] arr = customer.getCustomerBirthday().split("-");
            customer.setCustomerBirthday(arr[2] + "/" + arr[1] + "/" + arr[0]);
        }

        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
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
                createCustomer(request, response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            default:
                break;
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dayOfBirth = request.getParameter("dateOfBirth");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerType = Integer.parseInt(request.getParameter("customerType"));

        Customer customer = new Customer(id, name, dayOfBirth, gender, idCard, phone, email, address, customerType);

        boolean check = iCustomerService.edit(customer);
        String mess = "Update Customer successfully.";
        if (!check) {
            mess = "Update Customer failed.";
        }

        request.setAttribute("mess", mess);
        request.setAttribute("check", check);

        showCreateFrom(request, response);
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String dayOfBirth = request.getParameter("dateOfBirth");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerType = Integer.parseInt(request.getParameter("customerType"));

        Customer customer = new Customer(name, dayOfBirth, gender, idCard, phone, email, address, customerType);

        boolean check = iCustomerService.create(customer);
        String mess = "Add new Customer successfully.";
        if (!check) {
            mess = "Add new Customer failed.";
        }

        request.setAttribute("mess", mess);
        request.setAttribute("check", check);

        showCreateFrom(request, response);
    }
}
