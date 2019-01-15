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
    <link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css"/>

    <!-- MetisMenu CSS -->
    <link rel="stylesheet" type="text/css" href="../vendor/metisMenu/metisMenu.min.css"/>

    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="../dist/css/sb-admin-2.css"/>

    <!-- Custom Fonts -->
    <link rel="stylesheet" type="text/css" href="../vendor/font-awesome/css/font-awesome.min.css"/>

    <link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="../dist/css/bootstrapValidator.css"/>

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
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/student/findStudentInfo?studentID=${student.studentid}">
                            个人信息</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/student/findStudentDirection?studentID=${student.studentid}">
                            去向申报</a>
                    </li>
                    <%--<li>--%>
                    <%--<a href="${pageContext.request.contextPath}/student/findAllTeacher?studentID=${student.studentid}"> 指导教师信息查看</a>--%>
                    <%--</li>--%>
                    <li>
                        <a href="${pageContext.request.contextPath}/company/findAllCompany?studentID=${student.studentid}">
                            公司信息查看</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/student/getStudentFileInfo?studentID=${student.studentid}">
                            提交文件</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/student/findStudentResult?studentID=${student.studentid}">
                            成绩查看</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/student/getStudentSubject?studentID=${student.studentid}">
                            实训题目</a>
                    </li>
                    <li>
                        <a href=""> 密码修改</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">密码修改</h1>
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
                                <form id="passwordInfo">
                                    <input type="hidden" id="studentID" name="studentID" value="${student.studentid}">
                                    <input type="hidden" id="hiddenPassword" name="hiddenPassword"
                                           value="${student.studentpassword}"/>
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label h5"><strong>旧密码:</strong></label>
                                            <div class="col-sm-6">
                                                <input id="oldPassword" name="oldPassword" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label h5"><strong>新密码:</strong></label>
                                            <div class="col-sm-6">
                                                <input id="password" name="password" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label h5"><strong>再次输入:</strong></label>
                                            <div class="col-sm-6">
                                                <input id="rePassword" name="rePassword" class="form-control">
                                            </div>
                                        </div>
                                        <button id="save" style="margin-left: 10%" type="button"
                                                onclick="updatePassword()" class="btn btn-success">保存
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
    function updatePassword() {
        $.ajax({
            async: false,
            type: "post",
            url: '${pageContext.request.contextPath}/student/updateStudentInfo',
//            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            data: $("#passwordInfo").serialize(),
            dataType: "json",
            success: function (data) {
                var data = data["success"];
                if (data == true) {
                    alert("修改成功");
                    location.reload();
                }
            }
        });
    }
</script>

</html>
