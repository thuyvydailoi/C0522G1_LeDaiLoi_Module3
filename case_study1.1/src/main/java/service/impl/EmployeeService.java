package service.impl;

import model.employee.Employee;
import repository.ICustomerRepository;
import repository.IEmployeeRepository;
import repository.impl.CustomerRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    private IEmployeeRepository iEmployeeRepository = new EmployeeRepository();

    @Override
    public List<Employee> findAll() {
        return iEmployeeRepository.findAll();
    }

    @Override
    public boolean create(Employee employee) {
        return iEmployeeRepository.create(employee);
    }

    @Override
    public boolean edit(Employee employee) {
        return iEmployeeRepository.create(employee);
    }

    @Override
    public Employee findById(int idFind) {
        return iEmployeeRepository.findById(idFind);
    }

    @Override
    public boolean delete(int idDel) {
        return iEmployeeRepository.delete(idDel);
    }

    @Override
    public List<Employee> find(String name, String address, String phone) {
        return iEmployeeRepository.find(name, address, phone);
    }
}
