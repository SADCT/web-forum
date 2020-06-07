<%--
  Created by IntelliJ IDEA.
  User: Maxci
  Date: 2018/7/4
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<link rel="stylesheet" href="../../statics/css/homepage.css">
<!-- 引入 Bootstrap -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- 包括所有已编译的插件 -->
<script src="../../statics/js/bootstrap.min.js"></script>
<script src="../../statics/layui.js"></script>
<html>
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
<head>
    <title>欢迎来到WeGet论坛!</title>
</head>
<body>
<%@include file="header.jsp"%>
<div id="container">
    <div class="search bar6">
        <form>
            <input type="text" placeholder="请输入您要搜索的内容...">
            <button type="submit"></button>
        </form>
    </div>
</div>
<div class="layui-container">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
        <legend>精彩活动</legend>
    </fieldset>

    <div class="layui-carousel" style=" margin: 0 auto;width: 100%" id="test1" lay-filter="test2">
        <div carousel-item="">
            <div><img src="/userPic/bcd38d1125e286b22f1179c605b47303.jpeg"></div>
            <div><img src="/userPic/7a2b08896b0a0868e2749244cba9adea.jpeg"></div>
            <div><img src="/userPic/159099401531618.jpg"></div>
            <div><img src="/userPic/47a47bfe30821e806717665261d4d789.jpeg"></div>
            <div><img src="/userPic/e7134c772844b738503fab853db4dfb81586329298.jpg"></div>
        </div>
    </div>

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
    <div class="layui-row layui-col-space10" style="height: 1200px">
        <div class="layui-col-md9">
            <div class="grid-demo grid-demo-bg1">
                <fieldset class="layui-elem-field" style="height: 580px;">
                    <legend>近期热帖</legend>
                    <table class="table table-striped" style="background-color: white" >
                        <tbody>
                        <c:forEach items="${hotList}" var="t">
                            <tr>
                                <td style="font-size: 15px">
                                    <c:if test="${t.digest==1}">
                                        <span class="layui-badge">精</span> &nbsp;&nbsp;
                                    </c:if>
                                    <a href="/article/${t.topicId}">${t.topicTitle}</a>
                                    &nbsp;&nbsp;
                                    <i style="font-size: 12px;color: gray">-<fmt:formatDate value="${t.createTime}" type="date"/></i>
                                    <div style="float: right">${t.topicViews}</div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </fieldset>
            </div>
            <div class="grid-demo grid-demo-bg1">
                <fieldset class="layui-elem-field" style="height: 580px;">
                    <legend>新贴榜</legend>
                    <table class="table table-striped" style="background-color: white" >
                        <tbody>
                        <c:forEach items="${newList}" var="t">
                            <tr>
                                <td style="font-size: 15px">
                                    <c:if test="${t.digest==1}">
                                        <span class="layui-badge">精</span> &nbsp;&nbsp;
                                    </c:if>
                                    <a href="/article/${t.topicId}">${t.topicTitle}</a>
                                    &nbsp;&nbsp;
                                    <i style="font-size: 12px;color: gray">-<fmt:formatDate value="${t.createTime}" type="date"/></i>
                                    <div style="float: right">${t.topicViews}</div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </fieldset>
            </div>
        </div>
        <div class="layui-col-md3">
            <div class="grid-demo">
                <fieldset class="layui-elem-field" >
                    <legend>我的论坛</legend>
                    <div class="layui-field-box"style="height: 300px">
                        <div style=" position: relative;text-align: center;  margin-bottom: 15px; border-radius: 2px; box-shadow: 0px 1px 2px 0px rgba(0,0,0,0.05);">
                        <img id="img" src="/userPic/pic.jpg" alt="aa" style="width: 130px;height: 130px;border-radius: 100%">
                        <br/>
                        <h1>${user.userName}</h1>
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
                    </div>
            </div>
                </fieldset>
            </div>
            <br/>
            <button id="new" class="layui-btn  layui-btn-fluid">
                <i class="layui-icon">&#xe608;</i> 发帖
            </button>
            <br/>
            <br/>
            <br/>
            <div class="grid-demo">
                <fieldset class="layui-elem-field" >
                    <legend>论坛用户</legend>
                    <div class="layui-field-box"style="height: 300px">
                        <c:forEach items="${recentUser}" var="r">
                            <div style="width: 60px ;height: 70px;float: left ;margin-right: 15px ;margin-bottom: 15px">
                                <img src="${r.imagePath}" onerror=this.src="/userPic/pic.jpg" style="width: 65px; height: 65px" >
                                <a align="center" href="/user/detail/${r.userId}"><p align="center">${r.userName}</p></a>
                            </div>
                        </c:forEach>
                    </div>
                </fieldset>
            </div>

            <div class="grid-demo">
                <fieldset class="layui-elem-field" >
                    <legend>论坛公告</legend>
                    <div class="layui-field-box"style="height: 300px">
                        公告是行政公文的主要文种之一，它和通告都属于发布范围广泛的晓谕性文种。公告是向国内外宣布重要事项或者法定事项时使用的公文。适用于向国内外宣布重要事项或者法定事项。
                        公告是用于向国内外宣布重要事项或者法定事项的公文。公告主要有两种，一是宣布重要事项，如最近中国将在东海进行地对地导弹发射训练；二是宣布法定事项，如宣布某项法规或规章，宣布国家领导人选举结果。


                    </div>
                </fieldset>
            </div>
        </div>
    </div>

</div>
<%@include file="footer.jsp"%>
</body>
<script>
    layui.use(['jquery', 'layer'], function(){
        var $ = layui.$ //重点处
            ,layer = layui.layer;
        $(document).ready(function(){
            $("#new").click(function () {
                if (${empty user}){
                    layer.msg("请先登录！");
                }else {
                    window.location.href="/addTopic";
                }
            });
        })
    })
</script>
<script>


    layui.use(['carousel', 'form'], function(){
        var carousel = layui.carousel
            ,form = layui.form;


        //图片轮播
        carousel.render({
            elem: '#test1'
            ,width: '90%'
            ,height: '320px'
            ,interval: 3000
        });

        //事件
        carousel.on('change(test2)', function(res){
            console.log(res)
        });

        var $ = layui.$, active = {
            set: function(othis){
                var THIS = 'layui-bg-normal'
                    ,key = othis.data('key')
                    ,options = {};

                othis.css('background-color', '#5FB878').siblings().removeAttr('style');
                options[key] = othis.data('value');
                ins3.reload(options);
            }
        };

        //监听开关
        form.on('switch(autoplay)', function(){
            ins3.reload({
                autoplay: this.checked
            });
        });

        $('.demoSet').on('keyup', function(){
            var value = this.value
                ,options = {};
            if(!/^\d+$/.test(value)) return;

            options[this.name] = value;
            ins3.reload(options);
        });

        //其它示例
        $('.demoTest .layui-btn').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
    });


</script>
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
</html>
