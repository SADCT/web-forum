<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/5/30
  Time: 17:50
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
    <title>权限列表</title>
</head>
<body>
<%@include file="authority_header.jsp"%>
<div class="layui-container" style="height: 800px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>权限列表</legend>
    </fieldset>

    <div class="layui-form">
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="150">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>管理员ID</th>
                <th>管理员姓名</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <c:forEach items="${pageInfo.list}" var="u">
            <tr>
                <td class="name"><p>${u.userId}</p></td>
                <td class="name"><p>${u.userName}</p></td>
            </tr>
            </c:forEach>
            </tr>

            </tbody>
        </table>
    </div>
</div>

<%@include file="footer.jsp"%>
</body>
</html>
