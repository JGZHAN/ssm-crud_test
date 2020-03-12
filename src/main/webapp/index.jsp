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
<!-- 模态框div -->
<div class="modal fade" id="add_emp_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">员工添加</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="add_emp_form">
					<div class="form-group">
						<label  class="col-sm-2 control-label">员工姓名(EmpName)</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="empName" id="EmpName_add_input" placeholder="员工姓名(EmpName)">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label">邮箱(Email)</label>
						<div class="col-sm-10">
							<input type="email" class="form-control"  name="email" id="Email_add_input" placeholder="邮箱(Email) 例如：Email@zhan.com">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10">
							<label  class="col-sm-2 control-label">性别(sex)</label>
							<label class="radio-inline">
								<input type="radio" name="sex" name="sex"  id="sex_add_input1" value="M" checked="checked"> 男
							</label>
							<label class="radio-inline">
								<input type="radio" name="sex"  name="dId" id="sex_add_input2" value="W"> 女
							</label>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label">所在部门(dept)</label>
						<div class="col-sm-5">
							<select class="form-control"  name="dId" id="Dept_add_input">

							</select>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭(Close)</button>
				<button type="button" class="btn btn-primary" id="add_emp_save_but">保存(Save changes)</button>
			</div>
		</div>
	</div>
</div>




<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h1>SSM_CRUD</h1>
		</div>
	</div>
	<div class="row col-md-3 col-md-offset-9">
		<button class="btn  btn-primary" id="add_emp_modal_btn"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"  />新增</button>
		<button class="btn btn-danger"><span class="glyphicon glyphicon-trash" aria-hidden="true"/>删除</button>
	</div>
	<div class="row">
		<table class="table table-hover" id="emps_tb">
			<thead>
			<tr>
				<th>选择(select)</th>
				<th>身份码(id)</th>
				<th>姓名(name)</th>
				<th>性别(sex)</th>
				<th>邮箱(email)</th>
				<th>所在部门(dept_name)</th>
				<th>操作(operating)</th>
			</tr>
			</thead>
			<tbody>

			</tbody>


		</table>
	</div>
	<div class="row  col-md-offset-1" id="page_info_area">
		共有页、条记录
	</div>
	<div class="row col-md-offset-5" id="page_nav_area">

	</div>
</div>
<script type="text/javascript">

	var totalRecord,currentPage;
	//1、页面加载完成以后，直接去发送ajax请求,要到分页数据
	$(function(){
		//去首页
		to_page(1);
	});

	function to_page(pn){
		$.ajax({
			url:"${App_Path}/emps",
			data:"pn="+pn,
			type:"GET",
			success:function(result){
				//console.log(result);
				//1、解析并显示员工数据
				build_emps_table(result);
				//2、解析并显示分页信息
				build_page_info(result);
				//3、解析显示分页条数据
				build_page_nav(result);
			}
		});
	}

	function build_emps_table(result){
		//清空table表格
		$("#emps_tb tbody").empty();
		var emps = result.map.page.list;
		$.each(emps,function(index,item){
			var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
			var empIdTd = $("<td></td>").append(item.empId);
			var empNameTd = $("<td></td>").append(item.empName);
			var genderTd = $("<td></td>").append(item.sex=='M'?"男":"女");
			var emailTd = $("<td></td>").append(item.email);
			var deptNameTd = $("<td></td>").append(item.department.deptName);
			/**
			 <button class="">
			 <span class="" aria-hidden="true"></span>
			 编辑
			 </button>
			 */
			var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
					.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
			//为编辑按钮添加一个自定义的属性，来表示当前员工id
			editBtn.attr("edit-id",item.empId);
			var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
					.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
			//为删除按钮添加一个自定义的属性来表示当前删除的员工id
			delBtn.attr("del-id",item.empId);
			var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
			//var delBtn =
			//append方法执行完成以后还是返回原来的元素
			$("<tr></tr>").append(checkBoxTd)
					.append(empIdTd)
					.append(empNameTd)
					.append(genderTd)
					.append(emailTd)
					.append(deptNameTd)
					.append(btnTd)
					.appendTo("#emps_tb tbody");
		});
	}
	//解析显示分页信息
	function build_page_info(result){
		$("#page_info_area").empty();
		$("#page_info_area").append("当前"+result.map.page.pageNum+"页,总"+
				result.map.page.pages+"页,总"+
				result.map.page.total+"条记录");
		totalRecord = result.map.page.total;
		currentPage = result.map.page.pageNum;
	}
	//解析显示分页条，点击分页要能去下一页....
	function build_page_nav(result){
		//page_nav_area
		$("#page_nav_area").empty();
		var ul = $("<ul></ul>").addClass("pagination");

		//构建元素
		var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
		var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
		if(result.map.page.hasPreviousPage == false){
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		}else{
			//为元素添加点击翻页的事件
			firstPageLi.click(function(){
				to_page(1);
			});
			prePageLi.click(function(){
				to_page(result.map.page.pageNum -1);
			});
		}



		var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
		var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
		if(result.map.page.hasNextPage == false){
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		}else{
			nextPageLi.click(function(){
				to_page(result.map.page.pageNum +1);
			});
			lastPageLi.click(function(){
				to_page(result.map.page.pages);
			});
		}



		//添加首页和前一页 的提示
		ul.append(firstPageLi).append(prePageLi);
		//1,2，3遍历给ul中添加页码提示
		$.each(result.map.page.navigatepageNums,function(index,item){

			var numLi = $("<li></li>").append($("<a></a>").append(item));
			if(result.map.page.pageNum == item){
				numLi.addClass("active");
			}
			numLi.click(function(){
				to_page(item);
			});
			ul.append(numLi);
		});
		//添加下一页和末页 的提示
		ul.append(nextPageLi).append(lastPageLi);

		//把ul加入到nav
		var navEle = $("<nav></nav>").append(ul);
		navEle.appendTo("#page_nav_area");
	}
	$("#add_emp_modal_btn").click(function(){
		$("#Dept_add_input").empty();
		getdept();
		$("#add_emp_modal").modal( );
	});
	function getdept() {
		$.ajax({
			url: "${App_Path}/getdept",
			type: "GET",
			success:function (data) {
				// {"code":100,"message":"处理成功","map":{"dept":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}

				$.each(data.map.dept,function () {
					var option=$("<option></option>").append(this.deptName).attr("value",this.deptId);
					option.appendTo("#Dept_add_input");
				})

			}
		})
	}
	$("#add_emp_save_but").click(function () {
		alert($("#add_emp_form").serialize());
		$.ajax({
				url:"${App_Path}/emp",
				type:"POST",
				data:$("#add_emp_form").serialize(),
				success:function (data) {
					// empName=test&email=test%40zhan.com&sex=M&dId=1
					$('#add_emp_modal').modal('hide');
					to_page(totalRecord);
				}
		})
	});
</script>
</body>
</html>