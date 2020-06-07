<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/6/5
  Time: 23:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<link rel="stylesheet" href="../../statics/css/board.css">
<script src="../../statics/layui.js"></script><html>
<head>
    <title>筛选精贴</title>
</head>
<body>
<%@include file="admin_header.jsp"%>
<div class="layui-container" style="height: 800px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>
            <span class="layui-badge">快捷导航</span></legend>
    </fieldset>
    <div class="layui-anim layui-anim-up">
        <span class="layui-breadcrumb" lay-separator="/">
  <a href="/board/1">英雄联盟</a>
  <a href="/board/2">绝地求生</a>
  <a href="/board/3">穿越火线</a>
  <a href="/board/4">CS:GO</a>
  <a href="/board/5">FIFA</a>
</span>
    </div>
    <div style="height: 50px"></div>
    <div class="chunk">
        <table summary="">
            <tbody><tr>
                <th width="600">版块</th>
                <th width="150" class="main-post">帖子</th>
            </tr>

            <c:forEach items="${boardReList}" var="b">
                <tr>
                    <td class="name"><p><a href="/admin_board_select/${b.boardId}">${b.boardName}</a><br>版主：<a class="notabs" href="" target="_blank" c="1">${b.userName}</a><br>${b.boardDesc}</p></td>
                    <td class="num"><var>${b.topicNum}</var></td>

                </tr>
            </c:forEach>



            </tbody></table>
    </div>

</div>
<%@include file="footer.jsp"%>
</body>
</html>
