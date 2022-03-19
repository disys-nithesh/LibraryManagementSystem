<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="ISO-8859-1">
<title>Library Management System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@600&display=swap" />
<link rel="stylesheet" href="style.css" />
<style>
h1 {
	padding-top: 50px;
	padding-left: 600px;
}

.container {
	padding-top: 15px;
	padding-left: 100px;
}

form.form-inline input[type=text] {
	margin: 10px;
}

form.form-inline button {
	margin-left: 10px;
	padding: 8px;
	width: 27%;
}
</style>
</head>
<body>
	<nav class="navbar">
		<a href="index.jsp">Home</a> <a href="admin.jsp">Admin</a><a
			href="user.jsp">User</a>
	</nav>
	<h1>UPDATE BOOK:</h1>
	<div class="container">
		<form class="form-inline" action="user_update.jsp" method="get"
			style="margin: auto; max-width: 300px">
			<input type="text" name="isid" class="form-control"
				placeholder="issue id..">
			<button type="submit" name="save">SUBMIT</button>
		</form>
	</div>
	<br>
	<br>

	<%
	String isid;
	isid = request.getParameter("isid");
	%>
	<%
	String url = "jdbc:mysql://localhost:3306/libraryy";
	String uname = "root";
	String password = "Nithesh@3763";
	String query = "SELECT * FROM book_register WHERE issue_id=" + isid;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	try {
		Connection con = DriverManager.getConnection(url, uname, password);
		Statement statement = con.createStatement();
		ResultSet result = statement.executeQuery(query);
		while (result.next()) {
	%>
	<form class="form-inline" action="user_update.jsp" method="get"
		style="margin: auto; max-width: 300px" onsubmit="myFunction()">
		<input type="text" name="id" class="form-control"
			value="<%=result.getInt("book_id")%>" readonly> <input
			type="text" name="stid" class="form-control"
			value="<%=result.getInt("roll_number")%>" readonly> <input
			type="text" name="isid" class="form-control"
			value="<%=result.getInt("issue_id")%>" readonly> <input
			type="text" name="bdate" class="form-control"
			value="<%=result.getString("borrowed_date")%>" readonly> <input
			type="text" name="rdate" class="form-control"
			placeholder="return date.." required>
		<button type="submit" value="Update" name="save">UPDATE</button>
	</form>
	<script>
		function myFunction() {
			alert("Data Updated successfully");
		}
	</script>

	<%
	}
	} catch (SQLException e) {
	e.printStackTrace();
	}
	String rdate;
	rdate = request.getParameter("rdate");
	String query1 = "UPDATE book_register SET returned_date='" + rdate + "' WHERE issue_id=" + isid;
	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e) {
	e.printStackTrace();
	}
	try {
	Connection con = DriverManager.getConnection(url, uname, password);
	Statement statement = con.createStatement();
	int n = statement.executeUpdate(query1);
	} catch (SQLException e) {
	e.printStackTrace();
	}
	%>
	<script>
		function myFunc() {
			window.location.href = "admin.jsp";
		}
	</script>
</body>
</html>