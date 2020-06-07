<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/5/29
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<link rel="stylesheet" href="../../statics/css/board.css">
<script src="../../statics/layui.js"></script><html>
<html>
<head>
    <title>删除板块</title>
</head>
<body>

<%@include file="admin_header.jsp"%>
<div class="layui-container" style="height: 800px;">

    <div style="height: 50px"></div>
    <div class="chunk">
        <table class="layui-table" id="tableDemo" lay-filter="tableDemo">
            <tbody><tr>
                <th width="600">版块</th>
                <th width="150" class="main-post">帖子</th>
                <th width="150" class="main-post">操作</th>
            </tr>

            <c:forEach items="${boardList}" var="b">
                <tr>
                    <td class="name"><p><a href="/board/${b.boardId}">${b.boardName}</a><br>版主：<a class="notabs" href="" target="_blank" c="1">${user.userName}</a><br>${b.boardDesc}</p></td>
                    <td class="num"><var>${b.topicNum}</var></td>
                    <td > <form action="/delete" method="post" >
                        <input type="hidden" name="_method" value="DELETE">
                        <input type="hidden" name="boardId"value="${b.boardId}">
                        <input type="hidden" name="userId" value="${user.userId}">
                        <input type="submit" class="layui-btn-xs layui-btn" value="删除">
                    </form></td>
                </tr>
            </c:forEach>
            </tbody></table>
</div>
</div>
<%@include file="footer.jsp"%>

</body>
<script>

    layui.use(['table','layer','jquery'],function () {
        var table = layui.table;
        var layer=layui.layer;
        var $=layui.$;
        $('#deleteBoard').click(function(){
            var boardId = $('#boardId').val();
            var userId = $('#UserId').val();
            var flag = 0;
            $.ajax({
                type: "post",
                url: "/delete",      //你的controller地址
                data: {"BoardId" :boardId ,"UserId" :userId },
                dataType:"json",
                async:false,

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
</html>
