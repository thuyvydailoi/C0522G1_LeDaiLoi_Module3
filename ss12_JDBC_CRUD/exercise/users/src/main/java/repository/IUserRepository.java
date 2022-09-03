package repository;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> List ();
    User findByCountry(String country);
    void sort(String name);
}
