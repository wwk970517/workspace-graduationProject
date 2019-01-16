<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../include/taglib.jsp"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8s">
    <base href="<%=path%>/">
    <title>系统登录 - 个人代办事项管理系统</title>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body class="login_bg">
    <section class="loginBox">
        <header class="loginHeader">
            <h1>个人代办事项管理系统</h1>
        </header>
        <section class="loginCont">
            <form class="loginForm" action="user/login.do" method="post">
                <div class="inputbox">
                    <label for="user">用户名：</label>
                    <input id="user" type="text" name="userName" placeholder="请输入用户名" required/>
                </div>
                <div class="inputbox">
                    <label for="mima">密码：</label>
                    <input id="mima" type="password" name="password" placeholder="请输入密码" required/>
                </div>

                <div class="subBtn">
                    <input type="submit" value="登录" />
                    <input type="reset" value="重置"/> <br/> 
                </div>
                <span style="color: red;font-size: 16px">${error110}</span>      
            </form>
        </section>
    </section>
</body>
</html>