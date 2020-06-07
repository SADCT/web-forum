<%--
  Created by IntelliJ IDEA.
  User: Lee
  Date: 2020/6/7
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- 包括所有已编译的插件 -->
<script src="../../statics/js/bootstrap.min.js"></script>
<script src="../../statics/layui.js"></script>
<html>
<head>
    <title>用户锁定</title>
</head>
<body>
<%@include file="admin_header.jsp"%>
<div class="layui-container" style="height: 800px;">

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px">
        <legend>用户锁定</legend>
    </fieldset>
    <div class="layui-tab">
        <div class="layui-tab-content" >
            <div class="layui-tab-item layui-show" >
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th width="40%">用户ID</th>
                        <th width="40%">用户姓名</th>
                        <th width="20%">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <c:forEach items="${pageInfo.list}" var="u">
                    <tr>
                        <td class=""><p>${u.userId}</p></td>
                        <td class=""><p>${u.userName}</p></td>
                        <td>
                            <form action="/addLockSuccess" method="post">
                                <input type="hidden" name="_method" value="POST">
                                <input type="hidden" name="userName" value="${u.userName}">
                                <input type="submit" class="layui-btn" value="锁定">
                            </form>
                            <!---<input type="delete" class="layui-btn" value="拒绝">--->
                            <!---<button class="layui-btn" type="button">批准</button>
                            <button class="layui-btn" type="button">拒绝</button>--->
                        </td>
                        <br>
                    </tr>
                    </c:forEach>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
