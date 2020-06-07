<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/6/6
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改个人信息</title>
</head>
<body>
<%@include file="header.jsp"%>
<div style="width: 800px;height: 800px;margin: 0 auto;">
    <div style="width: 800px; height: 300px;margin: 0 auto; "></div>
    <form class="layui-form" action="/modify_success" method="post">
       <div>
           <input type="hidden" name="userId" value="${user.userId}">
       </div>

        <div class="layui-form-item">
            <label class="layui-form-label">邮箱:</label>

            <div class="layui-input-inline">
                <input type="text" id="userEmail" name="userEmail" required  lay-verify="required" value=${userEmail} autocomplete="off" class="layui-input">
            </div>
            <div id="confirm3" class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话:
            </label>
            <div class="layui-input-inline">
                <input type="text" name="userPhoneNumber" id="userPhoneNumber" required lay-verify="required" value=${userPhoneNumber} autocomplete="off" class="layui-input">
            </div>
            <div id="confirm1" class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别:</label>
            <div class="layui-input-inline">
                <input type="text" name="userSex" id="userSex" required lay-verify="required" value=${userSex} autocomplete="off" class="layui-input">
            </div>
            <div id="confirm2" class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">个人描述:</label>
            <div class="layui-input-inline">
                <input type="text" name="userSignature" id="userSignature" required lay-verify="required"  value=${userSignature} autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">确认修改</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<%@include file="footer.jsp"%>
</body>

</html>
