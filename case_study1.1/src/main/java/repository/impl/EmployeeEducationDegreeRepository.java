package repository.impl;

import model.employee.EmployeeDivision;
import model.employee.EmployeeEducationDegree;
import repository.IEmployeeEducationDegreeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeEducationDegreeRepository implements IEmployeeEducationDegreeRepository {
    private static final String FIND_ALL = "select * from education_degree";

    @Override
    public List<EmployeeEducationDegree> findAll() {
        List<EmployeeEducationDegree> employeeEducationDegreeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int educationDegreeId = resultSet.getInt("education_degree_id");
                String educationDegreeName = resultSet.getString("education_degree_name");

                EmployeeEducationDegree employeeEducationDegree = new EmployeeEducationDegree(educationDegreeId, educationDegreeName);
                employeeEducationDegreeList.add(employeeEducationDegree);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeEducationDegreeList;
    }
}
