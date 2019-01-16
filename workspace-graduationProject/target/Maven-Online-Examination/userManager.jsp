<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
     <base href="<%=path%>/">
    <title>个人代办事项管理系统</title>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>个人代办事项管理系统</h1>

    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> ${loginUser.userName}</span> , 欢迎你！</p>
        <a href="login.jsp">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                	<li><a href="itemList.jsp">代办事项管理</a></li>
                    <li id="active"><a href="userManager.jsp">个人信息管理</a></li>
                    <li ><a href="password.jsp">密码修改</a></li>
                    <li><a href="login.jsp">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>个人信息管理</span>
        </div>
        <div class="search">
            <span>用户id：${loginUser.userId}</span>
            <ul>
				<li ><a style="float: left; background: #47acf1 url(img/search.png) 10px center no-repeat" href="user/getUserInfo.do?userId=${loginUser.userId}">查看个人信息</a></li>
				<li ><a style="float: left; background: #47acf1 url(img/xiugai.png) 10px center no-repeat" href="user/userUpdate.do?userId=${loginUser.userId}">修改个人信息</a></li>
			</ul>
        </div>
        <!--供应商操作表格-->
    </div>
</section>



<footer class="footer">
</footer>

<script src="js/jquery.js"></script>
<script src="js/js.js"></script>
<script src="js/time.js"></script>

</body>
</html>