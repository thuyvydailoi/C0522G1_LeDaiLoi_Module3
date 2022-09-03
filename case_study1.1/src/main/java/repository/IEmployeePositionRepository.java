package repository;

import model.employee.EmployeePosition;

import java.util.List;

public interface IEmployeePositionRepository {
    List<EmployeePosition> findAll();

}
