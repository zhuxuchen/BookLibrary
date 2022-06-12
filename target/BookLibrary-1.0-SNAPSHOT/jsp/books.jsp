<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <h3 class="box-title">图书借阅</h3>
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
                        <th class="sorting">出版社</th>
                        <th class="sorting">标准ISBN</th>
                        <th class="sorting">书籍状态</th>
                        <th class="sorting">借阅人</th>
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
                        <td>${b.press}</td>
                        <td>${b.isbn}</td>
                        <td>
                                ${b.currentRecoder == null ? '可借阅':'不可借'}
                        </td>
                        <td>
                            <c:if test="${b.currentRecoder != null}">
                                ${b.currentRecoder.user.name}
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${b.currentRecoder != null}">
                                ${b.currentRecoder.borrowtime}
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${b.currentRecoder != null}">
                                ${b.currentRecoder.remandtime}
                            </c:if>
                        </td>
                        <td class="text-center">
                            <c:if test="${b.currentRecoder != null}">
                                <button type="button" disabled="disabled" class="btn bg-olive btn-xs"> 借阅
                                </button>
                            </c:if>
                            <c:if test="${b.currentRecoder == null}">
                                <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#borrowModal" onclick="findBookById(${b.id},&#39;borrow&#39;)"> 借阅
                                </button>
                            </c:if>
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

<!-- 图书借阅信息的模态窗口，默认是隐藏的 -->
<div class="modal fade" id="borrowModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel">图书信息</h3>
            </div>
            <div class="modal-body">
                <form id="borrowBook">
                    <span><input type="hidden" id="bid" name="id" value="7"></span><table class="table table-bordered table-striped" width="800px">

                    <tbody><tr>
                        <td>图书名称</td>
                        <td><input class="form-control" readonly="" name="name" id="bname"></td>
                        <td>标准ISBN</td>
                        <td><input class="form-control" readonly="" name="isbn" id="bisbn"></td>
                    </tr>
                    <tr>
                        <td>出版社</td>
                        <td><input class="form-control" readonly="" name="press" id="bpress"></td>
                        <td>作者</td>
                        <td><input class="form-control" readonly="" name="author" id="bauthor"></td>
                    </tr>
                    <tr>
                        <td>书籍页数</td>
                        <td><input class="form-control" readonly="" name="pagination" id="bpagination"></td>
                        <td>归还时间<br><span style="color: red">*</span></td>

                        <td><input class="form-control" type="date" name="returnTime" id="time" onchange="cg()">
                        </td>
                    </tr>
                    </tbody></table>
                </form>
            </div>
            <div class="modal-footer">

                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" onclick="borrow()" disabled="disabled" id="savemsg">保存
                </button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>


<!-- 添加和编辑图书的模态窗口 -->
<div class="modal fade" id="addOrEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel">图书信息</h3>
            </div>
            <div class="modal-body">
                <form id="addOrEditBook">
                    <span><input type="hidden" id="ebid" name="id" style=""></span>
                    <table id="addOrEditTab" class="table table-bordered table-striped" width="800px">

                        <tbody><tr>
                            <td>图书名称</td>
                            <td><input class="form-control" placeholder="图书名称" name="name" id="ebname" style=""></td>
                            <td>标准ISBN</td>
                            <td><input class="form-control" placeholder="标准ISBN" name="isbn" id="ebisbn" style=""></td>
                        </tr>
                        <tr>
                            <td>出版社</td>
                            <td><input class="form-control" placeholder="出版社" name="press" id="ebpress" style=""></td>
                            <td>作者</td>
                            <td><input class="form-control" placeholder="作者" name="author" id="ebauthor" style=""></td>
                        </tr>
                        <tr>
                            <td>书籍页数</td>
                            <td><input class="form-control" placeholder="书籍页数" name="pagination" id="ebpagination" style=""></td>
                            <td>书籍价格<br></td>
                            <td><input class="form-control" placeholder="书籍价格" name="price" id="ebprice" style=""></td>
                        </tr>
                        <tr>
                            <td>上架状态</td>
                            <td>
                                <select class="form-control" id="ebstatus" name="status">
                                    <option value="0">上架</option>
                                    <option value="3">下架</option>
                                </select>
                            </td>
                        </tr>
                        </tbody></table>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" id="aoe" onclick="addOrEdit()">保存
                </button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
