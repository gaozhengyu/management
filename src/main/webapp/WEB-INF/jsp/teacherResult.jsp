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

    <%--<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css">--%>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css">
    <link rel="stylesheet" href="../bootstrap-wysiwyg-master/index.css" type="text/css">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<style>

</style>

<body>

<input type="hidden" id="teacherID" value="${teacher.teacherid}">

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
                        <a href="${pageContext.request.contextPath}/teacher/findTeacherInfo?teacherID=${teacher.teacherid}"> 个人信息</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/teacher/findAllStudent?teacherID=${teacher.teacherid}"> 学生信息查看</a>
                    </li>
                    <%--<li>--%>
                        <%--<a href="${pageContext.request.contextPath}/teacher/findStudentReport?teacherID=${teacher.teacherid}"> 周月报查看</a>--%>
                    <%--</li>--%>
                    <li>
                        <a href=""> 成绩录入</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/teacher/getStudentFileInfo?teacherID=${teacher.teacherid}"> 文件下载</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/teacher/getTeacherPassword?teacherID=${teacher.teacherid}">
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
                <h1 class="page-header">成绩录入</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row row1">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading head">
                        学生列表
                    </div>
                    <div class="panel-body panel1">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                            <tr>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>实训题目</th>
                                <th>学生成绩</th>
                                <th>最终成绩</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="reportData">
                            </tbody>
                        </table>
                    </div>
                    <!-- /.panel-body -->

                    <div class="panel-body panel2">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>学号</label>
                                    <input class="form-control" id="studentID">
                                </div>
                                <div class="form-group">
                                    <label>姓名</label>
                                    <input class="form-control" id="studentName">
                                </div>
                                <div class="form-group">
                                    <label>实训题目</label>
                                    <input class="form-control" id="subject">
                                </div>
                                <%--<div class="form-group">--%>
                                    <%--<label>班级</label>--%>
                                    <%--<input class="form-control">--%>
                                <%--</div>--%>

                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>教师成绩</label>
                                    <input class="form-control" id="teacherResult" type="number">
                                </div>
                                <div class="form-group">
                                    <label>公司成绩</label>
                                    <input class="form-control" id="companyResult" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label>最终成绩</label>
                                    <input class="form-control" id="trainningResult" readonly="readonly">
                                </div>

                            </div>
                            <div class="col-lg-12">
                            <button type="button" class="btn btn-success" id="save">保存</button>
                            <button type="button" class="btn btn-warning" id="cancel">取消</button>
                            </div>


                        </div>
                    </div>


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

<script src="../bootstrap-wysiwyg-master/bootstrap-wysiwyg.js"></script>
<script src="../bootstrap-wysiwyg-master/external/jquery.hotkeys.js"></script>

<!-- DataTables JavaScript -->
<script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

</body>
<script>
    $(function () {
        var direction;

        $(".panel1").show();
        $(".panel2").hide();

        $("#cancel").click(function () {
            $(".panel1").show();
            $(".panel2").hide();
            $(".head").html("学生列表");
        });

        $("#save").click(function () {
            var studentID = $("#studentID").val();
            var companyResult = $("#companyResult").val();
            var teacherResult = $("#teacherResult").val();
            var trainningResult = $("#trainningResult").val();

            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/result/updateStudentResult",
                data:{
                    "studentID":studentID,
                    "companyResult":companyResult,
                    "teacherResult":teacherResult,
                    "trainningResult":trainningResult
                },
                dataType:"json",
                success:function (data) {
                    alert("保存成功");
                    //刷新当前页面.
                    window.location.reload()
                },
                error:function (data) {
                    alert("保存失败");
                }
            });
        });

        $("#teacherResult").bind('input propertychange',function () {
            if(window.direction == '校内实训'){
                var companyResult = $("#companyResult").val() / 2;
                var teacherResult = $("#teacherResult").val() / 2;
                var trainningResult = companyResult + teacherResult;
                $("#trainningResult").val(trainningResult);
            }else {
                var teacherResult = $("#teacherResult").val();
                $("#trainningResult").val(teacherResult);
            }

        });

    });

    function setStudentResult(studentID,studentName,subject,teacherResult,trainningResult,direction,comapnyResult) {
        $("#studentID").val(studentID);
        $("#studentName").val(studentName);
        $("#subject").val(subject);
        $("#teacherResult").val(teacherResult);
        $("#trainningResult").val(trainningResult);
        $("#companyResult").val(comapnyResult);
        window.direction = direction;
        $(".panel1").hide();
        $(".panel2").show();
        $(".head").html("成绩录入");

    }

    $(document).ready(function() {
        $('#dataTables-example').DataTable({
//            responsive: true,
            "bRetrieve": true,
            "autoWidth": true,
            //改变每页显示数据
            "bLengthChange": false,
            //默认行数
            "iDisplayLength": 10,
            //关闭搜索框
//            "bFilter": false,
            data:${studentResultjson},
            //给列赋值，这里的列名需要和data的数据名对应
            "columns": [
                { "data":"studentid" },
                { "data": "studentname" },
                { "data": "subject" },
                { "data": "teacherresult" },
                { "data": "trainningresult" },
                {"data":"",
                    "render":function (data,type,row,meta) {
                        return '<button type="button" class="btn btn-success" onclick="setStudentResult('
                            + "'" + row.studentid + "'" + ","
                            + "'" + row.studentname + "'" + ","
                            + "'" + row.subject + "'" + ","
                            + "'" + row.teacherresult + "'" + ","
                            + "'" + row.trainningresult + "'" + ","
                            + "'" + row.direction + "'" + ","
                            + "'" + row.companyresult + "'" + ","
                            + ')">录入成绩</button>';
                    }},
            ],
            "oLanguage" : { // 国际化配置
                "sProcessing" : "正在获取数据，请稍后...",
                "sLengthMenu" : "显示 _MENU_ 条",
                "sZeroRecords" : "没有找到数据",
                "sInfo" : "从 _START_ 到  _END_ 条记录 共查到 _TOTAL_ 条",
                "sInfoEmpty" : "记录数为0",
                "sInfoFiltered" : "(全部记录数 _MAX_ 条)",
                "sInfoPostFix" : "",
                "sSearch" : "关键字：  ",
                "sUrl" : "",
                "oPaginate" : {
                    "sFirst" : "第一页",
                    "sPrevious" : "上一页",
                    "sNext" : "下一页",
                    "sLast" : "最后一页"
                }
            }
        });
    });

</script>

</html>
