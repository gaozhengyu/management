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
<input type="hidden" id="hidden1" value="${student.studentid}">

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
                        <a href=""> 个人信息</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/student/findStudentDirection?studentID=${student.studentid}"> 去向申报</a>
                    </li>
                    <%--<li>--%>
                        <%--<a href="${pageContext.request.contextPath}/student/findAllTeacher?studentID=${student.studentid}"> 指导教师信息查看</a>--%>
                    <%--</li>--%>
                    <li>
                        <a href="${pageContext.request.contextPath}/company/findAllCompany?studentID=${student.studentid}"> 公司信息查看</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/student/getStudentFileInfo?studentID=${student.studentid}"> 提交文件</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/student/findStudentResult?studentID=${student.studentid}"> 成绩查看</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/student/getStudentSubject?studentID=${student.studentid}"> 实训题目</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/student/getStudentPassword?studentID=${student.studentid}"> 密码修改</a>
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
                                    <label class="col-sm-2 control-label h5">学号</label>
                                    <div class="col-sm-6">
                                    <input id="studentID" class="form-control" value="${student.studentid}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label h5">姓名</label>
                                    <div class="col-sm-6">
                                    <input id="studentName" class="form-control" value="${student.studentname}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label h5">性别</label>
                                    <div class="col-sm-6">
                                    <input id="studentSex" class="form-control" value="${student.studentsex}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label h5">班级</label>
                                    <div class="col-sm-6">
                                    <input id="className" class="form-control" value="${className}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label h5">联系方式</label>
                                    <div class="col-sm-6">
                                    <input id="studentPhone" class="form-control" value="${student.studentphone}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label h5">邮箱</label>
                                    <div class="col-sm-6">
                                    <input id="studentEmail" class="form-control" value="${student.studentemail}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label h5">家长联系方式</label>
                                    <div class="col-sm-6">
                                    <input id="parentsPhone" class="form-control" value="${student.parentsphone}">
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
            var studentID = $("#studentID").val();
            var studentName = $("#studentName").val();
            var className = $("#className").val();
            var studentSex = $("#studentSex").val();
            var studentPhone = $("#studentPhone").val();
            var studentEmail = $("#studentEmail").val();
            var parentsPhone = $("#parentsPhone").val();
            $.post("${pageContext.request.contextPath}/student/updateStudentInfo",
                {
                    "studentID":studentID,
                    "studentName":studentName,
                    "className":className,
                    "studentSex":studentSex,
                    "studentPhone":studentPhone,
                    "studentEmail":studentEmail,
                    "parentsPhone":parentsPhone
                },
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
