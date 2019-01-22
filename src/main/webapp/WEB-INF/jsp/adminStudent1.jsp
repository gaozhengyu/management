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
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


    <link href="../vendor/css/datatablestyle.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="../dist/css/bootstrapValidator.css">

    <link rel="stylesheet" type="text/css" href="../vendor/css/datatablestyle.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
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
                        <button class="btn btn-success" style="margin-bottom: 1%"
                                onclick="window.location.href='${pageContext.request.contextPath}/excelWork/excelExport?type=student'">
                            导出
                        </button>
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
                                <th>操作</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="updatePanel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改信息</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <form id="studentInfo">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label h5">学号</label>
                                <div class="col-sm-6">
                                    <input type="text" id="studentID" name="studentID" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label h5">姓名</label>
                                <div class="col-sm-6">
                                    <input type="text" id="studentName" name="studentName" class="form-control">
                                </div>
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
                <button type="button" class="btn btn-success" onclick="updateInfo()">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="../vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../vendor/metisMenu/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../dist/js/sb-admin-2.js"></script>

<script type="text/javascript" src="../dist/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="../js/dataVerify.js"></script>

<script>
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
                {"data": "ParentsPhone"},
                {
                    "data": "StudentPassword",
                    "render": function (data, type, row, meta) {
                        return '<button class="btn btn-success" data-toggle="modal" data-target="#updatePanel" onclick="updatePanel('
                            + "'" + row.StudentID + "'" + ","
                            + "'" + row.StudentName + "'" + ","
                            + "'" + row.StudentSex + "'" + ","
                            + "'" + row.ClassID + "'" + ","
                            + "'" + row.StudentPhone + "'" + ","
                            + "'" + row.StudentEmail + "'" + ","
                            + "'" + row.ParentsPhone + "'"
                            + ')">修改</button>'
                            + "&nbsp;&nbsp;&nbsp;"
                            + '<button type="button" class="btn btn-success" onclick="resetPassword('
                            + "'" + row.StudentID + "'" + ')">重置密码</button>'
                            + "&nbsp;&nbsp;&nbsp;"
                            + '<button type="button" class="btn btn-success" onclick="deleteInfo('
                            + "'" + row.StudentID + "'" + ')">删除</button>';
                    }
                }
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

    function resetPassword(studentID) {
        $.post("${pageContext.request.contextPath}/admin/resetPassword",
            {"studentID": studentID},
            function (data) {
                if (data.success == true) {
                    alert("重置成功");
                    location.reload();
                }
            }
        )
    }

    function updatePanel(studentID, studentName, studentSex, classID, studentPhone, studentEmail, parentsPhone) {
        $("#studentID").val(studentID);
        $("#studentName").val(studentName);
        if (studentSex == null || studentSex == "") {
            studentSex = "男";
        }
        $("#studentSex").val(studentSex);
        $("#classID").val(classID);
        $("#studentPhone").val(studentPhone);
        $("#studentEmail").val(studentEmail);
        $("#parentsPhone").val(parentsPhone);
    }

    function updateInfo() {
        $.ajax({
            async: false,
            type: "post",
            url: '${pageContext.request.contextPath}/admin/updateStudent',
//            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            data: $("#studentInfo").serialize(),
            dataType: "json",
            success: function (data) {
                var data = data["success"];
                if (data == true) {
                    alert("修改成功");
                    location.reload();
                }
            },
            error: function () {
                alert("异常！");
            }
        });
    }

    function deleteInfo(studentID) {
        $.post("${pageContext.request.contextPath}/admin/deleteInfo",
            {
                "deleteID": studentID,
                "type": "student"
            },
            function (data) {
                if (data.success == true) {
                    alert("删除成功");
                    location.reload();
                }
            });
    }
</script>
</body>
</html>
