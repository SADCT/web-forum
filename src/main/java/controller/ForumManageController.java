package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import dao.BoardMapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import model.Board;
import model.Post;
import model.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.ForumService;
import service.UserService;


import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
@Controller
public class ForumManageController {
    @Autowired
    private ForumService forumService;
    @Autowired
    private UserService userService;
    @Autowired
    private BoardMapper boardMapper;

    @RequestMapping(value = "/article/{id}")
    @ApiOperation(value = "根据id寻找主题帖",httpMethod = "GET")
    public ModelAndView topicPage(@PathVariable("id") int topicId,@RequestParam(required = false, defaultValue = "1") Integer page) {
        int PageSize = 5;
        PageHelper.startPage(page, PageSize);
        List<Post> list = forumService.getAllPostReplyByTopicId(topicId);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("topic");
        forumService.addViewed(topicId);
        //分页pageHelper
        PageInfo<Post> p = new PageInfo<>(list);
        Topic topic = forumService.getSelectTopic(topicId);
        modelAndView.addObject(p);
        modelAndView.addObject("hostName", userService.selectByUserId(topic.getUserId()).getUserName());
        modelAndView.addObject("host", forumService.getSelectTopic(topicId));
        modelAndView.addObject("hostText", forumService.getHostTopicInnerText(topicId, topic.getUserId()).getPostText());
        return modelAndView;
    }

    @RequestMapping(value = "/postText", method = RequestMethod.PUT)
    @ApiOperation(value = "回复主题帖",httpMethod = "PUT")
    @ResponseBody
    public boolean postText(@RequestBody Post post) {
        forumService.addPost(post);
        return true;
    }

    @RequestMapping(value = "/deletePost", method = RequestMethod.DELETE)
    @ApiOperation(value = "删除回复贴",httpMethod = "DELETE")
    public String deletePost(@RequestParam int postId,@RequestParam int topicId) {
        forumService.deletePost(postId);
        return "redirect:/article/"+topicId;
    }

    @RequestMapping(value = "/addTopic",method = RequestMethod.GET)
    @ApiOperation(value = "返回发帖页面",httpMethod = "GET")
    public ModelAndView addTopic() {
        List<Board> list = boardMapper.getAllBoard();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("boardList", list);
        modelAndView.setViewName("/addTopic");
        return modelAndView;
    }
    @ApiOperation(value = "增加主题帖",httpMethod = "POST")
    @RequestMapping(value = "/addTopicSuccess", method = RequestMethod.POST)
    public String addTopicSuccess(@RequestParam int boardId, @RequestParam String title, @RequestParam String text, @RequestParam int userId) {
        Topic topic = new Topic();
        topic.setTopicTitle(new EncodingTool().encodeStr(title));
        topic.setBoardId(boardId);
        topic.setUserId(userId);
        topic.setCreateTime(new Timestamp(System.currentTimeMillis()));
        topic.setDigest(Topic.NUT_DISGEST);
        forumService.addTopic(topic);
        Post post = new Post();
        int topicId = forumService.selectLastInsert();
        post.setTopicId(topicId);
        post.setPostText(new EncodingTool().encodeStr(text));
        post.setPostType(Post.TYPE_MAIN);
        post.setUserId(userId);
        post.setBoardId(boardId);
        forumService.addPost(post);
        return "redirect:/article/"+topicId;

    }

    //requestParam转码
    public class EncodingTool {
         String encodeStr(String str) {
            try {
                return new String(str.getBytes("ISO-8859-1"), "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
                return null;
            }

        }
    }
}
