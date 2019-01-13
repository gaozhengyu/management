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

    <link href="../vendor/css/datatablestyle.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<input type="hidden" id="studentID" value="${student.studentid}">
<input type="hidden" id="endTime" value="${endTime}">

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
                        <a href="${pageContext.request.contextPath}/student/findStudentInfo?studentID=${student.studentid}">
                            个人信息</a>
                    </li>
                    <li>
                        <a href=""> 去向申报</a>
                    </li>
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
                        <a href="${pageContext.request.contextPath}/student/getStudentPassword?studentID=${student.studentid}">
                            密码修改</a>
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
                <h1 class="page-header">去向申报</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading" id="rowhead">
                        修改完成后请保存
                    </div>
                    <div class="panel-body">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>请选择去向</label>
                                <select id="direction" class="form-control" onchange="selectCompany()">
                                    <option value="0">校内实训</option>
                                    <option value="1">学校合作实训公司</option>
                                    <option value="2">自行联系实训公司</option>
                                </select>
                            </div>
                            <div class="form-group group1" style="display: block">
                                <label>请选择公司</label>
                                <select id="company" class="form-control">
                                </select>
                            </div>
                            <div class="form-group group2" style="display: none">
                                <label>公司名称</label>
                                <input id="companyName" class="form-control" value="${student.companyname}">
                            </div>
                            <button id="save" type="submit" class="btn btn-default">保存</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
        var num;
        if ("${student.direction}" == "校内实训") {
            num = 0;
        } else if ("${student.direction}" == "学校合作实训公司") {
            num = 1;
        } else {
            num = 2;
        }
        $("#direction").val(num);
        var direction = $("#direction").val();

        var endTime = $("#endTime").val();
        var time = new Date(endTime).toLocaleDateString();
        var today = new Date().toLocaleDateString();
        if (time <= today) {
            $("#rowhead").html("去向申报已截止！");
            $("#rowhead").css("color", "red");
            $("#save").hide();
        }

        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/company/findCompany",
            data: {"direction": direction},
            dataType: "json",
            success: function (data) {
                if (data != null) {
                    $("#company").empty();
                    for (var i in data) {
                        $("#company").append("<option value=" + data[i].companyid + ">" + data[i].companyname + "</option>");
                    }
                    $("#company").val("${student.companyid}");
                }
            },
            error: function (data) {
                $(".group1").css('display', 'none');
                $(".group2").css('display', 'block');
            }
        });

        $("#save").click(function () {
            var studentID = $("#studentID").val();
            var direction = $("#direction").find("option:selected").text();
            var companyID = $("#company").val();
            var companyName = $("#companyName").val();
            var display = $(".group2").css('display');
            if (display == "none") {
                companyName = null;
            }
            $.post(
                "${pageContext.request.contextPath}/student/updateStudentDirection",
                {
                    "studentID": studentID,
                    "direction": direction,
                    "companyID": companyID,
                    "companyName": companyName
                },
                function (data) {
                    if (data.success == true) {
                        alert("保存成功");
                        location.reload();
                    }
                }
            );
        });
    });

    function selectCompany() {
        var direction = $("#direction").val();
        if (direction == 2) {
            $(".group1").css('display', 'none');
            $(".group2").css('display', 'block');
        }
        else {
            $(".group1").css('display', 'block');
            $(".group2").css('display', 'none');
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/company/findCompany",
                data: {"direction": direction},
                dataType: "json",
                success: function (data) {
                    if (data != null) {
                        $("#company").empty();
                        for (var i in data) {
                            $("#company").append("<option value=" + data[i].companyid + ">" + data[i].companyname + "</option>")
                        }
                    }
                },
                error: function (data) {
                    alert("请求失败");
                }
            });
        }
    }

</script>

</html>
