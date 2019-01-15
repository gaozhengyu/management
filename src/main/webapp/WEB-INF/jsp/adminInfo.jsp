<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>软件学院毕业实训管理系统</title>

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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<input type="hidden" id="hidden1" value="${teacher.teacherid}">

<div id="wrapper">

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
                <h1 class="page-header">个人信息</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        修改完成后请保存
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-7">
                                <form id="teacherInfo">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label h5"><strong>工号</strong></label>
                                            <div class="col-sm-6">
                                                <input type="text" id="teacherID" name="teacherID" class="form-control"
                                                       value="${teacher.teacherid}" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label h5"><strong>姓名</strong></label>
                                            <div class="col-sm-6">
                                                <input id="teacherName" class="form-control" name="teacherName"
                                                       value="${teacher.teachername}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label h5"><strong>性别</strong></label>
                                            <div class="col-sm-6">
                                                <select id="teacherSex" class="form-control" name="teacherSex">
                                                    <option value="男">男</option>
                                                    <option value="女">女</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label h5"><strong>邮箱</strong></label>
                                            <div class="col-sm-6">
                                                <input id="teacherEmail" name="teacherEmail" class="form-control"
                                                       value="${teacher.teacheremail}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label h5"><strong>联系方式</strong></label>
                                            <div class="col-sm-6">
                                                <input id="teacherPhone" name="teacherPhone" class="form-control"
                                                       value="${teacher.teacherphone}">
                                            </div>
                                        </div>
                                        <button id="save" style="margin-left: 10%" type="button" onclick="updateInfo()"
                                                class="btn btn-success">保存
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script type="text/javascript" src="../vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script type="text/javascript" src="../vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script type="text/javascript" src="../vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script type="text/javascript" src="../dist/js/sb-admin-2.js"></script>

<script type="text/javascript" src="../dist/js/bootstrapValidator.js"></script>

<script type="text/javascript" src="../js/dataVerify.js"></script>

</body>
<script>
    $(function () {
        $("#teacherSex option[value=${teacher.teachersex}]").attr("selected", "selected");
    });

    function updateInfo() {
        $.ajax({
            async: false,
            type: "post",
            url: '${pageContext.request.contextPath}/teacher/updateTeacherInfo',
//            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            data: $("#teacherInfo").serialize(),
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
</script>

</html>
