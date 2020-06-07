import model.Post;
import model.RecentUser;
import model.Topic;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import service.ForumService;
import service.UserService;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath:spring-mybatis.xml"})
public class textService {
    @Autowired
    private ForumService forumService;
    @Autowired
    private UserService userService;
    @Test
    public void addTopic() {
     /*   Topic topic = new Topic();
        topic.setUserId(1);
        topic.setCreateTime(new Timestamp(System.currentTimeMillis()));
        topic.setBoardId(3);
        topic.setTopicReplies(48);
        topic.setTopicTitle("测试");
        forumService.addTopic(topic);*/
        forumService.addViewed(1);
    }
   /* @Test
    public void removeTopic() {
        forumService.removeTopic(1234);
    }

    @Test
    public void insertPost() {
        Post post = new Post();
        post.setBoardId(1);
        post.setUserId(1);
        post.setTopicId(2);
        post.setPostType(Post.TYPE_REPLY);
        post.setPostTitle("我不信");
        post.setPostText("balabala");
        forumService.addPost(post);
    }

    @Test
    @Transactional
    public void removePost() {
        String title = "2";
        int boardId = 1;
        int userId = 2;
        Topic topic = new Topic();
        topic.setTopicTitle(title);
        topic.setBoardId(boardId);
        topic.setUserId(userId);
        topic.setCreateTime(new Timestamp(System.currentTimeMillis()));
        topic.setDigest(Topic.NUT_DISGEST);
        forumService.addTopic(topic);
    }

    @Test
    public void selectAllTest() {
        List<Post> list = forumService.getAllPostReplyByTopicId(2);
        for (Post p :
                list) {
            System.out.println(p.getPostId());
            System.out.println(p.getPostTitle());
        }
    }

    @Test
    public void recentUser() {
        List<RecentUser> list = userService.RecentUserData();
        for (RecentUser recentUser :
                list) {
            System.out.println(recentUser.getUserId());
        }
    }
    */
}
