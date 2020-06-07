package service;

import model.*;

import java.util.List;

public interface ForumService {
    //发表主题,积分加10，板块主题帖子加1
    void addTopic(Topic topic);
    //板块主题帖子减一，扣50积分，删除帖子和其回复帖子
    void removeTopic(int TopicId);
    //用户积分加5，帖子回复数加1，更新最后回复时间
    void addPost(Post post);
    //设置精华帖子
    void setStarTopic(int TopicId);
    //获取新帖
    List<Topic> getNewerForum();
    //获取热帖
    List<Topic> getHotForum();
    //获取选中的帖子内容
    Topic getSelectTopic(int TopicId);
    //获取所有帖子回复
    List<Post> getAllPostReplyByTopicId(int TopicId);
    //添加浏览数
    void addViewed(int TopicId);
    //获取回复
    Post getHostTopicInnerText(int topicId, int userId);
    //删除回复
    void deletePost(int PostId);
    //获取所有板块
    List<Board> getAllboard();
    //选择上一次插入的帖子
    int selectLastInsert();
    //获取板块
    List<BoardRe> getBoardMap();
    //获取板块下帖子
    List<Data> getBoardData(int boardId);
    //获取用户所发的帖子
    List<Topic> selectByuserId(int userId);
    //获取子版块内容
    List<SubBoardData> getSubBorardForum(int boardId, int subboardId);
}
