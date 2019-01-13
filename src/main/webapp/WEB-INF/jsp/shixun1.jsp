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
<style>
    .dataTable{
        text-align: center;
    }
    .table th{ /*数据表格标题文字居中*/
        text-align: center;
        vertical-align: middle!important;
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
                        <a href="${pageContext.request.contextPath}/admin/findAdminInfo?teacherID=${teacher.teacherid}"> 个人信息</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 指导教师信息管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllTeacherInfo?type=1&teacherID=${teacher.teacherid}"> 指导教师信息维护</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllTeacherInfo?type=2&teacherID=${teacher.teacherid}"> 指导教师信息添加</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 学生信息管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllStudentInfo?type=1&teacherID=${teacher.teacherid}"> 学生信息维护</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllStudentInfo?type=2&teacherID=${teacher.teacherid}"> 学生信息添加</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 公司信息管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllCompanyInfo?type=1&teacherID=${teacher.teacherid}"> 公司信息维护</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllCompanyInfo?type=2&teacherID=${teacher.teacherid}"> 公司信息添加</a>
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
                                <a href="${pageContext.request.contextPath}/admin/findAllCompanyInfo?type=3&teacherID=${teacher.teacherid}"> 公司授权</a>
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
                        <a href="${pageContext.request.contextPath}/admin/getAdminPassword?teacherID=${teacher.teacherid}"> 密码修改</a>
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
                <h1 class="page-header">指导教师分配</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        学生信息列表
                    </div>
                    <div class="panel-body">
                        <button class="btn btn-success" style="margin-bottom: 1%" onclick="getTeacher()">分配教师</button>
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                            <tr>
                                <th><input id="quanxuan" type="checkbox" onclick="setStudentList()"></th>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>班级</th>
                                <th>实习去向</th>
                                <th>实训题目</th>
                                <th>指导教师</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="importPanel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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

<div class="modal fade" id="teaInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <input type="hidden" id="studentID">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">分配教师</h4>
            </div>
            <div class="modal-body">
                <table width="100%" class="table table-striped table-bordered table-hover" id="teacherTable">
                    <thead>
                    <tr>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
            <div class="modal-footer">
                <%--<button id="save" type="button" class="btn btn-success" onclick="saveReportResult()">保存</button>--%>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addPanel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加学生</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label h5">学号</label>
                            <div class="col-sm-6">
                                <input type="text" id="studentID2" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label h5">姓名</label>
                            <div class="col-sm-6">
                                <input type="text" id="studentName" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label h5">性别</label>
                            <div class="col-sm-6">
                                <input type="text" id="studentSex" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label h5">班级</label>
                            <div class="col-sm-6">
                                <input type="text" id="classID" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label h5">联系方式</label>
                            <div class="col-sm-6">
                                <input type="text" id="studentPhone" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label h5">邮箱</label>
                            <div class="col-sm-6">
                                <input type="text" id="studentEmail" class="form-control">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="saveStudent()">保存</button>
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

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>

    var studentList = [];

    function importPanel(){
        $("#importPanel").modal("show");
    }

    function upload() {
        $("#excelImport").submit();
        var t = setInterval(function() {
            //获取iframe标签里body元素里的文字。即服务器响应过来的"上传成功"或"上传失败"
            var word = $("iframe[name='message']").contents().find("body").text();
            if (word != "" && word == 'success') {
                alert("上传成功");        //弹窗提示是否上传成功
                clearInterval(t);   //清除定时器
                location.reload();
            }
        }, 1000);
    }

    $(document).ready(function() {
        $('#dataTables-example').DataTable({
//            responsive: true,
            "bRetrieve": true,
            "autoWidth": true,
            data:${studentjson},
            searching: true,//是否显示搜索框
            //给列赋值，这里的列名需要和data的数据名对应
            "columns": [
                { "data":"",
                    "bSortable": false,
                    "orderable":false,
                    "render":function (data,type,row,meta) {
                        return  "<label><input type='checkbox' name='checkBox1' value='" + row.StudentID + "'/><span class='lbl'></span></label>";
                    }},
                { "data":"StudentID" },
                { "data": "StudentName" },
                { "data": "StudentSex" },
                { "data": "ClassID" },
                { "data": "Direction" },
                { "data": "subject" },
                { "data": "TeacherName" }
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

    function resetPassword(studentID) {
        $.post("${pageContext.request.contextPath}/admin/resetPassword",
            {"studentID":studentID},
            function (data) {
                if(data.success == true){
                    alert("重置成功");
                    location.reload();
                }
            }
        )
    }

    function getTeacher() {
        var checkedBox = $("input[name='checkBox1']:checked");
        if (checkedBox.length == 0) {
            top.alert("请选择学生！");
            return;
        } else {
            $('input[name="checkBox1"]:checked').each(function () {
                //var method =  $("#" + $(this).val()).val();
                studentList.push($(this).val());
            });
            var teacherList;
            $.ajax({
                url:"${pageContext.request.contextPath}/admin/getAllTeacher",
                type:"post",
                dataType:"json",
                async: false,
                success:function (data) {
                    teacherList = data;
                }
            });
            $('#teacherTable').DataTable({
                "bRetrieve": true,
                "autoWidth": true,
                data:teacherList,
                //给列赋值，这里的列名需要和data的数据名对应
                "columns": [
                    { "data": "teachername" },
                    { "data": "teachersex" },
                    { "data": "",
                        "render":function (data,type,row,meta) {
                            return '<button type="button" class="btn btn-success" onclick="setTeacher('
                                + "'" + row.teacherid + "'" + ')">分配</button>';
                        }}
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
            $("#teaInfo").modal("show");
        }
    }

    function setTeacher(teacherID) {
        var studentList = window.studentList;
        $.ajax({
            type: 'POST',
            url: "${pageContext.request.contextPath}/admin/setTeacher?studentList=" + studentList+"&teacherID="+teacherID,
            success: function (data) {
                top.alert("分配成功");
                //top.Notice(data.msg);
                window.location.reload();
            },
        });
    }

    function addPanel() {
        $("#addPanel").modal("show");
    }

    function saveStudent() {
        var studentID = $("#studentID2").val();
        var studentName = $("#studentName").val();
        var studentSex = $("#studentSex").val();
        var classID = $("#classID").val();
        var studentPhone = $("#studentPhone").val();
        var studentEmail = $("#studentEmail").val();
        $.post("${pageContext.request.contextPath}/admin/saveStudent",
            {"studentID":studentID,"studentName":studentName,"studentSex":studentSex,"classID":classID,"studentPhone":studentPhone,"studentEmail":studentEmail},
            function (data) {
                if(data.success = true){
                    alert("添加成功");
                    window.location.reload();
                }
            });
    }

    function setStudentList() {
        if($("#quanxuan").is(":checked")){
            $("input[name='checkBox1']").each(function () {
                $(this).attr("checked","true");
            });
        }else {
            $("input[name='checkBox1']").each(function () {
                $(this).attr("checked",false);
            });
        }
    }

</script>

</body>

</html>
