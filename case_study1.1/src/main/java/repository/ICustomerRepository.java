package repository;

import model.customer.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();

    boolean create(Customer customer);

    boolean edit(Customer customer);

    Customer findById(int idFind);

    boolean delete(int idDel);

    List<Customer> find(String name, String address, String phone);
}
