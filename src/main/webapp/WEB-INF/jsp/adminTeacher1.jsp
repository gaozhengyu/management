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
                        <a href="${pageContext.request.contextPath}/admin/findAdminInfo?teacherID=${teacher.teacherid}"> 个人信息</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 指导教师信息管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href=""> 指导教师信息维护</a>
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
                        <a href="${pageContext.request.contextPath}/admin/getAdminPassword?studentID=${teacher.teacherid}"> 密码修改</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">指导教师信息管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row row1">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        教师信息列表
                    </div>
                    <div class="panel-body">
                        <button class="btn btn-success" style="margin-bottom: 1%" onclick="window.location.href='${pageContext.request.contextPath}/excelWork/excelExport?type=teacher'">导出</button>
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                            <tr>
                                <th>教师ID</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>联系方式</th>
                                <th>电子邮箱</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="teacherData">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="updatePanel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改信息</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label h5">工号</label>
                            <div class="col-sm-6">
                                <input type="text" id="teacherID" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label h5">姓名</label>
                            <div class="col-sm-6">
                                <input type="text" id="teacherName" class="form-control"
                                       onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')"
                                       onpaste="value=value.replace(/[^\u4E00-\u9FA5]/g,'')"
                                       oncontextmenu = "value=value.replace(/[^\u4E00-\u9FA5]/g,'')">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label h5">性别</label>
                            <div class="col-sm-6">
                                <select id="teacherSex" class="form-control">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label h5">联系方式</label>
                            <div class="col-sm-6">
                                <input type="text" id="teacherPhone" class="form-control"
                                       onkeyup="value=value.replace(/[^0-9]/g,'')"
                                       onpaste="value=value.replace(/[^0-9]/g,'')"
                                       oncontextmenu="value=value.replace(/[^0-9]/g,'')"
                                       onblur="judgePhone()"
                                       maxlength="11">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label h5">邮箱</label>
                            <div class="col-sm-6">
                                <input type="text" id="teacherEmail" class="form-control" onblur="judgeEmail()">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="updateTeacher()">保存</button>
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

    function updatePanel(teacherID,teacherName,teacherSex,teacherPhone,teacherEmail) {
        $("#updatePanel").modal("show");
        $("#teacherID").val(teacherID);
        $("#teacherName").val(teacherName);
        if(teacherSex == null || teacherSex == ""){
            teacherSex = "男";
        }
        $("#teacherSex").val(teacherSex);
        $("#teacherPhone").val(teacherPhone);
        $("#teacherEmail").val(teacherEmail);
    }

    function updateTeacher() {
        var teacherID = $("#teacherID").val();
        var teacherName = $("#teacherName").val();
        var teacherSex = $("#teacherSex").val();
        var teacherPhone = $("#teacherPhone").val();
        var teacherEmail = $("#teacherEmail").val();
        $.post("${pageContext.request.contextPath}/admin/updateTeacher",
            {"teacherID":teacherID,"teacherName":teacherName,"teacherSex":teacherSex,"teacherPhone":teacherPhone,"teacherEmail":teacherEmail},
            function (data) {
                if(data.success = true){
                    alert("修改成功");
                    window.location.reload();
                }
            });
    }

    $(document).ready(function() {
        $(".row1").show();
        $(".row2").hide();

        $('#dataTables-example').DataTable({
//            responsive: true,
            "bRetrieve": true,
            "autoWidth": true,
            data:${teacherjson},
            //给列赋值，这里的列名需要和data的数据名对应
            "columns": [
                {"data":"teacherid",
                    "orderable": false,
                    "visible":false,
                    "searchable": false},
                { "data": "teachername" },
                { "data": "teachersex" },
                { "data": "teacherphone" },
                { "data": "teacheremail" },
                { "data": "",
                "render":function (data,type,row,meta) {
                    return '<button type="button" class="btn btn-success" onclick="updatePanel('
                        + "'" + row.teacherid + "'" +","
                        + "'" + row.teachername + "'" +","
                        + "'" + row.teachersex + "'" +","
                        + "'" + row.teacherphone + "'" +","
                        + "'" + row.teacheremail + "'"
                        + ')">修改</button>'
                        + "&nbsp;&nbsp;&nbsp;"
                        + '<button type="button" class="btn btn-success" onclick="resetPassword('
                        + "'" + row.teacherid + "'" + ')">重置密码</button>'
                        + "&nbsp;&nbsp;&nbsp;"
                        + '<button type="button" class="btn btn-success" onclick="deleteInfo('
                        + "'" + row.teacherid + "'" + ')">删除</button>';
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
    });

    function resetPassword(teacherID) {
        $.post("${pageContext.request.contextPath}/admin/resetPassword",
            {"teacherID":teacherID},
            function (data) {
                if(data.success == true){
                    alert("重置成功");
                    location.reload();
                }
            });
    }

    function reStart() {
        location.reload();
    }

    function judgeEmail(){
        //验证邮箱
        if(!$("#teacherEmail").val().match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)) {
            alert("邮箱格式不正确！请重新输入");
            $("#teacherEmail").val("");
        }
    }

    function judgePhone() {
        var phone = $("#teacherPhone").val();
        var isMobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1})|(14[0-9]{1}))+\d{8})$/;
        if (phone.substring(0, 1) == 1) {
            if (!isMobile.exec(phone) && phone.length != 11) {
                //错误提示信息
                alert("手机号码有误");
                $("#teacherPhone").val("");
            }
        }
    }

    function deleteInfo(teacherID){
        $.post("${pageContext.request.contextPath}/admin/deleteInfo",
            {
                "deleteID":teacherID,
                "type":"teacher"
            },
            function (data) {
                if(data.success == true){
                    alert("删除成功");
                    location.reload();
                }
            });
    }

</script>

</body>

</html>
