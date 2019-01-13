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
                        <a href="${pageContext.request.contextPath}/student/findStudentInfo?studentID=${student.studentid}"> 个人信息</a>
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
                        <a href=""> 实训题目</a>
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
                <h1 class="page-header">实训题目</h1>
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

                                <div class="form-group">
                                    <label>实训题目</label>
                                    <input id="studentSubject" class="form-control" value="${student.subject}">
                                    <p class="help-block" >题目已经存在！</p>
                                </div>

                                <button id="save" type="submit" class="btn btn-default">保存</button>
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
        $(".help-block").hide();

        $("#studentSubject").bind("input propertychange",function () {
            var studentID = $("#hidden1").val();
            var subject = $("#studentSubject").val();
            if(subject != ""){
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/student/getSameSubject",
                    data:{"studentID":studentID,"subject":subject},
                    dataType:"json",
                    success:function (data) {
                        if(data.isNull == "notNull"){
                            $(".help-block").show();
                            $("#save").css("disabled","disabled");
                        }
                        else {
                            $("#save").css("disabled","true");
                        }
                    },
                    error:function (e) {
                        console.info(e);
                    }
                });
            }
        });
    });

    $(function () {
        $("#save").click(function () {
            var subject = $("#studentSubject").val();
            var studentID = $("#hidden1").val();
            $.post("${pageContext.request.contextPath}/student/updateStudentInfo",
                {"studentID":studentID,"subject":subject},
                function (data) {
                    if(data.success == true){
                        alert("保存成功");
                        location.reload();
                    }
                }
            );
        });

    });

</script>

</html>
