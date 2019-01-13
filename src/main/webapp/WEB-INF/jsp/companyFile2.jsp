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

    <!-- fileinput-->
    <link href="../fileinput/css/fileinput.min.css" rel="stylesheet"type="text/css">

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
                        <a href="${pageContext.request.contextPath}/company/findAllCompanyStudent?companyID=${company.companyid}"> 学生信息</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 实训过程管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/company/getCompanyFileInfo?companyID=${company.companyid}&type=1">上传教学大纲</a>
                            </li>
                            <li>
                                <a href="">上传学生考勤情况</a>
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
                <h1 class="page-header">学生考勤情况</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <div class="row row1">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        考勤情况文件列表
                    </div>
                    <div class="panel-body">
                        <button type="button" class="btn btn-success" style="margin-bottom: 1% " onclick="getAddReport()">上传文件</button>
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                            <tr>
                                <th>文件ID</th>
                                <th>文件名称</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="reportData">
                            </tbody>
                        </table>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>


        <div class="row row2">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        请选择上传文件
                    </div>
                    <div class="panel-body">
                        <%--<div class="form-group">--%>
                        <%--<label>请选择文件类型</label>--%>
                        <%--<select id="fileType" class="form-control">--%>
                        <%--<option value="0">实训鉴定扫描件</option>--%>
                        <%--<option value="1">实训报告</option>--%>
                        <%--</select>--%>
                        <%--</div>--%>
                        <div class="form-group">
                            <label>File input</label>
                            <input id="input-id" name="file" multiple type="file" data-show-caption="true">
                        </div>
                        <%--<button id="save" type="submit" class="btn btn-default">保存</button>--%>
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

<!-- fileinput -->
<script src="../fileinput/js/fileinput.js"></script>

<!-- DataTables JavaScript -->
<script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

</body>
<script>

    $(function () {
        initFileInput("input-id");
        $(".row1").show();
        $(".row2").hide();
    });

    function fodderType(){
        var fileType = $("#fileType").val();
        return fileType;
    }

    function getAddReport() {
        $(".row1").hide();
        $(".row2").show();
    }

    function initFileInput(ctrlName) {
        var control = $('#' + ctrlName);
        var companyID = "${company.companyid}";
        control.fileinput({
            language: 'zh', //设置语言
            //上传的地址
            uploadUrl: "${pageContext.request.contextPath}/file/insertCompanyFile?fileType=2&companyID=" + companyID,
            allowedFileExtensions: [],//接收的文件后缀
            //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
            uploadAsync: true, //默认异步上传
            showUpload: true, //是否显示上传按钮
            showRemove : true, //显示移除按钮
            showPreview : true, //是否显示预览
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            //dropZoneEnabled: true,//是否显示拖拽区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            //minFileCount: 0,
            //maxFileCount: 10, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
//            uploadExtraData:function (previewId,index) {
//                var obj = {};
//                obj.fileType = fodderType();
//                return obj;
//            },
            validateInitialCount:true,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",

        }).on('filepreupload', function(event, data, previewId, index) {     //上传中
            var form = data.form, files = data.files, extra = data.extra,
                response = data.response, reader = data.reader;
            console.log('文件正在上传');
        }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
            console.log('文件上传成功！'+data.id);

        }).on('fileerror', function(event, data, msg) {  //一个文件上传失败
            console.log('文件上传失败！'+data.id);
        })
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
            "bFilter": false,
            data:${companyfilejson},
            //给列赋值，这里的列名需要和data的数据名对应
            "columns": [
                {"data":"companyfileid",
                    "orderable": false,
                    "visible":false,
                    "searchable": false},
                { "data": "companyfilename" },
                {"data":"",
                    "render":function (data,type,row,meta) {
                        var reportContent = row.reportcontent;
//                        return '<button type="button" class="btn btn-success" onclick=seeReportInfo('
//                            + "'" + row.reportcontent + "'" + ","
//                            + "'" + row.reportresult + "'" + ')>预览</button>';
                        return '<button type="button" class="btn btn-default" onclick="deleteFile('
                            + "'" + row.companyfileid + "'"
                            + ')">删除</button>';
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
    function deleteFile(companyfileID) {
        $.post(
            "${pageContext.request.contextPath}/file/deleteFile?type=company",
            {"fileID":companyfileID},
            function (data) {
                if(data.success == true){
                    alert("删除成功");
                    window.location.reload();
                }
            });
    }


</script>

</html>
