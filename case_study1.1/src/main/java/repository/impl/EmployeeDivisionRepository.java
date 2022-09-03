package repository.impl;

import model.customer.CustomerType;
import model.employee.EmployeeDivision;
import repository.IEmployeeDivisionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDivisionRepository implements IEmployeeDivisionRepository {
    private static final String FIND_ALL = "select * from division";

    @Override
    public List<EmployeeDivision> findAll() {
        List<EmployeeDivision> employeeDivisionList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int divisionId = resultSet.getInt("division_id");
                String divisionName = resultSet.getString("division_name");

                EmployeeDivision employeeDivision = new EmployeeDivision(divisionId, divisionName);
                employeeDivisionList.add(employeeDivision);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeDivisionList;
    }
}
