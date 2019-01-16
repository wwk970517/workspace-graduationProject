<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="../../include/taglib.jsp"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
     <base href="<%=path%>/">
    <title>朝腾科技超市账单管理系统</title>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>朝腾科技超市账单管理系统</h1>

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
                	<li id="active"><a href="itemList.jsp">代办事项管理</a></li>
                    <li><a href="userManager.jsp">个人信息管理</a></li>
                    <li><a href="password.jsp">密码修改</a></li>
                    <li><a href="login.jsp">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>账单管理页面 >> 信息查看</span>
        </div>
        <div class="providerView">
            <p><strong>事项标题：</strong><span>${item.itemTitle}</span></p>
            <p><strong>事项内容：</strong><span>${item.itemContent}</span></p>
            <p><strong>优先级：</strong><span>${item.priority}</span></p>
            <p><strong>创建时间：</strong><span><fmt:formatDate value="${item.creationDate}"
								pattern="yyyy-MM-dd hh:mm:ss" /></span></p>
            <p><strong>最近一次修改：</strong><span><fmt:formatDate value="${item.lastUpdateDate}"
								pattern="yyyy-MM-dd hh:mm:ss" /></span></p>
            <a href="itemList.jsp">返回</a>
        </div>
    </div>
</section>
<footer class="footer">
</footer>
<script src="js/time.js"></script>

</body>
</html>