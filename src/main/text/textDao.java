import dao.*;
import model.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import service.UserService;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath:spring-mybatis.xml"})
public class textDao {
    @Autowired
    private UserService userService;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private LoginLogMapper loginLogMapper;
    @Autowired
    private TopicMapper topicMapper;
    @Autowired
    private PostMapper postMapper;
    @Autowired
    private BoardMapper boardMapper;
    @Autowired
    private UserDetailedMapper userDetailedMapper;
    @Test
    public void login() {
        System.out.println(userService.findUserByName("admin").getPassword());
    System.out.println(userService.checkLogin("admin","admin"));

    }


    @Test
    @Transactional
    public void lock() {
        userService.lockUser("admin");

    }

    @Test
    @Transactional
    public void addCredit() {
        userService.addCredit("admin",5);
        System.out.println(userService.findUserByName("admin").getCredit());
    }

    @Test
    public void loginLog() {
        userService.setLoginLogAndDate("admin", new java.sql.Date(System.currentTimeMillis()), "12121");
    }

    @Test
    @Transactional
    public void newForum() {
        List<Topic> list = topicMapper.selectOrderBydatetime();
        for (Topic t :
                list) {
            System.out.println(t.getCreateTime().toString());
        }


    }
@Test
@Transactional
    public void temp() {
    Topic topic = topicMapper.selectByPrimaryKey(3);
    topic.setTopicId(null);
    topicMapper.insertSelective(topic);
    System.out.println(topicMapper.selectLastInsertId());
    }
@Test
    public void ss() {
    List<Data> list = boardMapper.getboardData(1);
    for (Data data :
            list) {
        System.out.println(data.getTopicId());
    }

}
    @Transactional
    @Test
    public void TestDate() {
        String uuid = UUID.randomUUID().toString();	//获取UUID并转化为String对象

        uuid = uuid.replace("-", "");				//因为UUID本身为32位只是生成时多了“-”，所以将它们去点就可

        System.out.println(uuid);
    }

    @Test
    public void sdsd() {
        List<RecentUser> list = userDetailedMapper.RecentUserData();
        for (RecentUser recentUser :
                list) {
            System.out.println(recentUser.getUserId());
        }
    }
}
