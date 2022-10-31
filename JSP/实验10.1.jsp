<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	h3{text-align:center}
	table,th,td{border:1px solid black
</style>
<body bgcolor = pink>	
	<h3>已添加学生信息</h3><hr>
	<%

		String id = request.getParameter("id");
        String name = request.getParameter("name");
        byte b1[]=name.getBytes("ISO-8859-1");
    	name=new String(b1,"UTF-8");
		String sex = request.getParameter("sex");
		byte b2[]=sex.getBytes("ISO-8859-1");
    	sex=new String(b2,"UTF-8");
		String age = request.getParameter("age");		
		String weight = request.getParameter("weight");

		
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test?"
					+ "useUnicode=true&characterEncoding=gbk";
		Connection con = DriverManager.getConnection(url, "root", "123456");
		String sql="insert into student values('"+id+"','"+name+"','"+sex+"',"+age+","+weight+")";
		Statement sta = con.createStatement();
		sta.executeUpdate(sql);
		sta.close();
        con.close();
%>
	<h3>已更改学生信息</h3><hr>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	String url1 = "jdbc:mysql://localhost:3306/test?"
				+ "useUnicode=true&characterEncoding=gbk";
	Connection con1 = DriverManager.getConnection(url1, "root", "123456");
	String sql1="update student set age=18 where age = 21";
	Statement sta1 = con1.createStatement();
	sta1.executeUpdate(sql1);
	sta1.close();
    con1.close();
	%>
	<h3>已删除学生信息</h3><hr>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	String url11 = "jdbc:mysql://localhost:3306/test?"
				+ "useUnicode=true&characterEncoding=gbk";
	Connection con11 = DriverManager.getConnection(url11, "root", "123456");
	String sql11="delete from student where sex='男'";
	Statement sta11 = con11.createStatement();
	sta11.execute(sql11);
	sta11.close();
    con11.close();
	%>
	<h3>经过以上操作后，数据库中有以下记录</h3><hr>
	<table align="center" bgcolor=blue>
		<tr>
			<th width="80" align="center">学号</th>
			<th width="80" align="center">姓名</th>
			<th width="80" align="center">性别</th>
			<th width="80" align="center">年龄</th>
			<th width="80" align="center">体重</th>
		</tr>
		<%
			Class.forName("com.mysql.jdbc.Driver");
			String url2 = "jdbc:mysql://localhost:3306/test?"
					+ "useUnicode=true&characterEncoding=utf-8";
			Connection con2 = DriverManager.getConnection(url, "root", "123456");
			Statement sta2 = con2.createStatement();
			String sql2 = "select * from student";
			ResultSet res = sta2.executeQuery(sql2);
			while(res.next()){
		%>
		<tr>
			<td><%=res.getString("id") %></td>
			<td><%=res.getString("name") %></td>
			<td><%=res.getString("sex") %></td>
			<td><%=res.getString("age") %></td>
			<td><%=res.getString("weight") %></td>
		</tr>
		<%}res.close();
			sta2.close();
			con2.close();
		%>
	</table>
	<hr>
</body>
</html>