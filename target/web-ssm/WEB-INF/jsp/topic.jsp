<%--
  Created by IntelliJ IDEA.
  User: Maxci
  Date: 2018/7/10
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<script src="../../statics/layui.js"></script>
<html>
<head>
    <title>${host.topicTitle}</title>
</head>
<body>
<%@include file="header.jsp"%>

<div class="layui-container">
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
    <div style="height: 20px"></div>

    <div class="layui-row layui-col-space10" style="height: 400px">
        <div class="layui-col-md3">
            <fieldset class="layui-elem-field">
                <div class="layui-field-box" style="height: 500px;background-color: white">
                    主题
                    <br/>
                    <br/>
                    <br/>
                    <div>
                        用户名：${hostName}
                    </div>
                    <br/>
                    <br/>
                    <br/>

                </div>
            </fieldset>
        </div>
        <div class="layui-col-md9">
            <fieldset class="layui-elem-field">
                <div class="layui-field-box" style="min-height: 500px;background-color: white">
                    <p style="font-size: 20px">${host.topicTitle}
<c:if test="${host.digest==1}">&nbsp;&nbsp;<span class="layui-badge">精</span>
</c:if>
                    </p>
                    <br/>
                    <blockquote class="layui-elem-quote layui-quote-nm">发表于：<fmt:formatDate value="${host.createTime}" type="both" dateStyle="medium" timeStyle="medium"/> <div style="float: right">浏览数：${host.topicViews}</div></blockquote>
                    &nbsp;&nbsp;  ${hostText}
                </div>

            </fieldset>
        </div>
    </div>
<c:forEach items="${pageInfo.list}" var="p">
    <div class="layui-row layui-col-space10" style="min-height: 300px">
        <div class="layui-col-md3">
            <fieldset class="layui-elem-field">
                <div class="layui-field-box" style="min-height: 300px;background-color: white">
                    回复
                    <br/>
                    <br/>
                    <br/>
                    <div>
                        用户名：${p.postTitle}
                    </div>
                    <br/>
                    <br/>
                    <br/>

                </div>
            </fieldset>
        </div>
        <div class="layui-col-md9">
            <fieldset class="layui-elem-field">
                <div class="layui-field-box" style="min-height: 300px;background-color: white">
                    <blockquote class="layui-elem-quote layui-quote-nm">回复于：<fmt:formatDate value="${p.createTime}" type="both" dateStyle="medium" timeStyle="medium"/> </blockquote>
                       &nbsp;&nbsp; ${p.postText}
                    <c:if test="${host.userId==user.userId}">
                        <form action="/deletePost" method="post" style="position:absolute;right:0px;bottom:25px;width:50px;">
                            <input type="hidden" name="_method" value="DELETE">
                            <input type="hidden" name="postId"value="${p.postId}">
                            <input type="hidden" name="topicId" value="${host.topicId}">
                            <input type="submit" class="layui-btn-xs layui-btn" value="删除">
                        </form>
                    </c:if>
                </div>
            </fieldset>
        </div>
    </div>
</c:forEach>
    <div style="float: right;height: 40px">
        <p>第${pageInfo.pageNum}页,共${pageInfo.pages}页</p>
        <c:if test="${pageInfo.hasPreviousPage}">
            <a href="/article/${host.topicId}?page=${pageInfo.prePage}">上一页<i class="layui-icon layui-icon-prev" style="font-size: 15px; color: #39ac47;"></i></a>
        </c:if>
        &nbsp;
        <c:if test="${pageInfo.hasNextPage}">
            <a href="/article/${host.topicId}?page=${pageInfo.nextPage}">下一页<i class="layui-icon layui-icon-next" style="font-size: 15px; color: #39ac47;"></i></a>
        </c:if>
    </div>
    <div class="layui-row layui-col-space10" style="width: 800px">
        <textarea id="demo" style="display: none;"></textarea>
        <button onclick="rE()" class="layui-btn" style="float: right">回帖</button>
    </div>
</div>
<%@include file="footer.jsp"%>
<script>
    var index;
    layui.use('layedit', function(){
        var layedit = layui.layedit;
        index=layedit.build('demo',{height: 180}); //建立编辑器
    });

    function rE() {
        var text;
        layui.use('layedit', function(){
            var layedit = layui.layedit;
            text=layedit.getContent(index);
        });
        if (${!empty user}) {
            layui.use(['jquery', 'layer'], function(){
                var ds = {};
                ds.boardId='${host.boardId}';
                ds.topicId='${host.topicId}';
                ds.userId='${user.userId}';
                ds.postText=text;
                ds.postType=0;
                var $ = layui.$ //重点处
                    ,layer = layui.layer;
                $.ajax({
                    type:'put',
                    url:'/postText',
                    contentType:'application/json',
                    //数据格式是json串,商品信息
                    data:JSON.stringify(ds),
                    success:function(data){//返回json结果
                        location.reload();
                    }
                });
                });

        }else {
            layer.msg("请先登录！");
        }
    }
</script>
</body>
</html>
