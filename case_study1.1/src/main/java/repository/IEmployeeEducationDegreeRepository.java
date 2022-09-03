package repository;

import model.employee.EmployeeEducationDegree;

import java.util.List;

public interface IEmployeeEducationDegreeRepository {
    List<EmployeeEducationDegree> findAll();
}
