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
	padding-top: 120px;
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
}
</style>
</head>
<body>
	<nav class="navbar">
		<a href="index.jsp">Home</a> <a href="admin.jsp">Admin</a><a
			href="user.jsp">User</a>

	</nav>
	<h1>ADD BOOK:</h1>
	<div class="container">
		<form class="form-inline" action="add.jsp" method="post" onsubmit="myFunction()"
			style="margin: auto; max-width: 300px">
			<input type="text" name="name" class="form-control"
				placeholder="book name.."> <input type="text" name="author"
				class="form-control" placeholder="author.."> <input
				type="text" name="year" class="form-control"
				placeholder="released year..">
			<button type="submit" name="save">ADD</button>
		</form>
	</div>
	<script>
		function myFunction() {
			alert("Data added successfully");
		}
	</script>
	<br>
	<br>
	<table>
		<%
		String name, author, year;
		name = request.getParameter("name");
		author = request.getParameter("author");
		year = request.getParameter("year");
		%>
		<%
		String url = "jdbc:mysql://localhost:3306/libraryy";
		String uname = "root";
		String password = "Nithesh@3763";
		String query = "INSERT INTO book_details(title,author,released_year) VALUES('" + name + "','" + author + "','" + year
				+ "')";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			Connection con = DriverManager.getConnection(url, uname, password);
			Statement statement = con.createStatement();
			int n = statement.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		%>
	</table>
</body>
</html>