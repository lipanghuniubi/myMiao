<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<script type="text/javascript">
	function myfunction() {
		if (document.getElementById("id").value == '') {
			alert("学号不能为空");
			return false;
		}
		if (document.getElementById("name").value == '') {
			alert("姓名不能为空");
			return false;
		}
		if (document.getElementById("age").value == '') {
			alert("年龄不能为空");
			return false;
		}
		if (document.getElementById("sex").value == '') {
			alert("性别不能为空");
			return false;
		}
		if (document.getElementById("weight").value == '') {
			alert("体重不能为空");
			return false;
		}
		return true;
	}
</script>
<body bgcolor="purple">
	<div>
		<h3>输入要添加的学生信息</h3>
	<hr>
	<form action="实验10.1.jsp" method="post">
		学号<input type="text" id = "id" name="id" onkeyup="this.value=this.value.replace(/\D/g,'')">（请输入数字）<br>
		姓名<input type="text" id = "name" name="name"><br> 
		性别<input type="text" id = "sex" name="sex"><br> 
		年龄<input type="text" id = "age" name="age" onkeyup="this.value=this.value.replace(/\D/g,'')">（请输入数字）<br>
		体重<input type="text" id = "weight" name="weight" onkeyup="this.value=this.value.replace(/\D/g,'')">（请输入数字）<br></br>
		&emsp;&emsp;<input type="submit" value="提  交" onclick="return myfunction()">&emsp;&emsp;
		&emsp;&emsp;<input type="reset" value="取  消">
	</form>
	</div>
</body>
</html>