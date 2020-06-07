package service.impl;

import dao.ApplicationMapper;
import dao.LoginLogMapper;
import dao.UserDetailedMapper;
import dao.UserMapper;
import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserService;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@Service
public class UserServiceI implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private LoginLogMapper loginLogMapper;
    @Autowired
    private UserDetailedMapper userDetailedMapper;
    @Autowired
    private ApplicationMapper appMapper;
    @Override
    public User findUserByName(String username) {
        return userMapper.selectByUsername(username);
    }
    @Override
    public boolean checkLogin(String username, String password) {
        User user = findUserByName(username);
        if (user != null) {
            return password.equals(user.getPassword());
        }
        return false;
    }
    @Override
    public int returnSumUser() {
        return userMapper.findUserTotalNum();
    }
    @Override
    public void lockUser(String username) {
        int id = findUserByName(username).getUserId();
        User user = new User();
        user.setUserId(id);
        user.setLocked(User.USER_LOCK);
        userMapper.updateByPrimaryKeySelective(user);
    }
    @Override
    public boolean isLocked(String username) {
        if (findUserByName(username).getLocked() == User.USER_LOCK) {
            return true;
        }
        return false;
    }
    @Override
    public void addCredit(String username, int creditNum) {
        User user = findUserByName(username);
        User user1 = new User();
        user1.setUserId(user.getUserId());
        user1.setCredit(user.getCredit() + creditNum);
        userMapper.updateByPrimaryKeySelective(user1);
    }
    @Override
    public void setLoginLogAndDate(String username,Date date,String addr) {
        User user = findUserByName(username);
        user.setLastVisit(date);
        user.setLastIp(addr);
        userMapper.updateByPrimaryKey(user);
        //注册登录日志
        int id = userMapper.selectByUsername(username).getUserId();
        LoginLog loginLog = new LoginLog();
        loginLog.setUserId(id);
        loginLog.setIp(addr);
        loginLog.setLoginDatetime(date);
        loginLogMapper.insertSelective(loginLog);
    }
    @Override
    public User selectByUserId(int id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateUserInfo(UserDetailed userDetailed) {
        userDetailedMapper.updateByPrimaryKeySelective(userDetailed);
    }
    @Override
    public void register(String username, String password) {
        Byte b = 1;
        User user = new User();
        user.setCredit(50);
        user.setLocked(User.USER_UNLOCK);
        user.setUserType(b);
        user.setUserName(username);
        user.setPassword(password);
        userMapper.insertSelective(user);
        UserDetailed userDetailed =new UserDetailed();
        userDetailed.setUserId( userMapper.selectByUsername(username).getUserId());
        userDetailed.setImagePath("/userPic/pic.jpg");
        userDetailed.setSignTime(new Timestamp(System.currentTimeMillis()));
        userDetailedMapper.insertSelective(userDetailed);
    }

    @Override
    public void updateAddressOfPic(int userId,String address) {
        UserDetailed userDetailed = new UserDetailed();
        userDetailed.setUserId(userId);
        userDetailed.setImagePath(address);
        userDetailedMapper.updateByPrimaryKeySelective(userDetailed);
    }

    @Override
    public UserDetailed findById(int userId) {
        return userDetailedMapper.selectByPrimaryKey(userId);
    }

    @Override
    public List<RecentUser> RecentUserData() {
        return userDetailedMapper.RecentUserData();
    }

    @Override
    public List<AdminUser> getManager() { return userDetailedMapper.getAllManager();}

    @Override
    public void askforManager(int userId, String applicationReason) {
        Application app = new Application();
        app.setUserId(userId);
        app.setIsPass(0);
        app.setApplicationReason(applicationReason);
        appMapper.insert(app);
    }
}
