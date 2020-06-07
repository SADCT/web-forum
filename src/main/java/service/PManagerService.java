package service;

import model.Application;

import java.util.List;

public interface PManagerService {
    //批准用户成为管理员
    void changetoManager(Integer userId);
    //获取已通过用户
    List<Application> getPassedApplication();
    //获取未通过用户
    List<Application> getNotPassedApplication();
    //获取所有申请
    List<Application> getAllApplication();
}
