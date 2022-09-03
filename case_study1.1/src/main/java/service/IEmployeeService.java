package service;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAll();

    boolean create(Employee employee);

    boolean edit(Employee employee);

    Employee findById(int idFind);

    boolean delete(int idDel);

    List<Employee> find(String name, String address, String phone);
}
