package service;

import model.customer.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();

    boolean create(Customer customer);

    boolean edit(Customer customer);

    Customer findById(int idFind);

    boolean delete(int idDel);

    List<Customer> find(String name, String address, String phone);

}
