package controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.ApiOperation;
import model.Board;
import model.Data;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.AdminService;
import service.ForumService;
import service.UserService;

import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private ForumService forumService;
    @Autowired
    private AdminService adminService;
    @RequestMapping(value = "/admin_board",method = RequestMethod.GET)
    @ApiOperation(value = "管理员审核帖子（板块ui）",httpMethod = "GET")
    public String adminBoard(Model model) {
            model.addAttribute(forumService.getBoardMap());
        return "admin_board";
    }
    @RequestMapping(value = "/admin_board_select",method = RequestMethod.GET)
    @ApiOperation(value = "管理员筛选帖子（板块ui）",httpMethod = "GET")
    public String adminBoardSelect(Model model) {
        model.addAttribute(forumService.getBoardMap());
        return "admin_board_select";
    }



    @RequestMapping(value = "/admin_board/{boardId}")
    @ApiOperation(value = "根据id获取板块",httpMethod = "GET")
    public ModelAndView adminBoardIn(@PathVariable int boardId) {
        ModelAndView modelAndView = new ModelAndView();
        int subBoardId1 = 0;
        int subBoardId2 = 1;
        int subBoardId3 = 2;
        int subBoardId4 = 3;
        modelAndView.setViewName("/admin_inboard");
        modelAndView.addObject("list0",forumService.getBoardData(boardId));
        modelAndView.addObject("list1", forumService.getSubBorardForum(boardId, subBoardId1));
        modelAndView.addObject("list2", forumService.getSubBorardForum(boardId, subBoardId2));
        modelAndView.addObject("list3", forumService.getSubBorardForum(boardId, subBoardId3));
        modelAndView.addObject("list4", forumService.getSubBorardForum(boardId, subBoardId4));
        return modelAndView;
    }
    @RequestMapping(value = "/admin_board_select/{boardId}")
    @ApiOperation(value = "根据id获取板块",httpMethod = "GET")
    public ModelAndView adminBoardInSelect(@PathVariable int boardId) {
        ModelAndView modelAndView = new ModelAndView();
        int subBoardId1 = 0;
        int subBoardId2 = 1;
        int subBoardId3 = 2;
        int subBoardId4 = 3;
        modelAndView.setViewName("/admin_select");
        modelAndView.addObject("boardId",boardId);
        modelAndView.addObject("list0",forumService.getBoardData(boardId));
        modelAndView.addObject("list1", forumService.getSubBorardForum(boardId, subBoardId1));
        modelAndView.addObject("list2", forumService.getSubBorardForum(boardId, subBoardId2));
        modelAndView.addObject("list3", forumService.getSubBorardForum(boardId, subBoardId3));
        modelAndView.addObject("list4", forumService.getSubBorardForum(boardId, subBoardId4));
        return modelAndView;
    }


    @RequestMapping(value = "/set_board",method = RequestMethod.GET)
    @ApiOperation(value = "管理员增设板块",httpMethod = "GET")
    public String setBoard() {
        return "set_board";
    }

    @ApiOperation(value = "增加版块",httpMethod = "POST")
    @RequestMapping(value = "/addBoardSuccess", method = RequestMethod.POST)
    public String addBoardSuccess(@RequestParam String title, @RequestParam String text, @RequestParam int userId) {
        System.out.println(title);
        System.out.println(text);
        Board board = new Board();
        board.setBoardName(title);
        board.setTopicNum(0);
        board.setBoardDesc(text);
        adminService.addBoard(board,userId);
        return "redirect:/admin_homepage";
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

    @RequestMapping(value = "/delete_board/{userId}",method = RequestMethod.GET)
    @ApiOperation(value = "管理员删除板块",httpMethod = "GET")
    public String deleteBoard(Model model,@PathVariable int userId) {
        model.addAttribute(adminService.getcreatBoard(userId));
        return "delete_board";
    }



    @RequestMapping(value = "/delete",method = RequestMethod.DELETE)
    @ApiOperation(value = "删除板块",httpMethod = "DELETE")
    public String delete(@RequestParam int boardId,@RequestParam int userId) {
        System.out.println(boardId);
        System.out.println(userId);
        if (userService.findById(userId) != null) {
            Byte userType = userService.selectByUserId(userId).getUserType();
            if (userType == 2) {
                adminService.removeBoard(boardId, userId);
            }else{
                System.out.println("Fail1");
            }
        }else{
            System.out.println("Fail2");
        }
        return "redirect:/delete_board/"+userId;
    }


    @RequestMapping(value = "/deleteArt",method = RequestMethod.DELETE)
    @ApiOperation(value = "删除帖子",httpMethod = "DELETE")
    public String deleteArt(@RequestParam int topicId,@RequestParam int userId,@RequestParam int boardId) {
        System.out.println(topicId);
        System.out.println(userId);
        if (userService.findById(userId) != null) {
            Byte userType = userService.selectByUserId(userId).getUserType();
            if (userType == 2) {
                forumService.removeTopic(topicId);
            }else{
                System.out.println("Fail11");
            }
        }else{
            System.out.println("Fail22");
        }
        return "redirect:/admin_board_select/"+boardId;
    }

    @RequestMapping(value = "/select",method = RequestMethod.POST)
    @ApiOperation(value = "筛选帖子",httpMethod = "POST")
    public String select(@RequestParam int topicId,@RequestParam int userId,@RequestParam int boardId) {
        System.out.println(topicId);
        System.out.println(userId);
        if (userService.findById(userId) != null) {
            Byte userType = userService.selectByUserId(userId).getUserType();
            if (userType == 2) {
                forumService.setStarTopic(topicId);
            }else{
                System.out.println("Fail1");
            }
        }else{
            System.out.println("Fail2");
        }
        return "redirect:/admin_board_select/"+boardId;
    }

    @RequestMapping(value = "/admin_lock",method = RequestMethod.GET)
    @ApiOperation(value = "锁定用户页面",httpMethod = "GET")
    public String lockUser(Model model ,@RequestParam(required = false, defaultValue = "1") Integer page) {
        PageHelper.startPage(page, 5);
        List<User> list = adminService.getunlockeruser();
        PageInfo<User> p = new PageInfo<>(list);
        model.addAttribute(p);
        return "admin_lock";
    }

    @ApiOperation(value = "管理员锁定用户",httpMethod = "POST")
    @RequestMapping(value = "/addLockSuccess", method = RequestMethod.POST)
    public String addLockSuccess(@RequestParam String userName) {
        userService.lockUser(userName);
        return "redirect:/admin_lock";
    }


}
