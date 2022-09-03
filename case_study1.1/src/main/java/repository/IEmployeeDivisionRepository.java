package repository;

import model.employee.EmployeeDivision;

import java.util.List;

public interface IEmployeeDivisionRepository {
    List<EmployeeDivision> findAll();
}
