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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

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
                        <a href="${pageContext.request.contextPath}/company/findCompanyInfo?companyID=${company.companyid}"> 公司信息</a>
                    </li>
                    <li>
                        <a href=""> 学生信息</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 实训过程管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/company/getCompanyFileInfo?companyID=${company.companyid}&type=1">上传教学大纲</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/company/getCompanyFileInfo?companyID=${company.companyid}&type=2">上传学生考勤情况</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/company/findAllCompanyResult?companyID=${company.companyid}"> 成绩录入</a>
                            </li>
                            <%--<li>--%>
                                <%--<a href="${pageContext.request.contextPath}/company/getCompanyFileInfo?companyID=${company.companyid}&type=3">实训鉴定</a>--%>
                            <%--</li>--%>
                        </ul>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/company/getCompanyPassword?companyID=${company.companyid}"> 密码修改</a>
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
                <h1 class="page-header">学生信息</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        学生信息
                    </div>

                    <div class="panel-body">
                        <button class="btn btn-success" style="margin-bottom: 1%" onclick="exportCompanyStudent()">导出</button>
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                            <tr>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>班级</th>
                                <th>联系方式</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
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

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>

    $(document).ready(function() {
        $('#dataTables-example').DataTable({
//            responsive: true,
            "bRetrieve": true,
            "autoWidth": true,
            data:${studentjson},
            //给列赋值，这里的列名需要和data的数据名对应
            "columns": [
                {"data":"studentid" },
                { "data": "studentname" },
                { "data": "studentsex" },
                { "data": "classid" },
                { "data": "studentphone" }
            ],
            "oLanguage" : { // 国际化配置
                "sProcessing" : "正在获取数据，请稍后...",
                "sLengthMenu" : "显示 _MENU_ 条",
                "sZeroRecords" : "没有找到数据",
                "sInfo" : "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
                "sInfoEmpty" : "记录数为0",
                "sInfoFiltered" : "(全部记录数 _MAX_ 条)",
                "sInfoPostFix" : "",
                "sSearch" : "关键字：",
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

    function exportCompanyStudent() {
        var companyID = "${company.companyid}";
        window.location.href="${pageContext.request.contextPath}/excelWork/exportCompanyStudent?companyID="+companyID;
    }

</script>

</body>

</html>
