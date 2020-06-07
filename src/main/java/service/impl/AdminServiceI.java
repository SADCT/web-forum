package service.impl;

import dao.*;
import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.AdminService;

import java.util.List;

import static model.User.USER_LOCK;

@Service
public class AdminServiceI implements AdminService{
    @Autowired
    private BoardMapper boardMapper;
    @Autowired
    private BoardManagerMapper boardManagerMapper;
    @Autowired
    private TopicMapper topicMapper;
    @Autowired
    private PostMapper postMapper;
    @Autowired
    private SubboardMapper subboardMapper;
    @Autowired
    private UserMapper userMapper;
    @Override
    public void addBoard(Board board, int userid) {
        boardMapper.insertSelective(board);
        SubBoard subBoard = new SubBoard();
        board = boardMapper.selectLatest();
        for (int i=0;i<4;i++){
            subBoard.setBoardId(board.getBoardId());
            subBoard.setSubboardId(i);
            subBoard.setTopicNum(0);
            if(i==0){
                subBoard.setSubboardName("社区讨论");
            }
            if(i==1){
                subBoard.setSubboardName("攻略分享");
            }
            if(i==2){
                subBoard.setSubboardName("组队交友");
            }
            if(i==3){
                subBoard.setSubboardName("比赛资讯");
            }
            subboardMapper.insertSelective(subBoard);
        }
        BoardManagerKey boardManagerKey = new BoardManagerKey();
        boardManagerKey.setBoardId(board.getBoardId());
        boardManagerKey.setUserId(userid);
        boardManagerMapper.insert(boardManagerKey);
    }

    @Override
    public void Topic_refinement(int topicid) {
        Topic topic = new Topic();
        topic = topicMapper.selectByPrimaryKey(topicid);
        topic.setDigest(1);
        topicMapper.updateByPrimaryKeySelective(topic);
    }

    @Override
    public void removeBoard(int BoardId,int UserId) {

        boardMapper.deleteByPrimaryKey(BoardId);
        for (int i=0;i<4;i++){
            subboardMapper.deleteByPrimaryKey(BoardId,i);
        }
        List<Topic> topicList = topicMapper.selectBytopicId(BoardId);
        for (Topic t:
                topicList) {
            topicMapper.deleteByPrimaryKey(t.getTopicId());
            Topic topic = topicMapper.selectByPrimaryKey(t.getTopicId());
            //删除相关回复贴
            topicMapper.deleteByPrimaryKey(t.getTopicId());
            List<Post> postList = postMapper.selectByTopicId(t.getTopicId());
            for (Post p:
                    postList) {
                postMapper.deleteByPrimaryKey(p.getPostId());
            }
        }
        BoardManagerKey boardManagerKey = new BoardManagerKey();
        boardManagerKey.setUserId(UserId);
        boardManagerKey.setBoardId(BoardId);
        boardManagerMapper.deleteByPrimaryKey(boardManagerKey);
    }

    @Override
    public List<Board> getcreatBoard(int userId) {
        return boardMapper.selectByuserId(userId);
    }

    @Override
    public List<Topic> getunrefinedtopic() {
        return topicMapper.getunrefinedtopic();
    }



    @Override
    public List<User> getunlockeruser() {
        return userMapper.selectunlockeruser();
    }
}
