<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	pageContext.setAttribute("App_Path", request.getContextPath());
%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>员工列表</title>
<script type="text/javascript" src="${App_Path }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${App_Path }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${App_Path }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" />

</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h1>SSM_CRUD</h1>
		</div>
	</div>
	<div class="row col-md-3 col-md-offset-9">
		<button class="btn  btn-primary"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"/>新增</button>
		<button class="btn btn-danger"><span class="glyphicon glyphicon-trash" aria-hidden="true"/>删除</button>
	</div>
	<div class="row">
		<table class="table table-hover">
			<tr>
				<th>id</th>
				<th>name</th>
				<th>email</th>
				<th>sex</th>
				<th>dept_name</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${page.list }" var="emp">
				<tr>
					<td>${emp.empId}</td>
					<td>${emp.empName}</td>
					<td>${emp.email}</td>
					<td>${emp.sex=="M"?"男":"女"}</td>
					<td>${emp.department.deptName}</td>
					<td>
						<button class="btn btn-info btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true"/>编辑</button>
						<button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash" aria-hidden="true"/>删除</button>
					</td>
				</tr>
			</c:forEach>
			
		</table>
	</div>
	<div class="row  col-md-offset-1">
		共有${page.pages }页、${page.total }条记录
	</div>
	<div class="row col-md-offset-5">
		<nav aria-label="...">
		  <ul class="pagination">
		  	<li><a href="${App_Path }/emps?pn=1">首页</a></li>
		  	<c:if test="${page.hasPreviousPage }">
		  		<li><a href="${App_Path }/emps?pn=${page.pageNum-1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
		  	</c:if>
		    
		    <c:forEach items="${page.navigatepageNums}" var="pagenum">
		    	<c:if test="${pagenum==page.pageNum }">
		    		<li class="active"><a href="#">${pagenum} <span class="sr-only">(current)</span></a></li>
		    	</c:if>
		    	<c:if test="${pagenum!=page.pageNum }">
		    		<li><a href="${App_Path }/emps?pn=${pagenum}">${pagenum}</a></li>
		    	</c:if>
		    </c:forEach>
		    <c:if test="${page.hasNextPage }">
		  		<li ><a href="${App_Path }/emps?pn=${page.pageNum+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
		  	</c:if>
		    
		    <li><a href="${App_Path }/emps?pn=${page.pages}">末页</a></li>
		  </ul>
		</nav>
	</div>
</div>
</body>
</html>