<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Book Shelf Dashboard</title>
</head>

<body>

	<div
		class="card container d-flex col-12 mx-auto justify-content-between mt-4 mb-4 p-4">
		<div class="d-flex justify-content-between">
			<div class="my-2">
				<h1 class="text-primary">
					Welcome,
					<c:out value="${loggedInUser.userName}" />
				</h1 >
				<h4 class="text-primary">Books from everyone's book shelf:</h4>
			</div>
			<div class="d-inline my-2">
				<a href="/books/new" class="btn btn-primary">Add Book</a> <a
					href="/bookmarket" class="btn btn-primary">Book Market</a>
				<a href="/logout" class="btn btn-secondary">Logout</a>
			</div>
		</div>

		<table class="table table-boarderd table-striped table-primary my-3">
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Posted By</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${books}" var="book">
				<tr class="table-light">
						<td>${book.id}</td>
						<td><a href="books/${book.id}"><c:out value="${book.title}"/> </a></td>
						<td>${book.author}</td>
						<td>${book.owner.userName}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>

</html>