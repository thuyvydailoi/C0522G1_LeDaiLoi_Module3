package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Float.parseFloat(request.getParameter("firstOperand"));
        float secondOperand = Float.parseFloat(request.getParameter("secondOperand"));
        char operator = request.getParameter("operator").charAt(0);
        String result;
        switch (operator) {
            case '+':
                result = String.valueOf(firstOperand + secondOperand);
                break;
            case '-':
                result = String.valueOf(firstOperand - secondOperand);
                break;
            case '*':
                result = String.valueOf(firstOperand * secondOperand);
                break;
            default:
                if (secondOperand == 0) {
                    result = "Can't divide by zero";
                } else {
                    result = String.valueOf(firstOperand / secondOperand);
                }
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("display.jsp");
        request.setAttribute("result", result);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
