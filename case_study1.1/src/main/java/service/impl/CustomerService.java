package service.impl;

import model.customer.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository iCustomerRepository = new CustomerRepository();

    @Override
    public List<Customer> findAll() {
        return iCustomerRepository.findAll();
    }

    @Override
    public boolean create(Customer customer) {
        return iCustomerRepository.create(customer);
    }

    @Override
    public boolean edit(Customer customer) {
        return iCustomerRepository.edit(customer);
    }

    @Override
    public Customer findById(int idFind) {
        return iCustomerRepository.findById(idFind);
    }

    @Override
    public boolean delete(int idDel) {
        return iCustomerRepository.delete(idDel);
    }

    @Override
    public List<Customer> find(String name, String address, String phone) {
        return iCustomerRepository.find(name, address, phone);
    }

}
