<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Library Management System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">AMStudy</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="/">Books List</a></li>
				<li><a href="newBook">Add New Book</a></li>
			</ul>
			<form class="navbar-form navbar-left" action="/">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search"
						name="keyword">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
						<button class="btn btn-default" type="submit"
							onclick="clearFilter()">
							<i class="glyphicon glyphicon-refresh"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</nav>

	<div class="container">
		<c:choose>
			<c:when test="${mode == 'BOOK_VIEW'}">
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Book Name</th>
							<th>Author</th>
							<th>Price</th>
							<th>Purchase Date</th>
							<th colspan="2">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="book" items="${books}">
							<tr>
								<td>${book.id}</td>
								<td>${book.bookName}</td>
								<td>${book.author}</td>
								<td>${book.price}</td>
								<td>${book.purchaseDate}</td>
								<td><a href="updateBook?id=${book.id}"><div
											class="glyphicon glyphicon-pencil"></div></a> &nbsp;&nbsp;&nbsp;
									<a href="deleteBook?id=${book.id}"><div
											class="glyphicon glyphicon-trash"></div></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:when test="${mode == 'BOOK_EDIT' || mode == 'BOOK_NEW'}">
				<form class="form-horizontal" action="saveBook" method="post">
					<input type="hidden" class="form-control" value="${book.id}"
						id="id" name="id">
					<div class="form-group">
						<label class="control-label col-sm-2" for="bookName">Book
							Name:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" value="${book.bookName}"
								id="bookName" placeholder="Enter Book Name" name="bookName">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="author">Author:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" value="${book.author}"
								id="author" placeholder="Enter Author" name="author">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="price">Price:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" value="${book.price}"
								id="price" placeholder="Enter Price" name="price">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="purchaseDate">Purchase
							Date:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control"
								value="${book.purchaseDate}" id="purchaseDate"
								placeholder="Enter Purcahse Date" name="purchaseDate">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">Submit</button>
						</div>
					</div>
				</form>
			</c:when>
		</c:choose>
	</div>
	<script type="text/javascript">
		function clearFilter() {
			window.location = '/'
		}
	</script>
</body>
</html>