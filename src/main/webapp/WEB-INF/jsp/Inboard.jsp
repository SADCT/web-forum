<%--
  Created by IntelliJ IDEA.
  User: Maxci
  Date: 2018/7/19
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<link rel="stylesheet" href="../../statics/css/board.css">
<script src="../../statics/layui.js"></script>
<!-- 引入 Bootstrap -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- 包括所有已编译的插件 -->
<script src="../../statics/js/bootstrap.min.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
</body>

<html>
<head>
    <title>帖子列表</title>
</head>
<body>
<%@include file="header.jsp"%>
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

    <div class="layui-tab">
        <ul class="layui-tab-title">

            <li class="layui-this tab1" >帖子总览</li>
            <li  id="tab2">社区讨论</li>
            <li  id="tab3">攻略分享</li>
            <li  id="tab4">组队交友</li>
            <li  id="tab5">比赛资讯</li>
        </ul>
        <div class="layui-tab-content" >
            <div class="layui-tab-item layui-show"  >
                <table class="table table-hover">
                    <caption>帖子列表总览</caption>
                    <thead>
                    <tr>
                        <th width="60%">主题</th>
                        <th width="10%">作者</th>
                        <th width="10%">回复</th>
                        <th width="20%">最后发表</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list0}" var="list0">
                        <tr>
                            <td><a href="/article/${list0.topicId}"style="color: #2b52a7">${list0.topicTitle}</a>&nbsp;&nbsp;
                                <c:if test="${list0.digest==1}">
                                    <span class="layui-badge">精</span>
                                </c:if>
                            </td>
                            <td>${list0.userName}
                                <br/>
                                <div style="font-size: 10px;color: gray">-<fmt:formatDate value="${list0.createTime}" type="date"/></div>
                            </td>
                            <td>${list0.topicReplies}</td>
                            <td><fmt:formatDate value="${list0.lastPost}" type="both" dateStyle="medium" timeStyle="medium"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="layui-tab-item "  >
                <table class="table table-hover">
                    <caption>帖子列表1</caption>
                    <thead>
                    <tr>
                        <th width="60%">主题</th>
                        <th width="10%">作者</th>
                        <th width="10%">回复</th>
                        <th width="20%">最后发表</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list1}" var="list1">
                        <tr>
                            <td><a href="/article/${list1.topicId}"style="color: #2b52a7">${list1.topicTitle}</a>&nbsp;&nbsp;
                                <c:if test="${list1.digest==1}">
                                    <span class="layui-badge">精</span>
                                </c:if>
                            </td>
                            <td>${list1.userName}
                                <br/>
                                <div style="font-size: 10px;color: gray">-<fmt:formatDate value="${list1.createTime}" type="date"/></div>
                            </td>
                            <td>${list1.topicReplies}</td>
                            <td><fmt:formatDate value="${list1.lastPost}" type="both" dateStyle="medium" timeStyle="medium"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="layui-tab-item ">
                <table class="table table-hover" >
                <caption>帖子列表2</caption>
                <thead>
                <tr>
                    <th width="60%">主题</th>
                    <th width="10%">作者</th>
                    <th width="10%">回复</th>
                    <th width="20%">最后发表</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list2}" var="list2">
                    <tr>
                        <td><a href="/article/${list2.topicId}"style="color: #2b52a7">${list2.topicTitle}</a>&nbsp;&nbsp;
                            <c:if test="${list2.digest==1}">
                                <span class="layui-badge">精</span>
                            </c:if>
                        </td>
                        <td>${list2.userName}
                            <br/>
                            <div style="font-size: 10px;color: gray">-<fmt:formatDate value="${list2.createTime}" type="date"/></div>
                        </td>
                        <td>${list2.topicReplies}</td>
                        <td><fmt:formatDate value="${list2.lastPost}" type="both" dateStyle="medium" timeStyle="medium"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            </div>

            <div class="layui-tab-item ">
                <table class="table table-hover" >
                <caption>帖子列表3</caption>
                <thead>
                <tr>
                    <th width="60%">主题</th>
                    <th width="10%">作者</th>
                    <th width="10%">回复</th>
                    <th width="20%">最后发表</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list3}" var="list3">
                    <tr>
                        <td><a href="/article/${list3.topicId}"style="color: #2b52a7">${list3.topicTitle}</a>&nbsp;&nbsp;
                            <c:if test="${list3.digest==1}">
                                <span class="layui-badge">精</span>
                            </c:if>
                        </td>
                        <td>${list3.userName}
                            <br/>
                            <div style="font-size: 10px;color: gray">-<fmt:formatDate value="${list3.createTime}" type="date"/></div>
                        </td>
                        <td>${list3.topicReplies}</td>
                        <td><fmt:formatDate value="${list3.lastPost}" type="both" dateStyle="medium" timeStyle="medium"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            </div>

            <div class="layui-tab-item">
                <table class="table table-hover" >
                <caption>帖子列表4</caption>
                <thead>
                <tr>
                    <th width="60%">主题</th>
                    <th width="10%">作者</th>
                    <th width="10%">回复</th>
                    <th width="20%">最后发表</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list4}" var="list4">
                    <tr>
                        <td><a href="/article/${list4.topicId}"style="color: #2b52a7">${list4.topicTitle}</a>&nbsp;&nbsp;
                            <c:if test="${list4.digest==1}">
                                <span class="layui-badge">精</span>
                            </c:if>
                        </td>
                        <td>${list4.userName}
                            <br/>
                            <div style="font-size: 10px;color: gray">-<fmt:formatDate value="${list4.createTime}" type="date"/></div>
                        </td>
                        <td>${list4.topicReplies}</td>
                        <td><fmt:formatDate value="${list4.lastPost}" type="both" dateStyle="medium" timeStyle="medium"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            </div>

        </div>

    </div>


</div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>

<script>
    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    layui.use(['element','jquery'], function(){
        var element = layui.element;

    });

</script>
<script>
$(".layui-tab-title li").click(function(){
var picTabNum = $(this).index();
sessionStorage.setItem("picTabNum",picTabNum);
});
$(function(){
var getPicTabNum = sessionStorage.getItem("picTabNum");
$(".layui-tab-title li").eq(getPicTabNum).addClass("layui-this").siblings().removeClass("layui-this");
$(".layui-tab-content>div").eq(getPicTabNum).addClass("layui-show").siblings().removeClass("layui-show");
})
</script>

</html>
