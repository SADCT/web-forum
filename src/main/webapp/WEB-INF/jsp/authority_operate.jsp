<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/5/29
  Time: 23:59
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
    <title>权限操作</title>
</head>
<body>
<%@include file="authority_header.jsp"%>
<div class="layui-container" style="height: 800px;">

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px">
        <legend>用户申请</legend>
    </fieldset>
    <div class="layui-tab">
        <div class="layui-tab-content" >
            <div class="layui-tab-item layui-show"  >
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th width="10%">用户ID</th>
                        <th width="10%">申请权限</th>
                        <th width="45%">申请理由</th>
                        <th width="35%">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <c:forEach items="${pageInfo.list}" var="u">
                    <tr>
                        <td class=""><p>${u.userId}</p></td>
                        <td class=""><p>管理员</p></td>
                        <td class=""><p>${u.applicationReason}</p></td>
                        <td>
                            <form action="/addAdminSuccess" method="post">
                                <input type="hidden" name="_method" value="POST">
                                <input type="hidden" name="userId" value="${u.userId}">
                                <input type="submit" class="layui-btn" value="批准">
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