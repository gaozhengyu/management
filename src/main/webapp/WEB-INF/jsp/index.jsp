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
    <link href="/management/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/management/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/management/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/management/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<input type="hidden" id="hidden" value="${massage}">
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">毕业实训管理系统</h3>
                </div>
                <div class="panel-body">
                    <form role="form" action="${pageContext.request.contextPath}/userLogin/login">
                        <fieldset>
                            <div class="form-group">
                                <p class="help-block" id="help" style="color: red"></p>
                                <input class="form-control" placeholder="账号" name="zhanghao" type="text" autofocus>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="密码" name="password" type="password" value="">
                            </div>
                            <%--<div class="checkbox">--%>
                                <%--<label>--%>
                                    <%--<input name="remember" type="checkbox" value="Remember Me">记住我--%>
                                <%--</label>--%>
                            <%--</div>--%>
                            <!-- Change this to a button or input when using this as a form -->
                            <input type="submit" value="登录" class="btn btn-lg btn-success btn-block">
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- jQuery -->
<script src="/management/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/management/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/management/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/management/dist/js/sb-admin-2.js"></script>

</body>
<script>
    $(function () {
        $("#help").hide();
        if($("#hidden").val() != null){
            $("#help").html($("#hidden").val());
            $("#help").show();
        }
    })
</script>

</html>
