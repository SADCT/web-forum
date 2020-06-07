package dao;

import model.Board;
import model.Topic;

import java.util.List;

public interface TopicMapper {
    int deleteByPrimaryKey(Integer topicId);

    int insert(Topic record);

    int insertSelective(Topic record);

    Topic selectByPrimaryKey(Integer topicId);

    int updateByPrimaryKeySelective(Topic record);

    int updateByPrimaryKey(Topic record);

    List<Topic> selectOrderBydatetime();

    List<Topic> selectOrderByReply();

    int selectLastInsertId();

    List<Topic> selectByuserId(int userId);

    List<Topic> selectBytopicId(int boardId);

    List<Topic> getunrefinedtopic();
}