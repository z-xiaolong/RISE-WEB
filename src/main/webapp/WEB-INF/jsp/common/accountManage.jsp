<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>账户管理</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="/static/plugins/fonts/font-awesome-4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="/static/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/css/skins/_all-skins.min.css">

    <!-- local css start-->
    <link rel="stylesheet" href="/static/css/local/common.css">
    <link rel="stylesheet" href="/static/css/local/statement.css">
    <link rel="stylesheet" href="/static/plugins/datetimepicker/jquery.datetimepicker.css">
    <link rel="stylesheet" href="/static/css/local/staffmanagement.css">
    <link rel="stylesheet" href="/static/css/local/cashmanagement.css">
    <!-- local css end-->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery 2.2.0 -->
    <script src="/static/plugins/jQuery/jQuery-2.2.0.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/plugins/ajaxfileupload/ajaxfileupload.js"></script>
    <!-- DataTables -->
    <script src="/static/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="/static/plugins/datatables/dataTables.bootstrap.min.js"></script>

    <!-- AdminLTE App -->
    <script src="/static/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="/static/js/demo.js"></script>
    <!-- datepicker -->
    <script src="/static/plugins/datepicker/bootstrap-datepicker.js"></script>
    <script src="/static/plugins/datetimepicker/jquery.datetimepicker.full.js"></script>


</head>
<style type="text/css">
    table.dataTable thead > tr > th {
        box-sizing: border-box;
        padding: 1px;
        padding-top: 10px;
        padding-bottom: 10px;
    }

    .file {
        position: relative;
        display: inline-block;
        background: #3c8dbc;
        border: 1px solid #99D3F5;
        border-radius: 4px;
        width: 100px;
        height: 35px;
        color: #fff;
        text-decoration: none;
        text-indent: 0;
        line-height: 30px;
        text-align: center;
    }

    .file input {
        position: absolute;
        width: 100px;
        height: 35px;
        right: 0;
        top: 0;
        opacity: 0;
    }

    .text-center1 {
        text-align: center;
    }

    .file:hover {
        background: #AADFFD;
        border-color: #367fa9;
        color: #fff;
        text-decoration: none;
    }

    .table > tbody > tr > td {
        vertical-align: middle;
    }

    div.dataTables_paginate {
        margin-bottom: 50px;
    }

    #detailCabinet .col-sm-5 {
        width: 0px;
    }

    #detailCabinet .col-sm-7 {
        float: right;
    }

    #shoptype .col-sm-5 {
        width: 0px;
    }

    #shoptype .col-sm-7 {
        float: right;
    }

    #container {
        height: 400px;
        position: relative;
    }

    .shuru {
        color: #333;
        position: absolute;
        top: 10px;
        overflow: hidden;
        line-height: 20px;
    }

</style>

<body class="hold-transition skin-blue sidebar-mini">

<section class="content-header">
    <%--<div class="ctc_title">账号管理</div>--%>
    <ul class="typebox">
        <li class="active" flag="1" id="admin" onclick="adminManage();">管理员<span class="redcle"></span></li>
        <li class="" flag="2" id="teacher" onclick="teacherManage()">教师<span class="redcle"></span></li>
        <li class="" flag="3" id="student" onclick="studentManage()">学生<span class="redcle"></span></li>
    </ul>
    <div class="down_line"></div>

    <!--admin列表-->
    <div id="adminList">
        <div class="col-xs-12">
            <div class="box-header">
                <br/>
                <form class="form-inline">
                    <div class="form-group">
                        <label>状态:</label>
                        <select id="adminStatus" class="form-control">
                            <option value="">全部</option>
                            <option value="0">正常</option>
                            <option value="1">停用</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>查询：</label>
                        <input style="width: 250px;" class="form-control" type="text" id="adminSearch"
                               placeholder="输入账号名称/姓名、账号、搜索"/>
                    </div>

                    <div class="form-group">
                        <button type="button" onclick="searchAdmin();" class="btn btn-block btn-info ">搜索</button>
                    </div>

                    <span style=""></span>
                    <div class="form-group" style="float: right;">
                        <button type="button" onclick="addAdmin();" data-target="#addAdmin"
                                class="btn btn-block btn-info ">添加管理员
                        </button>
                    </div>
                </form>
            </div>
            <br/>
            <div class="bnsbox">
                <table id="adminConfigList" class="table table-bordered " style="width: 100%">
                    <thead>
                    <tr>
                        <th style="display: none;">id</th>
                        <th>账号</th>
                        <th>用户名</th>
                        <th>电话号码</th>
                        <th>邮箱</th>
                        <th>账号类型</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!--teacher列表-->
    <div id="teacherList" style="display:none">
        <div class="col-xs-12">
            <div class="box-header">
                <br/>
                <form class="form-inline">
                    <div class="form-group">
                        <label>状态:</label>
                        <select id="teacherStatus" class="form-control">
                            <option value="">全部</option>
                            <option value="0">正常</option>
                            <option value="1">停用</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>查询：</label>
                        <input style="width: 250px;" class="form-control" type="text" id="teacherSearch"
                               placeholder="输入账号名称/姓名、账号、搜索"/>
                    </div>

                    <div class="form-group">
                        <button type="button" onclick="searchTeacher();" class="btn btn-block btn-info ">搜索</button>
                    </div>

                    <span style=""></span>
                    <div class="form-group" style="float: right;">
                        <button type="button" onclick="addTeacher();" data-target="#addTeacher"
                                class="btn btn-block btn-info ">添加教师
                        </button>
                    </div>
                </form>
            </div>
            <br/>
            <div class="bnsbox">
                <table id="teacherConfigList" class="table table-bordered " style="width: 100%">
                    <thead>
                    <tr>
                        <th style="display: none;">id</th>
                        <th>账号</th>
                        <th>姓名</th>
                        <th>电话</th>
                        <th>邮箱</th>
                        <th>办公室</th>
                        <th>职位</th>
                        <th>状态</th>
                        <th>备注</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!--student列表-->
    <div id="studentList" style="display:none">
        <div class="col-xs-12">
            <div class="box-header">
                <br/>
                <form class="form-inline">
                    <div class="form-group">
                        <label>状态:</label>
                        <select id="studentStatus" class="form-control">
                            <option value="">全部</option>
                            <option value="0">正常</option>
                            <option value="1">停用</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>查询：</label>
                        <input style="width: 250px;" class="form-control" type="text" id="studentSearch"
                               placeholder="输入账号名称/姓名、账号、搜索"/>
                    </div>

                    <div class="form-group">
                        <button type="button" onclick="searchStudent();" class="btn btn-block btn-info ">搜索</button>
                    </div>

                    <span style=""></span>
                    <div class="form-group" style="float: right;">
                        <button type="button" onclick="addStudent();" data-target="#addStudent"
                                class="btn btn-block btn-info ">添加学生
                        </button>
                    </div>
                </form>
            </div>
            <br/>
            <div class="bnsbox">
                <table id="studentConfigList" class="table table-bordered " style="width: 100%">
                    <thead>
                    <tr>
                        <th style="display: none;">id</th>
                        <th>账号</th>
                        <th>姓名</th>
                        <th>学号</th>
                        <th>电话</th>
                        <th>邮箱</th>
                        <th>状态</th>
                        <th>备注</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 【添加管理员】弹出窗内容 -->
    <div class="modal" id="addAdmin" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" onclick="cancelAddAdmin();"><span
                            aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" align="center">添加管理员</h4>
                </div>
                <div class="modal-body" style="padding-right: 100px; padding-left: 100px;">
                    <table style="width: 100%">
                        <tr>
                            <td align="center" style="color: red">*账号：</td>
                            <td><input type="text" id="addAccount" class="form-control" placeholder="请输入账号"/></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td align="center" style="color: red; width: 20%;">*姓名：</td>
                            <td><input type="text" id="addUserName" maxlength="16" class="form-control"
                                       placeholder="请输入用户名"/></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td align="center" style="color: red">*电话：</td>
                            <td><input type="text" id="addPhone" class="form-control" placeholder="请输入手机号码(11位)"/></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td align="center" style="color: red">*邮箱：</td>
                            <td><input type="text" id="addEmail" class="form-control" placeholder="请输入邮箱"/></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td align="center" style="color: red">*类型：</td>
                            <td><input type="text" id="addType" class="form-control" placeholder="请输入账号类型"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><span id="accountExist" style="display: none;color: blue;">账号已存在</span></td>
                        </tr>
                    </table>
                    <br>
                    <div id="result" style="height:20px;color:red;text-align: center"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" onclick="cancelAddAdmin();" data-dismiss="modal">取消
                    </button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="confirmAddAdmin();">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 【编辑管理员】弹出窗内容 -->
    <div class="modal" id="editAdmin" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" align="center">编辑管理员</h4>
                </div>
                <div class="modal-body" style="padding-right: 100px; padding-left: 100px;">
                    <table style="width: 100%">
                        <tr>
                            <td align="center" style="color: red"> *账号：</td>
                            <td><input class="form-control" type="text" id="updateAccount" disabled="disabled"/></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" style="color: red"> *姓名：</td>
                            <td><input class="form-control" type="text" maxlength="16" id="updateUserName" placeholder="请输入..."/></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" style="color: red"> *电话：</td>
                            <td><input class="form-control" type="text" id="updatePhone" placeholder="请输入..."/></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" style="color: red"> *邮箱：</td>
                            <td><input class="form-control" type="text" id="updateEmail" placeholder="请输入..."/></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td align="center" style="color: red">*类型：</td>
                            <td><input type="text" id="updateType" class="form-control" placeholder="请输入..."/></td>
                        </tr>

                    </table>
                    <div id="editResult" style="height:20px;color:red;text-align: center"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="confirmEditAdmin();">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 【删除账户】弹出窗内容 -->
    <div class="modal" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" align="center">删除提示</h4>
                </div>
                <div class="modal-body">
                    <h4 align="center">是否删除此账户?</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="confirmDelete();">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 【停用】弹出窗内容 -->
    <div class="modal" id="disable" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" align="center">提示</h4>
                </div>
                <div class="modal-body">
                    <h4 align="center">确定停用？</h4>
                    <h5 align="center" style="color: gray;">停用后不可登录</h5>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="confirmDisable();">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 【启用】弹出窗内容 -->
    <div class="modal" id="enabledAdmin" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" align="center">提示</h4>
                </div>
                <div class="modal-body">
                    <h4 align="center">确定启用？</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="confirmEnabled();">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 【重置密码】弹出窗内容 -->
    <div class="modal" id="resetAdminPassword" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" align="center">提示</h4>
                </div>
                <div class="modal-body">
                    <h4 align="center">是否将密码重置为初始密码？</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="confirmResetAdminPassword();">确定</button>
                </div>
            </div>
        </div>
    </div>

</section>


<script type="text/javascript">
    $(document).ready(function () {
        //加载数据
        getAdminData();
    });
    var adminID;
    var keyword;
    //tab页切换
    $(".content-header ul li").click(function (e) {
        $this = $(e.target);
        $this.siblings().removeClass('active');//移除同级元素的选中状态
        $this.addClass("active");//元素的选中状态
    })


    function adminManage() {
        getAdminData();
        $("#adminList").show();
        $("#teacherList").hide();
        $("#studentList").hide();
    }

    function teacherManage() {
        $("#adminList").hide();
        $("#studentList").hide();
        getTeacherData();
        $("#teacherList").show();
    }

    function studentManage() {
        $("#adminList").hide();
        $("#teacherList").hide();
        getStudentData();
        $("#studentList").show();
    }

    function getTeacherData() {

    }

    function getStudentData() {

    }

    //加载Admin数据
    function getAdminData() {
        var Rstatus = 0;
        var table = $('#adminConfigList').DataTable({
            //"ScrollY": true,   //垂直新增滚动轴  ,无效
            //"ScrollX": true,   //水平新增滚动轴  ,无效
            "destroy": true,   //可以重新初始化，用于搜索
            "lengthChange": false,
            "ordering": false, //排序
            "info": true,		   //
            "autoWidth": true,   //宽度自动
            "paging": true,      //分页
            "searching": false,  //全局搜索关闭
            "processing": true,  //开启显示‘正在加载.../processing’
            "serverSide": true,    //true代表后台处理分页，false代表前台处理分页
            "ajax": {
                url: "${pageContext.request.contextPath}/accountManage/getAdminList",
                type: "POST",
                data: {
                    status: status,
                    keyword: keyword
                }
            },
            //参数显示
            "columns": [
                {"data": "id", 'sClass': "text-center", "bSortable": false, "visible": false},
                {"data": "account", 'sClass': "text-center", "searching": true},
                {"data": "userName", 'sClass': "text-center", "searching": true},
                {"data": "phone", 'sClass': "text-center", "searching": true},
                {"data": "email", 'sClass': "text-center", "searching": true},
                {"data": "type", 'sClass': "text-center", "searching": true},
                {
                    "data": "status", 'sClass': "text-center",
                    "render": function (data, type, full, meta) {
                        Rstatus = data;
                        str = "<span class='label label-success' style='padding-left:10px;padding-right:10px;padding-top: inherit;' >正常</span> ";
                        if (data == 0) {
                            str = "<span class='label label-danger' style='padding-left:10px;padding-right:10px;padding-top: inherit;'>停用</span>";
                        }
                        return str;
                    }
                },
                {
                    "data": "id", 'sClass': "text-center", 'width': '25%',
                    "render": function (data, type, full, meta) {
                        var str = "";
                        str += '<div class="btn-group">';
                        if (Rstatus == 0) {
                            str += '<button type="button" class="btn btn-sm btn-default" disabled="disabled">权限配置</button>';
                            str += '<button type="button" class="btn btn-sm btn-default" disabled="disabled">编辑</button>';
                            str += '<button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" disabled="disabled"> <span class="caret"></span><span class="sr-only">Toggle Dropdown</span></button>';
                            str += '<button type="button" class="btn btn-sm btn-default" onclick=enabled(' + data + ');>启用</button>';
                        } else if (Rstatus == 1) {
                            str += '<button type="button" class="btn btn-sm btn-default" onclick=editAuthConfig(' + data + ');>权限配置</button>';
                            str += '<button type="button" class="btn btn-sm btn-default" onclick=editAdmin(' + data + ');>编辑</button>';
                            str += '<button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <span class="caret"></span><span class="sr-only">Toggle Dropdown</span></button>';
                            str += '<ul class="dropdown-menu" role="menu">';
                            str += '<li><a href="#" onclick=resetAdminPassword(' + data + ');>重置密码</a></li>'
                            str += '</ul>'
                            str += '<button type="button" class="btn btn-sm btn-default" onclick=disable(' + data + ');>停用</button>';
                        }
                        str += '<button type="button" class="btn btn-sm btn-default btn-danger" onclick=deleteAdmin(' + data + ');>删除</button>';
                        str += '</div>';
                        //超级管理员无法操作
                        if (data == "1") {
                            str = '<button type="button" class="btn btn-sm btn-default" disabled="disabled">超管无法操作</button>';
                        }
                        return str;
                    }
                }
            ],
            //是否开启主题
            "bJQueryUI": true,
            "oLanguage": {    // 语言设置
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "抱歉， 没有找到",
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                "sZeroRecords": "没有检索到数据",
                "sSearch": "检索:",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                }
            }
        });
    }

    //取消添加管理员
    function cancelAddAdmin() {
        $("#addAccount").val("");
        $("#addUserName").val("");
        $("#addPhone").val("");
        $("#addEmail").val("");
        $("#addType").val("");
        $("#result").text("");
        $("#accountExist").hide();
    }

    //删除管理员
    function deleteAdmin(data) {
        adminID = data;
        $("#deleteModal").modal("toggle");
    }

    function confirmDelete() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/accountManage/deleteAdmin",
            async: true,//默认就是true
            dataType: "json",
            data: {adminID: adminID},
            error: function(XMLHttpRequest, textStatus, errorThrown){
                if(XMLHttpRequest.status == 200){
                    alert("很抱歉，你没有操作权限！");
                }else{
                    alert("操作失败，请联系管理员");
                }
            },
            success: function (result) {  //function1()
                if (result.Msg == "success") {
                    $("#deleteModal").modal("toggle");//弹窗消失
                    //加载数据
                    getAdminData();
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            failure: function (result) {
                alert('网络错误！');
            },
        });
    }


    //编辑管理员
    function editAdmin(data) {
        adminID = data;

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/accountManage/getAdminById",
            async: true,
            dataType: 'json',
            data: {adminID: adminID},
            error: function(XMLHttpRequest, textStatus, errorThrown){
                if(XMLHttpRequest.status == 200){
                    alert("很抱歉，你没有操作权限！");
                }else{
                    alert("操作失败，请联系管理员");
                }
            },
            success: function (data) {
                //回显基础信息
                console.log(data);
                if(data.admin == "null"){
                    alert("操作失败，请联系管理员")
                }else {
                    $("#updateAccount").val(data.admin.account);
                    $("#updateUserName").val(data.admin.userName);
                    $("#updatePhone").val(data.admin.phone);
                    $("#updateEmail").val(data.admin.email);
                    $("#updateType").val(data.admin.type);
                }

            }
        });
        $("#editAdmin").modal("toggle");
    }

    function confirmEditAdmin() {
        var updateAccount = $("#updateAccount").val();
        var updateUserName = $("#updateUserName").val();
        var updatePhone = $("#updatePhone").val();
        var updateEmail = $("#updateEmail").val();
        var updataType = $("#updateType").val();
        if (updateAccount == '') {
            $("#editResult").text("账号不能为空！");
            return;
        }
        if (updateUserName == '') {
            $("#editResult").text("用户名称不能为空！")
            return;
        }
        if (updatePhone == '') {
            $("#editResult").text("手机号不能为空！")
            return;
        }
        if (updateEmail == '') {
            $("#editResult").text("邮箱不能为空！")
            return;
        }
        if (updataType == '') {
            $("#editResult").text("账号类型不能为空！")
            return;
        }

        if (!(/^1[34578]\d{9}$/.test(updatePhone))) {
            $("#editResult").text("手机号码有误，请重填！");
            return;
        }
        $("#editResult").text("");
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/accountManage/updateAdminById",
            async: true,//默认就是true
            dataType: "json",
            data: {
                id: adminID,
                userName: updateUserName,
                account: updateAccount,
                phone:updatePhone,
                email:updateEmail,
                type:updataType
            },
            error: function(XMLHttpRequest, textStatus, errorThrown){
                if(XMLHttpRequest.status == 200){
                    alert("很抱歉，你没有操作权限！");
                }else{
                    alert("操作失败，请联系管理员");
                }
            },
            success: function (result) {  //function1()
                if (result.Msg == "success") {
                    $("#editAdmin").modal("toggle");//弹窗消失

                    $("#updateAccount").val("");
                    $("#updateUserName").val("");
                    $("#updatePhone").val("");
                    $("#updateEmail").val("");
                    $("#updateType").val("");
                    //加载数据
                    getAdminData();
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            failure: function (result) {
                alert('网络错误！');
            },
        });
    }

    //重置Admin密码
    function resetAdminPassword(data) {
        adminID = data;
        $("#resetAdminPassword").modal("toggle");
    }
    function confirmResetAdminPassword() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/accountManage/resetAdminPassword",
            async: true,//默认就是true
            dataType: "json",
            data: {adminID: adminID},
            error: function(XMLHttpRequest, textStatus, errorThrown){
                if(XMLHttpRequest.status == 200){
                    alert("很抱歉，你没有操作权限！");
                }else{
                    alert("操作失败，请联系管理员");
                }
            },
            success: function (result) {  //function1()
                if (result.Msg == "success") {
                    $("#resetAdminPassword").modal("toggle");//弹窗消失
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            failure: function (result) {
                alert('网络错误！');
            },
        });
    }

    function editAuthConfig(data) {
        alert(data);
    }

    function disable(data) {
        adminID = data;
        $("#disable").modal("toggle");
    }
    
    function confirmDisable() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/accountManage/disableAdmin",
            async: true,//默认就是true
            dataType: "json",
            data: {
                adminID: adminID
            },
            error: function(XMLHttpRequest, textStatus, errorThrown){
                if(XMLHttpRequest.status == 200){
                    alert("很抱歉，你没有操作权限！");
                }else{
                    alert("操作失败，请联系管理员");
                }
            },
            success: function (result) {  //function1()
                if (result.Msg == "success") {
                    $("#disable").modal("toggle");//弹窗消失
                    //加载数据
                    getAdminData();
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            failure: function (result) {
                alert('网络错误！');
            },
        });
    }

    function enabled(data) {
        adminID = data;
        $("#enabledAdmin").modal("toggle");
    }
    
    function confirmEnabled(data) {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/accountManage/enabledAdmin",
            async: true,//默认就是true
            dataType: "json",
            data: {
                adminID: adminID
            },
            error: function(XMLHttpRequest, textStatus, errorThrown){
                if(XMLHttpRequest.status == 200){
                    alert("很抱歉，你没有操作权限！");
                }else{
                    alert("操作失败，请联系管理员");
                }
            },
            success: function (result) {  //function1()
                if (result.Msg == "success") {
                    $("#enabledAdmin").modal("toggle");//弹窗消失
                    //加载数据
                    getAdminData();
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            failure: function (result) {
                alert('网络错误！');
            },
        });
    }

    //添加管理员
    function addAdmin() {
        $("#addAdmin").modal("toggle");
        $("#addAccount").val("");
        $("#addUserName").val("");
        $("#addPhone").val();
        $("#addEmail").val();
        $("#addType").val();
    }

    //确认添加管理员
    function confirmAddAdmin() {
        var addAccount = $("#addAccount").val();
        var addUserName = $("#addUserName").val();
        var addPhone = $("#addPhone").val();
        var addEmail = $("#addEmail").val();
        var addType = $("#addType").val();
        if (addAccount == '') {
            $("#result").text("账号不能为空！");
            return;
        }
        if (addUserName == '') {
            $("#result").text("用户名称不能为空！")
            return;
        }
        if (addPhone == '') {
            $("#result").text("手机号不能为空！")
            return;
        }
        if (addEmail == '') {
            $("#result").text("邮箱不能为空！")
            return;
        }
        if (addType == '') {
            $("#result").text("账号类型不能为空！")
            return;
        }

        if (!(/^1[34578]\d{9}$/.test(addPhone))) {
            $("#result").text("手机号码有误，请重填！");
            return;
        }

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/accountManage/addAdmin",
            async: true,//默认就是true
            dataType: "json",
            data: {
                account: addAccount,
                userName: addUserName,
                phone: addPhone,
                email: addEmail,
                type: addType
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (XMLHttpRequest.status == 200) {
                    alert("很抱歉，你没有操作权限！");
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            success: function (result) {  //function1()
                if (result.Msg == "success") {
                    $("#addAdmin").modal("toggle");
                    $("#addAccount").val("");
                    $("#addUserName").val("");
                    $("#addPhone").val("");
                    $("#addEmail").val("");
                    $("#addType").val("");
                    $("#result").text("");
                    $("#accountExist").hide();
                    //加载数据
                    getAdminData();
                } else if (result.Msg == "repeat") {
                    $("#accountExist").show();
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            failure: function (result) {
                alert('网络错误！');
            }
        });
    }


</script>
</body>

</html>