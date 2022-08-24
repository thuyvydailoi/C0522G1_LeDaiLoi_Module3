package controller;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"","/CustomerServlet"})
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer(1,"Đặng Thị Thuỷ Điện", "13-01-2000","Quảng Nôm","https://andy.codegym.vn/storage/images/avatars/38cba5c3296a2935a26f2dc896be48e2.jpeg "));
        customerList.add(new Customer(2,"Nguyễn Tất Thành", "13-01-2003","Quảng Nôm","https://andy.codegym.vn/storage/images/avatars/38cba5c3296a2935a26f2dc896be48e2.jpeg"));
        customerList.add(new Customer(3,"Nguyễn Thanh Công", "13-01-1991","Đà Nẵng","https://andy.codegym.vn/storage/images/avatars/38cba5c3296a2935a26f2dc896be48e2.jpeg"));
        customerList.add(new Customer(4,"Hoàng Minh Trí", "13-01-1998","Huế","https://andy.codegym.vn/storage/images/avatars/38cba5c3296a2935a26f2dc896be48e2.jpeg"));

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("display.jsp");
        request.setAttribute("customerList", customerList );
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
