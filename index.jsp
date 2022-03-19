<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
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
</head>
<body>
	<nav class="navbar">
		<a href="index.jsp">Home</a> <a href="admin.jsp">Admin</a><a
			href="user.jsp">User</a>
	</nav>
	<div class="container">
		<form class="form-inline" method="post" action="index.jsp"
			style="margin: auto; max-width: 300px">
			<input type="text" name="book_name" class="form-control"
				placeholder="Search book name..">
			<button type="submit" name="save">
				<i class="fa fa-search"></i>
			</button>
		</form>
	</div>
	<div class="section">
		<table>
			<%
			String name;
			name = request.getParameter("book_name");
			%>
			<%
			String url = "jdbc:mysql://localhost:3306/libraryy";
			String uname = "root";
			String password = "Nithesh@3763";
			String query = "SELECT * FROM book_details WHERE title LIKE '%" + name + "%'";

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			try {
				Connection con = DriverManager.getConnection(url, uname, password);
				Statement statement = con.createStatement();
				ResultSet result = statement.executeQuery(query);
				if (name != null) {
					out.println("<tr>");
					out.println("<th>TITLE</th>");
					out.println("<th>AUTHOR</th>");
					out.println("<th>RELEASED YEAR</th>");
					out.println("</tr>");
					while (result.next()) {
				out.println("<tr>");
				out.println("<td>" + result.getString("title") + "</td>");
				out.println("<td>" + result.getString("author") + "</td>");
				out.println("<td>" + result.getInt("released_year") + "</td>");
				out.println("</tr>");
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			%>
		</table>
	</div>

	<footer id="contacts">
		<h3>Copyright © by Nithesh N</h3>
		<a href="https://www.linkedin.com/in/nithesh-n-1592a81a0/"
			target="block"><img src="./img/linkedin.svg" alt="linkedin"></a>
		<a href="https://github.com/Nithesh7477" target="block"><img
			src="./img/github.svg" alt="github"></a> <a
			href="https://nithesh7477@gmail.com" target="block"><img
			src="./img/mail.svg" alt="mail"></a>
	</footer>
</body>
</html>