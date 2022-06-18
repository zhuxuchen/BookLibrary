<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>云借阅-图书管理系统</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/AdminLTE.css">
    <link rel="stylesheet" href="css/_all-skins.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/my.js"></script>
    <script type="text/javascript">
        function SetIFrameHeight() {
            var iframeid = document.getElementById("iframe");
            if (document.getElementById) {
                /*设置 内容展示区的高度等于页面可视区的高度*/
                iframeid.height = document.documentElement.clientHeight;
            }
        }
    </script>
</head>
<body class="hold-transition skin-green sidebar-mini">
    <div class="wrapper">

        <jsp:include page="header.jsp"/>
        <jsp:include page="sidebar.jsp"/>

        <!-- 内容展示区域 -->
        <div class="content-wrapper">
            <!-- .box-body -->
            <div class="box-header with-border">
                <h3 class="box-title">当前借阅</h3>
            </div>
            <div class="box-body">

                <!--工具栏 数据搜索 -->
                <div class="box-tools pull-right">
                    <div class="has-feedback">
                        <form action="/book/search" method="post">
                            图书名称：<input name="name" value="">&nbsp;&nbsp;&nbsp;&nbsp;
                            图书作者：<input name="author" value="">&nbsp;&nbsp;&nbsp;&nbsp;
                            出版社：<input name="press" value="">&nbsp;&nbsp;&nbsp;&nbsp;
                            <input class="btn btn-default" type="submit" value="查询">
                        </form>
                    </div>
                </div>
                <!--工具栏 数据搜索 /-->
                <!-- 数据列表 -->
                <div class="table-box">
                    <!-- 数据表格 -->
                    <table id="dataList" class="table table-bordered table-striped table-hover dataTable text-center">
                        <thead>
                        <tr>
                            <th class="sorting_asc">图书名称</th>
                            <th class="sorting">图书作者</th>
                            <th class="sorting">借阅时间</th>
                            <th class="sorting">预计归还时间</th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="b" items="${books}">
                               <tr>
                                   <td> ${b.name} </td>
                                   <td>${b.author}</td>
                                   <td>
                                       <fmt:formatDate pattern="yyyy-MM-dd"
                                                       value="${b.currentRecoder.borrowtime}" />
                                   </td>
                                   <td>
                                       <fmt:formatDate pattern="yyyy-MM-dd"
                                                       value="${b.currentRecoder.remandtime}" />
                                   </td>
                               </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!--数据表格/-->
                </div>
                <!--数据列表/-->
            </div>
            <!-- /.box-body -->
        </div>
    </div>
</body>
</html>
