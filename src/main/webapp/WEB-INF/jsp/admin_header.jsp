<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/5/28
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<link rel="stylesheet" href="../../statics/css/board.css">
<script src="../../statics/layui.js"></script>
<!-- 引入 Bootstrap -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- 包括所有已编译的插件 -->
<script src="../../statics/js/bootstrap.min.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<header class="layui-header">
    <ul class="layui-nav" >
        <li class="layui-nav-item layui-this layui-unselect" id="a"><a href="">WeGet</a></li>
        <li class="layui-nav-item "><a href="/index">贴吧主页</a></li>

        <li class="layui-nav-item "><a href="/admin_board">帖子审核</a></li>

        <li class="layui-nav-item "> <a href="/admin_board_select">筛选精贴</a></li>
        <li class="layui-nav-item" id="b"> <a href="javascript:;">板块</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a href="/set_board">增设板块</a></dd>
                <c:if test="${!empty user}">
                <dd><a href="/delete_board/${user.userId}">删除板块</a></dd>
                </c:if>
            </dl>
        </li>
        <li class="layui-nav-item "><a href="/admin_lock">用户锁定</a></li>
        <%--判断用户是否登录--%>
        <c:if test="${empty user}">
            <li class="layui-nav-item" style="float: right"><a href="/user/register">注册</a></li>
            <li class="layui-nav-item" style="float: right"><a href="/user/use_homepage">备用</a></li>
            <li class="layui-nav-item" style="float: right"><a href="/user/login">
                <i class="layui-icon layui-icon-username"></i>登录</a></li>
        </c:if>
        <c:if test="${!empty user}">
            <li class="layui-nav-item" style="float: right" id="UserId">${user.userId}</li>
            <li class="layui-nav-item" style="float: right">
                <a href="javascript:;"><i class="layui-icon layui-icon-username">&nbsp;</i>${user.userName}</a>
                <dl class="layui-nav-child">
                    <dd><a href="/user/detail/${user.userId }">个人中心</a> </dd>
                    <dd><a href="/userInfo_modify/${user.userId}">修改个人信息</a></dd>
                    <dd><a href="javascript:signout_confirm()">退出</a> </dd>
                </dl>
            </li>

        </c:if>
    </ul>
</header>


<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use(['element','jquery'], function(){
        var element = layui.element;
        var $=layui.$;
        $("#b").click(function(){
            $("#a").removeClass("layui-this ");
            $("#b").addClass("layui-this");

        });
    });
    function signout_confirm()
    {
        layui.use('layer', function(){
            var layer = layui.layer;

            layer.confirm('确定退出?', {icon: 3, title:'提示'}, function(index){
                window.location.href="/user/logout";
                layer.close(index);
            });
        });


    }
</script>

