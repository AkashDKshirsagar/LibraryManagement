<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Contact Manager</title>
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
				<a class="navbar-brand" href="#">FIND</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="/"><i class="glyphicon glyphicon-list-alt">
							List</i></a></li>
				<li><a href="newContact"><i
						class="glyphicon glyphicon-file"> New</i></a></li>
			</ul>
			<form class="navbar-form navbar-left" action="/">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search"
						name="keyword">
					<div class="input-group-btn">
						<button type="submit" class="btn btn-default">
							<i class="glyphicon glyphicon-search"></i>
						</button>
						<button type="submit" class="btn btn-default" onclick="clearFilter()">
							<i class="glyphicon glyphicon-refresh"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</nav>

	<div class="container">
		<c:choose>
			<c:when test="${mode == 'CONTACT_VIEW'}">
				<h2>Contact List</h2>
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Mob.No.</th>
							<th colspan="2">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="contact" items="${contacts}">
							<tr>
								<td>${contact.id}</td>
								<td>${contact.firstName}</td>
								<td>${contact.lastName}</td>
								<td>${contact.number}</td>
								<td><a href="updateContact?id=${contact.id}"><div
											class="glyphicon glyphicon-pencil"></div></a> &nbsp;&nbsp; <a
									href="deleteContact?id=${contact.id}"><div
											class="glyphicon glyphicon-trash"></div></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:when test="${mode == 'CONTACT_EDIT' || mode == 'CONTACT_NEW'}">
				<form action="saveContact" method="post">
					<input type="hidden" class="form-control" id="id"
						value="${contact.id}" name="id">
					<div class="form-group">
						<label for="firstName">First Name:</label> <input type="text"
							class="form-control" value="${contact.firstName}" id="firstName"
							placeholder="Enter first name" name="firstName">
					</div>
					<div class="form-group">
						<label for="lastName">Last Name:</label> <input type="text"
							class="form-control" value="${contact.lastName}" id="lastName"
							placeholder="Enter last name" name="lastName">
					</div>
					<div class="form-group">
						<label for="number">Number:</label> <input type="text"
							class="form-control" value="${contact.number}" id="number"
							placeholder="Enter Number" name="number">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</c:when>
		</c:choose>
	</div>
	<script type="text/javascript">
		function clearFilter()
		{window.location='/'}
	</script>
</body>
</html>