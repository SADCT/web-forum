package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.ApiOperation;
import model.AdminUser;
import model.Application;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.PManagerService;
import service.UserService;

import java.util.List;

@Controller
public class authorityManageController {
    @Autowired
    private UserService userService;

    @Autowired
    private PManagerService pManagerService;

    @RequestMapping(value = "/authority_operate",method = RequestMethod.GET)
    @ApiOperation(value = "权限管理员权限操作",httpMethod = "GET")
    public String authorityOperate(Model model , @RequestParam(required = false, defaultValue = "1") Integer page) {
        PageHelper.startPage(page, 5);
        List<Application> list = pManagerService.getNotPassedApplication();
        PageInfo<Application> p = new PageInfo<>(list);
        model.addAttribute(p);
        return "authority_operate";
    }

    @ApiOperation(value = "批准管理员申请",httpMethod = "POST")
    @RequestMapping(value = "/addAdminSuccess", method = RequestMethod.POST)
    public String addAdminSuccess(@RequestParam int userId) {
        pManagerService.changetoManager(userId);
        return "redirect:/authority_operate";
    }

    @RequestMapping(value = "/authority_list",method = RequestMethod.GET)
    @ApiOperation(value = "会员权限表",httpMethod = "GET")
    public String authorityList(Model model ,@RequestParam(required = false, defaultValue = "1") Integer page) {
        PageHelper.startPage(page, 2);
        List<AdminUser> list = userService.getManager();
        PageInfo<AdminUser> p = new PageInfo<>(list);
        model.addAttribute(p);
        return "authority_list";
    }


}
