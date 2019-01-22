<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>软件学院实训管理系统</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">

    <!-- MetisMenu CSS -->
    <link rel="stylesheet" type="text/css" href="../vendor/metisMenu/metisMenu.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="../dist/css/sb-admin-2.css">

    <!-- Custom Fonts -->
    <link rel="stylesheet" type="text/css" href="../vendor/font-awesome/css/font-awesome.min.css">

    <link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="../dist/css/bootstrapValidator.css">

    <link rel="stylesheet" type="text/css" href="../vendor/css/datatablestyle.css">
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<style>
    .dataTable {
        text-align: center;
    }

    .table th { /*数据表格标题文字居中*/
        text-align: center;
        vertical-align: middle !important;
    }
</style>
<body>

<div id="wrapper">
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">软件学院毕业实训管理系统</a>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <li>
                <a href="${pageContext.request.contextPath}/userLogin/logout">
                    <i class="fa fa-sign-out fa-fw"></i>
                    注销
                </a>
            </li>
        </ul>
        <!-- /.navbar-header -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/findAdminInfo?teacherID=${teacher.teacherid}">
                            个人信息</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 指导教师信息管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllTeacherInfo?type=1&teacherID=${teacher.teacherid}">
                                    指导教师信息维护</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllTeacherInfo?type=2&teacherID=${teacher.teacherid}">
                                    指导教师信息添加</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 学生信息管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllStudentInfo?type=1&teacherID=${teacher.teacherid}">
                                    学生信息维护</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllStudentInfo?type=2&teacherID=${teacher.teacherid}">
                                    学生信息添加</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 公司信息管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllCompanyInfo?type=1&teacherID=${teacher.teacherid}">
                                    公司信息维护</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllCompanyInfo?type=2&teacherID=${teacher.teacherid}">
                                    公司信息添加</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/findAllClass?teacherID=${teacher.teacherid}">
                            班级信息管理</a>
                    </li>
                    <li>
                        <a href="#"> 实训过程管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllCompanyInfo?type=3&teacherID=${teacher.teacherid}">
                                    公司授权</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllStudentInfo?type=3&teacherID=${teacher.teacherid}">
                                    分配教师</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/setEndTime?teacherID=${teacher.teacherid}">
                                    时间管理</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/tongji?teacherID=${teacher.teacherid}"> 统计</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getAdminPassword?teacherID=${teacher.teacherid}">
                            密码修改</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">学生信息管理</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        学生信息列表
                    </div>
                    <div class="panel-body">
                        <button class="btn btn-success" style="margin-bottom: 1%" data-toggle="modal" data-target="#importPanel">导入</button>
                        <button class="btn btn-success" style="margin-bottom: 1%" data-toggle="modal" data-target="#addPanel">添加学生</button>
                        <table width="100%" class="table table-striped table-bordered table-hover"
                               id="dataTables-example">
                            <thead>
                            <tr>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>班级</th>
                                <th>联系方式</th>
                                <th>邮箱</th>
                                <th>家长联系方式</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="importPanel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">导入</h4>
            </div>
            <div class="modal-body">
                <form id="excelImport" name="form1"
                      action="${pageContext.request.contextPath}/excelWork/excelImport?type=student"
                      method="post" enctype="multipart/form-data" target="message">
                    请选择文件:<input type="file" name="excelFile"><br/>
                    <input type="submit" class="btn btn-success" value="导入" onclick="upload()">
                </form>
                <a href="${pageContext.request.contextPath}/excelWork/downloadMuban?type=student">下载模板</a>
                <iframe name="message" style="display: none"></iframe>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addPanel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加学生</h4>
            </div>
            <div class="modal-body">
                <div class="alert" style="color:red; display: none">
                    信息填写错误。
                </div>
                <div class="row">
                    <form id="studentInfo">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label h5">学号</label>
                                <div class="col-sm-6">
                                    <input type="text" id="studentID" name="studentID" class="form-control">
                                </div>
                                <div style="color: red"><strong>*</strong></div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label h5">姓名</label>
                                <div class="col-sm-6">
                                    <input type="text" id="studentName" name="studentName" class="form-control">
                                </div>
                                <div style="color: red"><strong>*</strong></div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label h5">性别</label>
                                <div class="col-sm-6">
                                    <select id="studentSex" name="studentSex" class="form-control">
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label h5">班级</label>
                                <div class="col-sm-6">
                                    <input type="text" id="classID" name="classID" class="form-control">
                                </div>
                                <div style="color: red"><strong>*</strong></div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label h5">联系方式</label>
                                <div class="col-sm-6">
                                    <input type="text" id="studentPhone" name="studentPhone" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label h5">邮箱</label>
                                <div class="col-sm-6">
                                    <input type="text" id="studentEmail" name="studentEmail" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label h5">家长联系方式</label>
                                <div class="col-sm-6">
                                    <input type="text" id="parentsPhone" name="parentsPhone" class="form-control">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="saveStudent()">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="../vendor/jquery/jquery.min.js"></script>

<script type="text/javascript" src="../vendor/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../vendor/metisMenu/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script type="text/javascript" src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

<!-- Custom Theme JavaScript -->
<script type="text/javascript" src="../dist/js/sb-admin-2.js"></script>

<script type="text/javascript" src="../dist/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="../js/dataVerify.js"></script>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>

    function upload() {
        $("#excelImport").submit();
        var t = setInterval(function () {
            //获取iframe标签里body元素里的文字。即服务器响应过来的"上传成功"或"上传失败"
            var word = $("iframe[name='message']").contents().find("body").text();
            if (word != "" && word == 'success') {
                alert("上传成功");        //弹窗提示是否上传成功
                clearInterval(t);   //清除定时器
                location.reload();
            }
        }, 1000);
    }

    $(document).ready(function () {
        $('#dataTables-example').DataTable({
//            responsive: true,
            "bRetrieve": true,
            "autoWidth": true,
            data:${studentjson},
            //给列赋值，这里的列名需要和data的数据名对应
            "columns": [
                {"data": "StudentID"},
                {"data": "StudentName"},
                {"data": "StudentSex"},
                {"data": "ClassID"},
                {"data": "StudentPhone"},
                {"data": "StudentEmail"},
                {"data": "ParentsPhone"}
            ],
            "oLanguage": { // 国际化配置
                "sProcessing": "正在获取数据，请稍后...",
                "sLengthMenu": "显示 _MENU_ 条",
                "sZeroRecords": "没有找到数据",
                "sInfo": "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
                "sInfoEmpty": "记录数为0",
                "sInfoFiltered": "(全部记录数 _MAX_ 条)",
                "sInfoPostFix": "",
                "sSearch": "关键字：",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "第一页",
                    "sPrevious": "上一页",
                    "sNext": "下一页",
                    "sLast": "最后一页"
                }
            }
        });
    });

    function saveStudent() {
        var studentID = $("#studentID").val();
        $.ajax({
            async: false,
            type: "post",
            url: '${pageContext.request.contextPath}/admin/checkInfo',
            data: {
                "type": "teacher",
                "checkID": studentID
            },
            dataType: "json",
            success: function (data) {
                if (data.success == false) {
                    $(".alert").text("该工号已存在");
                    $(".alert").show();
                } else {
                    $(".alert").hide();
                    $.ajax({
                        async: false,
                        type: "post",
                        url: "${pageContext.request.contextPath}/admin/saveStudent",
                        data: $("#studentInfo").serialize(),
                        dataType: "json",
                        success: function (data) {
                            if(data.success == true){
                                alert("添加成功");
                                location.reload();
                            }
                        },
                        error:function(){
                            alert("添加失败");
                        }
                    });
                }
            },
            error: function () {
                alert("异常！");
            }
        });
    }
</script>

</body>

</html>
