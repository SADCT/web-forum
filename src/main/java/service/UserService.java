package service;

import model.AdminUser;
import model.RecentUser;
import model.User;
import model.UserDetailed;

import java.sql.Date;
import java.util.List;

public interface UserService {
    //检验登陆
    boolean checkLogin(String username, String password);
    //用户数目
    int returnSumUser();
    //通过用户名获取用户类
    User findUserByName(String username);
    //用户锁定
    void lockUser(String username);
    //判断用户是否锁定
    boolean isLocked(String username);
    //增加积分
    void addCredit(String username, int creditNum);
    //设置用户登陆信息
    void setLoginLogAndDate(String username, Date date, String addr);
    //注册
    void register(String username, String password);
    //通过ID获取用户
    User selectByUserId(int id);
    //更新用户信息
    void updateUserInfo(UserDetailed userDetailed);
    //更新用户照片
    void updateAddressOfPic(int userId, String address);
    //通过用户ID获取用户个人信息
    UserDetailed findById(int userId);
    //获取最近用户
    List<RecentUser> RecentUserData();
    //获取管理员
    List<AdminUser> getManager();
    //获取用户
    void askforManager(int userId, String applicationReason);
}
