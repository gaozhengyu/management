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
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
        <!-- /.navbar-header -->

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
                        <a href=""> 个人信息</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/teacher/findAllStudent?teacherID=${teacher.teacherid}"> 学生信息查看</a>
                    </li>
                    <%--<li>--%>
                        <%--<a href="${pageContext.request.contextPath}/teacher/findStudentReport?teacherID=${teacher.teacherid}"> 周月报查看</a>--%>
                    <%--</li>--%>
                    <li>
                        <a href="${pageContext.request.contextPath}/teacher/getStudentResult?teacherID=${teacher.teacherid}"> 成绩录入</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/teacher/getStudentFileInfo?teacherID=${teacher.teacherid}"> 文件下载</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/teacher/getTeacherPassword?teacherID=${teacher.teacherid}"> 密码修改</a>
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">个人信息</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        修改完成后请保存
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label h5">工号</label>
                                    <div class="col-sm-6">
                                    <input id="teacherID" class="form-control" value="${teacher.teacherid}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label h5">姓名</label>
                                    <div class="col-sm-6">
                                    <input id="teacherName" class="form-control" value="${teacher.teachername}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label h5">性别</label>
                                    <div class="col-sm-6">
                                    <input id="teacherSex" class="form-control" value="${teacher.teachersex}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label h5">邮箱</label>
                                    <div class="col-sm-6">
                                    <input id="teacherEmail" class="form-control" value="${teacher.teacheremail}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label h5">联系方式</label>
                                    <div class="col-sm-6">
                                    <input id="teacherPhone" class="form-control" value="${teacher.teacherphone}">
                                    </div>
                                </div>
                                <button id="save" type="submit" style="margin-left: 10%" class="btn btn-success">保存</button>
                                </div>
                            </div>
                            <!-- /.col-lg-6 (nested) -->

                        </div>
                        <!-- /.row (nested) -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="../vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../dist/js/sb-admin-2.js"></script>

</body>
<script>
    $(function () {
        $("#save").click(function () {
            var teacherID = $("#teacherID").val();
            var teacherName = $("#teacherName").val();
            var teacherSex = $("#teacherSex").val();
            var teacherEmail = $("#teacherEmail").val();
            var teacherPhone = $("#teacherPhone").val();
            $.post("${pageContext.request.contextPath}/teacher/updateTeacherInfo",
                {"teacherID":teacherID,"teacherName":teacherName,"teacherSex":teacherSex,"teacherEmail":teacherEmail,"teacherPhone":teacherPhone},
                function (data) {
                    if(data.success == true){
                        alert("保存成功");
                        location.reload();
                    }
                }
            )
        })

    })

</script>

</html>
