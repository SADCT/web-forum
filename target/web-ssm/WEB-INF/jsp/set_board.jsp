<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/5/28
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<link rel="stylesheet" href="../../statics/css/board.css">
<script src="../../statics/layui.js"></script>
<html>
<head>
    <title>开设板块</title>
</head>
<body>
<%@include file="admin_header.jsp"%>

<div class="layui-container" style="height: 800px;">
    <form class="layui-form" action="/addBoardSuccess"  method="post" style="margin-top: 10%">
        <input type="hidden" name="userId" value="${user.userId}">
        <div class="layui-form-item">
            <label class="layui-form-label">板块名称</label>
            <div class="layui-input-block">
                <input name="title" class="layui-input" type="text" placeholder="请输入板块名称" value="${b.boardName}" autocomplete="off" lay-verify="title">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">板块介绍</label>
            <div class="layui-input-block">
                <textarea name="text" class="layui-textarea" placeholder="请输入内容"  value="${b.boardDesc}"></textarea>
            </div>
        </div>

        <div class="layui-upload">
            <label class="layui-form-label">上传图标</label>
            <button class="layui-btn" id="test1" type="button">上传图片</button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo1">
                <p id="demoText"></p>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <!---<button id="put" class="layui-btn" type="submit" lay-filter="demo1" lay-submit="">立即提交</button>--->
                <input type="submit" class="layui-btn" value="提交">
                <button class="layui-btn layui-btn-primary" type="reset">重置</button>
            </div>
        </div>

    </form>

</div>



<%@include file="footer.jsp"%>
</body>

<script>
    layui.use(['layer','jquery'],function () {
        var layer = layui.layer;
        var $ = layui.$;
        $('#post').click(function () {
            var title = $('#boardName').val();
            var text = $('#boardDesc').val();
            var userId = $('#UserId').val();
            var flag = 0;
            $.ajax({
                type: "post",
                url: "/addBoardSuccess",      //你的controller地址
                data: {"boardName": title, "boardDesc": text, "UserId": userId},
                dataType: "json",
                async: false,

                success: function (data) {
                    flag = data;
                }
            });
            switch (flag) {
                case 0:
                    return true;
                case 1:
                    layer.msg("无此用户！");
                    return false;
                case 2:
                    layer.msg("用户无权限！");
                    return false;

            }
        });
    });
</script>

<script>

    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , url: 'https://httpbin.org/post' //改成您自己的上传接口
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
    });
</script>
</html>
