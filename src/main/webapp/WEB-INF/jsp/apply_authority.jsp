<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/5/30
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<script src="../../statics/layui.js"></script>
<html>
<head>
    <title>权限申请</title>
</head>
<body>
<%@include file="header.jsp"%>

<div class="layui-container" style="height: 800px;">
    <form class="layui-form" action="/addAuthoritySuccess"  method="post" style="margin-top: 10%">
        <input type="hidden" name="userId" value="${user.userId}">
        <div class="layui-form-item">
            <label class="layui-form-label">申请权限</label>
                <div class="layui-input-block">
                    <input name="option" title="管理员" type="radio" checked="" value="administrator">
                </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">自我推荐</label>
            <div class="layui-input-block">
                <textarea class="layui-textarea" placeholder="请输入内容"  name="text"  value="${t.applicationReason}" ></textarea>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="submit" class="layui-btn" value="提交">
                <button class="layui-btn layui-btn-primary" type="reset">重置</button>
            </div>
        </div>


    </form>

</div>



<%@include file="footer.jsp"%>
</body>
<script>
    layui.use(['layer','jquery'],function () {
        var layer=layui.layer;
        var $=layui.$;
        $('#post').click(function(){
            var text = $('#applicationReason').val();
            var userId = $('#UserId').val();
            var flag = 0;
            $.ajax({
                type: "post",
                url: "/addAuthoritySuccess",      //你的controller地址
                data: {"applicationReason" :text , "UserId" :userId},
                dataType:"json",
                async:false,

                success: function (data) {
                    flag = data;
                }
            });
            switch (flag) {
                case 2:
                    return true;
                case 1:
                    layer.msg("无此用户！");
                    return false;
                case 0:
                    layer.msg("管理员无需申请！");
                    return false;

            }
        });
        });
</script>


<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });

        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>


</html>
