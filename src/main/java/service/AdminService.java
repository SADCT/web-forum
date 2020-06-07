package service;

import model.Board;
import model.Topic;
import model.User;

import java.util.List;

public interface AdminService {
    //增加板块
    void addBoard(Board board, int userId);
    //帖子加精
    void Topic_refinement(int topicid);
    //删除板块
    void removeBoard(int BoardId,int userId);
    //获取自己创建的板块
    List<Board> getcreatBoard(int userId);
    //获取自己创建的板块
    List<Topic> getunrefinedtopic();
    //获取未锁定用户
    List<User> getunlockeruser();
}
