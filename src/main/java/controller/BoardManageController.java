package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import model.Data;
import model.SubBoardData;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.ForumService;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BoardManageController {
    @Autowired
    private UserService userService;
    @Autowired
    private ForumService forumService;
    @RequestMapping(value = "/board",method = RequestMethod.GET)
    @ApiOperation(value = "返回板块页面",httpMethod = "GET")
    public String board(Model model) {
        model.addAttribute(forumService.getBoardMap());
        return "board";
    }

    @RequestMapping(value = "/board/{boardId}")
    @ApiOperation(value = "根据id获取板块",httpMethod = "GET")
 /*   public String boardIn(Model model ,@PathVariable int boardId,@RequestParam(required = false, defaultValue = "1") Integer page) {
        PageHelper.startPage(page, 5);
        List<Data> list=forumService.getBoardData(boardId);
        PageInfo<Data> p = new PageInfo<>(list);
        model.addAttribute(p);


        model.addAttribute("boardId", boardId);
        return "Inboard";
    }*/
    public ModelAndView boardIn(@PathVariable int boardId) {
        ModelAndView modelAndView = new ModelAndView();
        int subBoardId1 = 0;
        int subBoardId2 = 1;
        int subBoardId3 = 2;
        int subBoardId4 = 3;
        modelAndView.setViewName("/Inboard");
        modelAndView.addObject("list0",forumService.getBoardData(boardId));
        modelAndView.addObject("list1", forumService.getSubBorardForum(boardId, subBoardId1));
        modelAndView.addObject("list2", forumService.getSubBorardForum(boardId, subBoardId2));
        modelAndView.addObject("list3", forumService.getSubBorardForum(boardId, subBoardId3));
        modelAndView.addObject("list4", forumService.getSubBorardForum(boardId, subBoardId4));
        return modelAndView;
    }






}
