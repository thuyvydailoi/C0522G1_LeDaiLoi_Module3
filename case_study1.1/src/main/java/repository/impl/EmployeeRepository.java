package repository.impl;

import model.employee.Employee;
import model.employee.EmployeeEducationDegree;
import repository.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private static final String FIND_ALL = "select * from employee";

    @Override
    public List<Employee> findAll() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int employeeId = resultSet.getInt("employee_id");
                String employeeName = resultSet.getString("employee_name");
                String employeeBirthday = resultSet.getString("employee_birthday");
                String employeeIdCart = resultSet.getString("employee_id_card");
                Double employeeSalary = Double.valueOf(resultSet.getString("employee_salary"));
                String employeePhone = resultSet.getString("employee_phone");
                String employeeEmail = resultSet.getString("employee_email");
                String employeeAddress = resultSet.getString("employee_address");
                int positionId = Integer.parseInt(resultSet.getString("position_id"));
                int educationId = Integer.parseInt(resultSet.getString("education_degree_id"));
                int divisionId = Integer.parseInt(resultSet.getString("division_id"));

                Employee employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCart, employeeSalary, employeePhone, employeeEmail, employeeAddress, positionId, educationId, divisionId);
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public boolean create(Employee employee) {
        return false;
    }

    @Override
    public boolean edit(Employee employee) {
        return false;
    }

    @Override
    public Employee findById(int idFind) {
        return null;
    }

    @Override
    public boolean delete(int idDel) {
        return false;
    }

    @Override
    public List<Employee> find(String name, String address, String phone) {
        return null;
    }
}
