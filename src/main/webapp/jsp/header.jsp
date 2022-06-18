<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false"%>
<!-- 页面头部 -->
<header class="main-header">
    <!-- Logo -->
    <a href="/admin/main.jsp" class="logo">
        <span class="logo-lg"><b>云借阅-图书管理系统</b></span>        </a>
    <!-- 头部导航 -->
    <nav class="navbar navbar-static-top">
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown user user-menu">
                    <a>
                        <img src="img/user.jpg" class="user-image" alt="User Image">
                        <span class="hidden-xs">${user.name}</span>
                    </a>
                </li>
                <li class="dropdown user user-menu">
                    <a href="${pageContext.request.contextPath}/logout.do">
                        <span class="hidden-xs">注销</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</header>
<!-- 页面头部 /-->
