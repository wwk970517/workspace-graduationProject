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
	function tipOpen(content) {
		return confirm(content);
	}
	function tipClose() {
		$("#tip").fadeOut(200);
	}
	function searchItem(num) {
		var currPage = document.getElementById("currPage");
		if (num == 0) {
			currPage.value = 1;
		} else {
			if (num == 2) {
				currPage.value = document.getElementById("maxPage").value;
			} else {
				currPage.value = parseInt(currPage.value) + parseInt(num);
			}
		}
		document.getElementById("myItem").submit();
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
                <span>代办事项管理页面</span>
            </div>
            <form action="item/itemList.do" method="post" id="myItem">
            <input type="hidden" name="userId"  value="${loginUser.userId}" />
            <div class="search">
                <span>事项标题：</span>
                
                <input type="text" name="itemTitle"  value="${filter['itemTitle'] }" />
                
                <span>事项内容：</span>
                <input type="text" name="itemContent"  value="${filter['itemContent'] }" />

                <span>优先级</span>
                <select name="priority">
               		<option value="">请选择</option>
                    <option value="low"  
                    <c:if test="${filter['priority'].equals('low') }">selected="selected"</c:if>>低</option>
					<option value="middle"
					<c:if test="${filter['priority'].equals('middle') }">selected="selected"</c:if>>中</option>
                    <option value="high"
                    <c:if test="${filter['priority'].equals('high') }">selected="selected"</c:if>>高</option>
                </select>
                <input type="hidden" name="currPage" id="currPage"
				value="${page.currPage}"><input type="hidden" id="maxPage"
				value="${page.totalPage }">
                <input type="button" value="查询"  onclick="searchItem(0)"/>
                <a href="itemAdd.jsp">添加事项</a>
            </div>
            </form>
            <!--账单表格 样式和供应商公用-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="5%">编号</th>
                    <th width="10%">标题</th>
                    <th width="10%">内容</th>
                    <th width="5%">优先级</th>
                    <th width="10%">创建时间</th>
                    <th width="10%">更新时间</th>
                    <th width="30%">操作</th>
                </tr>
                <c:forEach items="${itemList }" var="item" varStatus="status">
                <tr>
                    <td>${status.count} </td>
                    <td>${item.itemTitle} </td>
                    <td>${item.itemContent}</td>
                    <td>${item.priority}</td>
                    <td><fmt:formatDate value="${item.creationDate}"
								pattern="yyyy-MM-dd" /></td>
                    <td><fmt:formatDate value="${item.lastUpdateDate}"
								pattern="yyyy-MM-dd" /></td>
                    <td>
                        <a href="item/itemView.do?itemId=${item.itemId}"><img src="img/read.png" alt="查看" title="查看"/></a>
                        <a href="item/itemUpdate.do?itemId=${item.itemId}"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="item/itemDel.do?itemId=${item.itemId}"   class="removeBill"><img src="img/schu.png" alt="删除" title="删除"/></a>
                    </td>
                </tr>
                </c:forEach>
            </table>
            <div class="pagin">
			<div class="message">
				共<i class="blue">${page.totalSize }</i>条记录，当前显示第&nbsp;<i
					class="blue">${page.currPage }&nbsp;</i>页
			</div>
			<div style="text-align: right">
				<a href="javaScript:void(0)" onclick="searchItem(0)">首页</a>
				<c:if test="${page.currPage>1 }">
					<a href="javaScript:void(0)" onclick="searchItem(-1)">上一页</a>
				</c:if>
				<c:if test="${page.currPage<page.totalPage }">
					<a href="javaScript:void(0)" onclick="searchItem(1)">下一页</a>
				</c:if>
				<a href="javaScript:void(0)" onclick="searchItem(2)">末页</a>
			</div>
		</div>
        </div>
    </section>	
    <footer class="footer">
    </footer>

<script src="js/jquery.js"></script>
<script src="js/js.js"></script>
<script src="js/time.js"></script>

</body>
</html>