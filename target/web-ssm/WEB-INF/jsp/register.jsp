<%--
  Created by IntelliJ IDEA.
  User: Maxci
  Date: 2018/7/1
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<script src="../../statics/layui.js"></script>
<html>
<head>
    <title>注册</title>
</head>
<body>
<%@include file="header.jsp"%>
<div style="width: 500px;height: 600px;margin: 0 auto;">
    <div style="width: 800px; height: 100px"></div>
<form class="layui-form" action="/registerPro" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名:</label>

        <div class="layui-input-inline">
            <input type="text" id="username" name="username" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
        <div id="confirm3" class="layui-form-mid layui-word-aux"></div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码:
        </label>
        <div class="layui-input-inline">
            <input type="password" name="password" id="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
        <div id="confirm1" class="layui-form-mid layui-word-aux"></div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">确认密码:</label>
        <div class="layui-input-inline">
            <input type="password" id="password2" required lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
        </div>
        <div id="confirm2" class="layui-form-mid layui-word-aux"></div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱:</label>
        <div class="layui-input-inline">
            <input type="text" name="title"  required lay-verify="email" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</div>

<%@include file="footer.jsp"%>
</body>
<script>
    layui.use(['jquery', 'layer'], function() {
        var $ = layui.$
            , layer = layui.layer;
        $("#password2").blur(function () {
            var p1 = $("#password").val();
            var p2 = $("#password2").val();
            if (p1 !== p2) {
                $("#confirm2").html("密码输入不一致");
            } else {
                $("#confirm2").html("密码输入一致");

            }
        });
        $('#username').blur(function () {
            var name = $('#username').val();
            if (name === "") {
                document.getElementById("confirm3").innerHTML = "请输入用户名";
                return;
            }
            $.ajax({
                url: "/checkUser",
                type: "post",
                data: {"userName": name},
                dataType: "json",
                success: function (data) {
                    if (data === true) {
                        document.getElementById("confirm3").innerHTML = "用户名已存在";

                    } else {
                        document.getElementById("confirm3").innerHTML = "<i class=\"layui-icon layui-icon-ok-circle\" style=\"font-size: 30px; color: #39ac47;\"></i>\n";

                    }
                }
            });


        });
    });
    //Demo
    layui.use('form', function(){
        var form = layui.form;
        //监听提交
        form.on('submit(formDemo)', function(data){
            return true;
        });
    });
</script>
</html>
