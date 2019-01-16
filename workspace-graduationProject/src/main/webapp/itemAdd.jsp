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
    <title>个人代办事项管理系统</title>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/style.css"/>
     <script type="text/javascript">
	function submit() {
		document.getElementById("itemAdd").submit();
	}
</script>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>个人代办事项管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> Admin</span> , 欢迎你！</p>
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
            <span>代办事项管理>> 事项添加页面</span>
        </div>
        <div class="providerAdd">
            <form action="item/itemAdd.do" method="post" id="itemAdd">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="billId">事项标题：</label>
                    <input type="hidden" name="userId" value="${loginUser.userId}"/>
                    <input type="text" name="itemTitle" id="billId" required/>
                    <span>*请输入事项标题</span>
                </div>
                <div>
                    <label for="billName">事项内容：</label>
                    <input type="text" name="itemContent" id="billName" required/>
                    <span >*请输入事项内容</span>
                </div>
                <div>
                    <label >优先级：</label>
                    <select name="priority" >
                        <option value="low">低</option>
                        <option value="middle">中</option>
                        <option value="high">高</option>
                    </select>
                    <span>*请选择优先级</span>
                </div>
                <div>
                    <label for="billName">备注：</label>
                    <input type="text" name="comments" id="billName" />
                    <span >*请输入备注</span>
                </div>
                <div class="providerAddBtn">
                    <input type="button" value="保存" onclick="submit()"/>
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