package repository.impl;

import model.employee.EmployeePosition;
import repository.IEmployeePositionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeePositionRepository implements IEmployeePositionRepository {
    private static final String FIND_ALL = "select * from position";

    @Override
    public List<EmployeePosition> findAll() {
        List<EmployeePosition> employeePositionList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int positionId = resultSet.getInt("position_id");
                String positionName = resultSet.getString("position_name");

                EmployeePosition employeePosition = new EmployeePosition(positionId, positionName);
                employeePositionList.add(employeePosition);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeePositionList;
    }
}
