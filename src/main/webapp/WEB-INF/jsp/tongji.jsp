<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>软件学院专科毕业实训管理系统</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet">

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
                        <a href="${pageContext.request.contextPath}/admin/findAdminInfo?teacherID=${teacher.teacherid}">
                            个人信息</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 指导教师信息管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllTeacherInfo?type=1&teacherID=${teacher.teacherid}">
                                    指导教师信息维护</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllTeacherInfo?type=2&teacherID=${teacher.teacherid}">
                                    指导教师信息添加</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 学生信息管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllStudentInfo?type=1&teacherID=${teacher.teacherid}">
                                    学生信息维护</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllStudentInfo?type=2&teacherID=${teacher.teacherid}">
                                    学生信息添加</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 公司信息管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllCompanyInfo?type=1&teacherID=${teacher.teacherid}">
                                    公司信息维护</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/findAllCompanyInfo?type=2&teacherID=${teacher.teacherid}">
                                    公司信息添加</a>
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
                        <a href=""> 统计</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getAdminPassword?teacherID=${teacher.teacherid}">
                            密码修改</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">统计</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        选择班级
                    </div>
                    <div class="panel-body" >
                        <div class="form-group">
                            <label>选择年级</label>
                            <select id="gradeList" onchange="getGradeList()"></select>
                        </div>
                        <div class="form-group" id="classPanel">

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-2">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        统计类型
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1"
                                           checked>去向统计
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">公司人数统计
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">教师分配学生人数统计
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios4" value="option4">学生成绩统计
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-10 direction-tongji">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        去向统计
                    </div>
                    <div class="panel-body">
                        <button type="button" class="btn btn-success" style="margin-bottom: 1%"
                                onclick="exportDirection()">导出</button>
                        <table width="100%" class="table table-striped table-bordered table-hover"
                               id="dataTables-Direction">
                            <thead>
                            <tr>
                                <th>总人数</th>
                                <th>校内实训人数</th>
                                <th>自行联系公司人数</th>
                                <th>学校合作公司人数</th>
                            </tr>
                            </thead>
                        </table>
                        <div id="direction"></div>
                    </div>
                </div>
            </div>

            <div class="col-lg-10 company-tongji">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        公司人数统计
                    </div>
                    <div class="panel-body">
                        <button type="button" class="btn btn-success" style="margin-bottom: 1%"
                                onclick="exportCompany()">导出</button>
                        <table width="100%" class="table table-striped table-bordered table-hover"
                               id="dataTables-Company">
                            <thead>
                            <tr>
                                <th>公司名称</th>
                                <th>报名公司人数</th>
                            </tr>
                            </thead>
                        </table>
                        <div id="company"></div>
                    </div>
                </div>
            </div>

            <div class="col-lg-10 jiaoshi-tongji">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        教师学生统计
                    </div>
                    <div class="panel-body">
                        <button type="button" class="btn btn-success" style="margin-bottom: 1%"
                                onclick="exportTeacher()">导出</button>
                        <table width="100%" class="table table-striped table-bordered table-hover"
                               id="dataTables-Teacher">
                            <thead>
                            <tr>
                                <th>教师姓名</th>
                                <th>分配学生人数</th>
                            </tr>
                            </thead>
                        </table>
                        <div id="teacher"></div>
                    </div>
                </div>
            </div>

            <div class="col-lg-10 result-tongji">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        成绩统计
                    </div>
                    <div class="panel-body">
                        <button type="button" class="btn btn-success" style="margin-bottom: 1%"
                                onclick="exportResult()">导出</button>
                        <table width="100%" class="table table-striped table-bordered table-hover"
                               id="dataTables-Result">
                            <thead>
                            <tr>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>班级</th>
                                <th>实训题目</th>
                                <th>成绩</th>
                            </tr>
                            </thead>
                        </table>
                        <div id="result"></div>
                    </div>
                </div>
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

<script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

<script src="https://cdn.hcharts.cn/highcharts/highcharts.js"></script>


<!-- Custom Theme JavaScript -->
<script src="../dist/js/sb-admin-2.js"></script>

<script>

    var classList = [];

    $(document).ready(function () {
        $(".direction-tongji").hide();
        $(".company-tongji").hide();
        $(".result-tongji").hide();
        $(".jiaoshi-tongji").hide();

        $.ajax({
            url:"${pageContext.request.contextPath}/tongji/getGradeList",
            type:"post",
            async:false,
            success:function (data) {
                var datas = eval(data);
                for (var i = 0; i < datas.length; i++){
                    $("#gradeList").append("<option value='" + datas[i]+"'>" + datas[i] + "</option>");
                }
            }
        });
        getGradeList();
    });

    function getGradeList() {
       var grade = $("#gradeList").val();
        $.ajax({
            url: "${pageContext.request.contextPath}/tongji/getClassList",
            type: "post",
            data:{"grade":grade},
            async: false,
            success: function (data) {
                var datas = eval(data);
                $("#classPanel").html("");
                for (var i = 0; i < datas.length; i++) {

                    $("#classPanel").append('<label class="checkbox-inline"> <input type="checkbox" name="checkBox" onchange="getClassList()" value="' + datas[i] + '">' + datas[i] + ' </label>');
                }
            }
        });
    }

    function directionTongji(classList) {
        var directionjson;
        var direction = $('#dataTables-Direction');
        var directionchart = new Highcharts.Chart({
            chart: {
                renderTo: 'direction',
                //图表背景颜色
                plotBackgroundColor: null,
                //图表边框宽度
                plotBorderWidth: null,
                //绘图区阴影
                plotShadow: false
            },
            //标题
            title: {
                text: '去向统计'
            },
            //数据提示框
            tooltip: {
                //数据点格式化字符串
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            //数据列配置
            plotOptions: {
                //饼图
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            //通用数据列
            series: [{
                type: 'pie',
                name: 'Browser share'
            }]
        });
        $.ajax({
            url: "${pageContext.request.contextPath}/tongji/getDirectionRenshu?classList=" + classList,
            type: "post",
            async: false,
            success: function (data) {
                directionjson = data;
                directionbrowsers = [];
                $.each(data, function (i, d) {
                    directionbrowsers.push(['合作实训公司', d['hezuo']]);
                    directionbrowsers.push(['校内实训', d['xiaonei']]);
                    directionbrowsers.push(['自行联系', d['zixing']]);
                });
                directionchart.series[0].setData(directionbrowsers);
            }
        });
        refrash(direction);
        var directionTable = $('#dataTables-Direction').DataTable({
//            responsive: true,
            bDestory: true,
            "bRetrieve": true,
            "autoWidth": true,
            bFilter: false,    //去掉搜索框方法三：这种方法可以
            bLengthChange: false,
            data: directionjson,
            //给列赋值，这里的列名需要和data的数据名对应
            "columns": [
                {"data": "total"},
                {"data": "xiaonei"},
                {"data": "zixing"},
                {"data": "hezuo"}
            ],
            "oLanguage": oLanguage
        });
    }

    function companyTongji(classList) {
        var companyjson;
        var company = $('#dataTables-Company');
        var companychart = new Highcharts.Chart({
            chart: {
                renderTo: 'company',
                //图表背景颜色
                plotBackgroundColor: null,
                //图表边框宽度
                plotBorderWidth: null,
                //绘图区阴影
                plotShadow: false
            },
            //标题
            title: {
                text: '公司人数统计'
            },
            //数据提示框
            tooltip: {
                //数据点格式化字符串
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            //数据列配置
            plotOptions: {
                //饼图
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            //通用数据列
            series: [{
                type: 'pie',
                name: 'Browser share'
            }]
        });
        $.ajax({
            url: "${pageContext.request.contextPath}/tongji/getCompanyRenshu?classList=" + classList,
            type: "post",
            async: false,
            success: function (data) {
                companyjson = data;
                companybrowsers = [];
                $.each(data, function (i, d) {
                    companybrowsers.push([d['companyname'], d['num']]);
                });
                companychart.series[0].setData(companybrowsers);
            }
        });
        refrash(company);
        var companyTable = $('#dataTables-Company').DataTable({
//            responsive: true,
            bDestory: true,
            "bRetrieve": true,
            "autoWidth": true,
            bFilter: false,    //去掉搜索框方法三：这种方法可以
            bLengthChange: false,
            data: companyjson,
            //给列赋值，这里的列名需要和data的数据名对应
            "columns": [
                {"data": "companyname"},
                {"data": "num"}
            ],
            "oLanguage": oLanguage
        });
    }

    function teacherTongji(classList) {
        var teacherjson;
        var x = [];
        var y = [];
        var xtext = [];
        var teacher = $('#dataTables-Teacher');
        var teacherchart = new Highcharts.Chart({
            chart: {
                renderTo: 'teacher',
                type: 'column' //显示类型 柱形
            },
            title: {
                text: '教师分配学生人数' //图表的标题
            },
            xAxis: {
                categories: xtext
            },
            yAxis: {
                allowDecimals: false,
                title: {
                    text: '人数' //Y轴的名称
                },
            },
            series: [{
                name: "人数"
            }]
        });
        $.ajax({
            url: "${pageContext.request.contextPath}/tongji/getTeacherRenshu?classList=" + classList,
            type: "post",
            async: false,
            success: function (data) {
                teacherjson = data;
                for (var key in teacherjson) {
                    teacherjson[key].y = teacherjson[key].num;
                    xtext.push(teacherjson[key].teachername);
                }
                teacherchart.series[0].setData(teacherjson);
            }
        });

        refrash(teacher);
        var teacherTable = $('#dataTables-Teacher').DataTable({
//            responsive: true,
            bDestory: true,
            "bRetrieve": true,
            "autoWidth": true,
            bFilter: false,    //去掉搜索框方法三：这种方法可以
            bLengthChange: false,
            data: teacherjson,
            //给列赋值，这里的列名需要和data的数据名对应
            "columns": [
                {"data": "teachername"},
                {"data": "num"}
            ],
            "oLanguage": oLanguage
        });
    }

    function resultTongji2(classList) {
        var resultChart = new Highcharts.Chart({
            chart: {
                renderTo: 'result',
                //图表背景颜色
                plotBackgroundColor: null,
                //图表边框宽度
                plotBorderWidth: null,
                //绘图区阴影
                plotShadow: false
            },
            //标题
            title: {
                text: '分数段统计'
            },
            //数据提示框
            tooltip: {
                //数据点格式化字符串
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            //数据列配置
            plotOptions: {
                //饼图
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            //通用数据列
            series: [{
                type: 'pie',
                name: 'Browser share'
            }]
        });
        $.ajax({
            url: "${pageContext.request.contextPath}/tongji/getResultRenshu?classList=" + classList,
            type: "post",
            async: false,
            success: function (data) {
                resultbrowsers = [];
                $.each(data, function (i, d) {
                    resultbrowsers.push(['90分以上', d['90分以上']]);
                    resultbrowsers.push(['80-89分', d['80-89分']]);
                    resultbrowsers.push(['70-79分', d['70-79分']]);
                    resultbrowsers.push(['60-69分', d['60-69分']]);
                    resultbrowsers.push(['60分以下', d['60分以下']]);
                });
                resultChart.series[0].setData(resultbrowsers);
            }
        });
    }

    function resultTongji(classList) {
        var resultjson;
        var result = $('#dataTables-Result');
        resultTongji2(classList);
        $.ajax({
            url: "${pageContext.request.contextPath}/tongji/getResultList?classList=" + classList,
            type: "post",
            async: false,
            success: function (data) {
                resultjson = data;
            }
        });
        refrash(result);
        var resultTable = $('#dataTables-Result').DataTable({
//            responsive: true,
            bDestory: true,
            "bRetrieve": true,
            "autoWidth": true,
            bFilter: false,    //去掉搜索框方法三：这种方法可以
            bLengthChange: false,
            data: resultjson,
            //给列赋值，这里的列名需要和data的数据名对应
            "columns": [
                {"data": "studentid"},
                {"data": "studentName"},
                {"data": "classid"},
                {"data": "subject"},
                {"data": "TrainningResult"}
            ],
            "oLanguage": oLanguage
        });
    }

    var oLanguage = { // 国际化配置
        "sProcessing": "正在获取数据，请稍后...",
        "sLengthMenu": "显示 _MENU_ 条",
        "sZeroRecords": "没有找到数据",
        "sInfo": "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
        "sInfoEmpty": "记录数为0",
        "sInfoFiltered": "(全部记录数 _MAX_ 条)",
        "sInfoPostFix": "",
        "sSearch": "关键字：",
        "sUrl": "",
        "oPaginate": {
            "sFirst": "第一页",
            "sPrevious": "上一页",
            "sNext": "下一页",
            "sLast": "最后一页"
        }
    }

    function refrash(name) {
        if (name.hasClass('dataTable')) {
            dttable = name.dataTable();
            dttable.fnClearTable(); //清空一下table
            dttable.fnDestroy(); //还原初始化了的datatable
        }
    }

    function getClassList() {
        var classList = [];
        $('input[name="checkBox"]:checked').each(function () {
            classList.push($(this).val());
        });

        window.classList = classList;

        if (classList.length > 0) {
            getTongjiType();
            directionTongji(classList);
            companyTongji(classList);
            teacherTongji(classList);
            resultTongji(classList);
        }
        else {
            $(".direction-tongji").hide();
            $(".company-tongji").hide();
            $(".jiaoshi-tongji").hide();
            $(".result-tongji").hide();
        }

    }

    function getTongjiType() {
        var selectType = $('.radio input:radio:checked').val();
        if (selectType == 'option1') {
            $(".direction-tongji").show();
        } else if (selectType == 'option2') {
            $(".company-tongji").show();
        } else if (selectType == 'option3') {
            $(".jiaoshi-tongji").show();
        } else {
            $(".result-tongji").show();
        }
    }

    function exportDirection() {
        var classList = window.classList;
        window.location.href='${pageContext.request.contextPath}/excelWork/exportDirection?classList='+classList;
    }

    function exportTeacher() {
        var classList = window.classList;
        window.location.href='${pageContext.request.contextPath}/excelWork/exportTeacher?classList='+classList;
    }

    function exportCompany() {
        var classList = window.classList;
        window.location.href='${pageContext.request.contextPath}/excelWork/exportCompany?classList='+classList;
    }

    function exportResult() {
        var classList = window.classList;
        window.location.href='${pageContext.request.contextPath}/excelWork/exportResult?classList='+classList;
    }

</script>

</body>


</html>
