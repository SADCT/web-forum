package dao;

import model.AdminUser;
import model.RecentUser;
import model.UserDetailed;

import java.util.List;

public interface UserDetailedMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(UserDetailed record);

    int insertSelective(UserDetailed record);

    UserDetailed selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(UserDetailed record);

    int updateByPrimaryKey(UserDetailed record);

    List<RecentUser> RecentUserData();

    List<AdminUser> getAllManager();
}