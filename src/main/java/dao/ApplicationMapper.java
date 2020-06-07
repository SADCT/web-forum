package dao;

import model.Application;

import java.util.List;

public interface ApplicationMapper {
    List<Application> selectAllApplication(int isPass);

    int insert(Application record);

    int updateByPrimaryKey(Application record);
}
