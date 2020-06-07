<%--
  Created by IntelliJ IDEA.
  User: Maxci
  Date: 2018/7/30
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 引入 Bootstrap -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- 包括所有已编译的插件 -->
<script src="../../statics/js/bootstrap.min.js"></script>
<script src="../../statics/layui.js"></script>
<style>
    .fly-panel {
        margin-bottom: 15px;
        border-radius: 2px;
        background-color: #fff;
        box-shadow: 0px 1px 2px 0px rgba(0,0,0,0.05);
    }
    .fly-panel-title {
        position: relative;
        height: 50px;
        line-height: 50px;
        padding: 0 15px;
        border-bottom: 1px dotted #E9E9E9;
        color: #333;
        border-radius: 2px 2px 0 0;
        font-size: 14px;
    }
    .fly-home-jie .jie-row, .fly-home-da .home-jieda {
        min-height: 500px;
        padding: 5px 20px;
    }
    .home-jieda li {
        margin-bottom: 20px;
        line-height: 24px;
    }
    .home-jieda li p {
        color: #999;
    }
    .home-jieda li a {
        padding: 0 5px;
        color: #4f99cf;
    }
    .home-dacontent {
        margin-top: 10px;
        padding: 10px 15px;
        background-color: #f2f2f5;
        border-radius: 5px;
        word-wrap: break-word;
    : ;
    }
    .jie-row li .jie-title {
        max-width: 70%;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }


</style>
<html>
<head>
    <title>${user.userName}的资料</title>
</head>
<body>
<%@include file="header.jsp"%>
<div style="
    position: relative;
    padding: 30px 0 30px;
    text-align: center;
    margin-bottom: 15px;
    border-radius: 2px;
    background-color: #fff;
    box-shadow: 0px 1px 2px 0px rgba(0,0,0,0.05);
">
        <img id="img" src="/userPic/pic.jpg" alt="aa" style="width: 120px;height: 120px;border-radius: 100%">
        <br/>
    <h1>${username}</h1>
    <c:if test="${info.sex=='男'}">
        <i class="layui-icon">&#xe662;</i>
    </c:if>
    <c:if test="${info.sex=='女'}">
        <i class="layui-icon">&#xe661;
        </i>
    </c:if>
    <i></i>
    <br/>
    <br/>
    <span>加入时间:<fmt:formatDate value="${info.signTime}" type="date"/></span>
    <br/>
    <p style="
    padding: 0 10px;
    color: #999;
    margin-top: 10px;
">${info.userSignature}</p>
    <br/>
        <button type="button" class="layui-btn" id="up">
            <i class="layui-icon">&#xe67c;</i>更改头像
        </button>
        <br/>
</div>
<div class="layui-container"style="height: 800px;width: 700px">
    <table class="table table-striped" >
        <caption>${username}最近的发帖</caption>
        <thead>
        </thead>
        <tbody>
        <c:forEach items="${topicInfo}" var="t">
            <tr>
                <td style="font-size: 15px">
                    <c:if test="${t.digest==1}">
                       <span class="layui-badge">精</span> &nbsp;&nbsp;
                    </c:if>
                    <a href="/article/${t.topicId}">${t.topicTitle}</a>
                    &nbsp;&nbsp;
                    <i style="font-size: 12px;color: gray">-<fmt:formatDate value="${t.createTime}" type="date"/></i>
                    <div style="float: right">${t.topicReplies}</div>

                </td>


            </tr>
        </c:forEach>


        </tbody>
    </table>
</div>
<script>

    layui.use(['jquery','upload'], function(){
        var $ = layui.$;
        var upload = layui.upload;
        if (${!empty info.imagePath}) {
            $("#img").attr("src"," ${info.imagePath}");
        }

        if (${user.userId!=info.userId}) {
            $("#up").hide();
        }
        //执行实例
        var uploadInst = upload.render({
            elem: '#up' //绑定元素
            ,url: '/upload/usericon/' //上传接口
            ,done: function(res){
                $("#img").attr("src",res.path);
            }
            ,error: function(){
                layer.msg("上传失败");
            }
            ,accept:'images'
            ,size:500
            ,number:1
            ,data: {
                id: '${user.userId}'
            }
        });
    });
</script>
<%@include file="footer.jsp"%>
</body>
</html>
