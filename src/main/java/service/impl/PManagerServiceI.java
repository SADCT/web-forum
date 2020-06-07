package service.impl;

import dao.ApplicationMapper;
import dao.UserMapper;
import model.Application;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.PManagerService;

import java.util.List;

@Service
public class  PManagerServiceI implements PManagerService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private ApplicationMapper appMapper;

    @Override
    public void changetoManager(Integer userId) {
        User user = new User();
        user = userMapper.selectByPrimaryKey(userId);
        user.setUserType((byte) 2);
        userMapper.updateByPrimaryKey(user);
        Application app = new Application();
        app.setUserId(userId);
        app.setIsPass(1);
        appMapper.updateByPrimaryKey(app);
    }

    @Override
    public List<Application> getPassedApplication() { return appMapper.selectAllApplication(1);}

    @Override
    public List<Application> getNotPassedApplication() { return appMapper.selectAllApplication(0);}

    @Override
    public List<Application> getAllApplication() {
        List<Application> app1 = appMapper.selectAllApplication(0);
        List<Application> app2 = appMapper.selectAllApplication(1);
        app1.addAll(app2);
        return app1;
    }
}
