package service.impl;
import dao.*;
import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.ForumService;

import java.sql.Timestamp;
import java.util.List;

@Service
public class ForumServiceI implements ForumService {
    @Autowired
    private TopicMapper topicMapper;
    @Autowired
    private BoardMapper boardMapper;
    @Autowired
    private PostMapper postMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private SubboardMapper subboardMapper;
    @Override
    public void addTopic(Topic topic) {
        topicMapper.insertSelective(topic);
        SubBoard subBoard = subboardMapper.selectByPrimaryKey(topic.getBoardId(),topic.getSubBoardId());
        subBoard.setTopicNum(subBoard.getTopicNum() + 1);
        subboardMapper.updateByPrimaryKeySelective(subBoard);
        Board board = boardMapper.selectByPrimaryKey(topic.getBoardId());
        board.setTopicNum(board.getTopicNum() + 1);
        boardMapper.updateByPrimaryKeySelective(board);
    }
    @Override
    public void removeTopic(int TopicId) {
        Topic topic = topicMapper.selectByPrimaryKey(TopicId);
        //删除相关回复贴
        topicMapper.deleteByPrimaryKey(TopicId);
        List<Post> postList = postMapper.selectByTopicId(TopicId);
        for (Post p:
             postList) {
            postMapper.deleteByPrimaryKey(p.getPostId());
        }
        SubBoard subBoard = subboardMapper.selectByPrimaryKey(topic.getBoardId(),topic.getSubBoardId());
        subBoard.setTopicNum(subBoard.getTopicNum() - 1);
        subboardMapper.updateByPrimaryKeySelective(subBoard);
        //论坛板块主题帖子数-1
        Board board = boardMapper.selectByPrimaryKey(topic.getBoardId());
        board.setTopicNum(board.getTopicNum() - 1);
        boardMapper.updateByPrimaryKeySelective(board);
        //扣50积分
        User user = userMapper.selectByPrimaryKey(topic.getUserId());
        user.setCredit(user.getCredit() - 50 >= 0 ? user.getCredit() - 50 : 0);
        userMapper.updateByPrimaryKey(user);
    }
    @Override
    public void addPost(Post post) {
        //插入回复信息
        post.setCreateTime(new Timestamp(System.currentTimeMillis()));
        postMapper.insertSelective(post);
        //积分+5
        User user = userMapper.selectByPrimaryKey(post.getUserId());
        user.setCredit(user.getCredit() + 5);
        userMapper.updateByPrimaryKeySelective(user);
        //主题回复数+1，更新回复时间
        Topic topic = topicMapper.selectByPrimaryKey(post.getTopicId());
        topic.setTopicReplies(topic.getTopicReplies() + 1);
        topic.setLastPost(new Timestamp(System.currentTimeMillis()));
        topicMapper.updateByPrimaryKeySelective(topic);
    }
    @Override
        public void setStarTopic(int TopicId) {
        Topic topic = topicMapper.selectByPrimaryKey(TopicId);
        topic.setDigest(Topic.IS_DISGEST);
        topicMapper.updateByPrimaryKeySelective(topic);
    }
    @Override
    public List<Topic> getNewerForum() {
        return topicMapper.selectOrderBydatetime();
    }
    @Override
    public List<Topic> getHotForum() {
        return topicMapper.selectOrderByReply();
    }
    @Override
    public Topic getSelectTopic(int TopicId) {
        return topicMapper.selectByPrimaryKey(TopicId);
    }
    @Override
    public List<Post> getAllPostReplyByTopicId(int TopicId) {
        List<Post> list = postMapper.selectByTopicId(TopicId);
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getPostType() == Post.TYPE_MAIN) {
                list.remove(i);
            }
        }
        for (Post p :
                list) {
            p.setPostTitle(userMapper.selectByPrimaryKey(p.getUserId()).getUserName());

        }
        return list;
    }
    @Override
    public void addViewed(int TopicId) {
        Topic topic = topicMapper.selectByPrimaryKey(TopicId);
        topic.setTopicViews(topic.getTopicViews() + 1);
        topicMapper.updateByPrimaryKeySelective(topic);
    }
    @Override
    public Post getHostTopicInnerText(int topicId, int userId) {
        return postMapper.getHostTopicInnerText(topicId, userId);
    }
    @Override
    public void deletePost(int PostId) {
        Post post = postMapper.selectByPrimaryKey(PostId);
        Topic topic = topicMapper.selectByPrimaryKey(post.getTopicId());
        topic.setTopicReplies(topic.getTopicReplies() - 1);
        topicMapper.updateByPrimaryKeySelective(topic);
        postMapper.deleteByPrimaryKey(PostId);
    }
    @Override
    public List<Board> getAllboard() {
        return boardMapper.getAllBoard();
    }
    @Override
    public int selectLastInsert() {
        return topicMapper.selectLastInsertId();
    }

    @Override
    public List<BoardRe> getBoardMap() {
        return boardMapper.getBoardMap();
    }

    @Override
    public List<Data> getBoardData(int boardId) {
        return boardMapper.getboardData(boardId);
    }

    @Override
    public List<Topic> selectByuserId(int userId) {
        return topicMapper.selectByuserId(userId);
    }
    @Override
    public List<SubBoardData> getSubBorardForum(int boardId, int subboardId){
        return  subboardMapper.getsubboardMap(boardId,subboardId);
    }
}
