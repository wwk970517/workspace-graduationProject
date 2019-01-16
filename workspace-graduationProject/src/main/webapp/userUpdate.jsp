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
     <script type="text/javascript">
	function submit() {
		document.getElementById("myForm").submit();
	}
</script>
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
            <span>个人信息管理页面 >> 个人信息修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="user/userSave.do" method="post" id="myForm">
                <input type="hidden" name="userId" value="${loginUser.userId}"/>
                <div>
                    <label for="userName">名称：</label>
                    <input type="text" name="userName" id="userName" placeholder="${user.userName}"/>
                    <span >*</span>
                </div>
                <div>
                    <label >性别：</label>
                    <select name="sex">
                        <option value="男" selected="selected">男</option>
                        <option value="女" >女</option>
                    </select>
                </div>
                <div>
                    <label for="data">年龄：</label>
                    <input type="text" name="age" id="data" placeholder="${user.age}"/>
                    <span >* ${error}</span>
                </div>
                <div>
                    <label for="userphone">电话：</label>
                    <input type="text" name="phoneNumber" id="userphone" placeholder="${user.phoneNumber}"/>
                    <span >* ${error1}</span>
                </div>
                <div>
                    <label for="comments">备注：</label>
                    <input type="text" name="comments" id="userAddress" placeholder="${user.comments}"/>
                </div>              
                <div class="providerAddBtn">
                    <input type="button" value="保存"   onclick="submit()"/>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>
    </div>
</section>
<footer class="footer">
</footer>
<script src="js/time.js"></script>
</body>
</html>