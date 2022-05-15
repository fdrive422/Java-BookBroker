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
<title>Book Market Dashboard</title>
</head>

<body>

	<div
		class="card container d-flex col-12 mx-auto justify-content-between mt-4 mb-4 p-4">
		<div class="d-flex justify-content-between">
			<div class="my-2">
				<h4 class="text-primary">
					Hello,
					<c:out value="${loggedInUser.userName}"/>. Welcome to...
				</h4>
				<h1 class="text-primary">The Book Broker</h1>
			</div>
			<div class="d-inline justify-content-between my-2">
				<a href="/books" class="btn btn-primary">Book Shelf</a> <a
					href="/books/new" class="btn btn-primary">Add Book</a> <a
					href="/logout" class="btn btn-secondary">Logout</a>
			</div>
		</div>
		<h5 class="">Available Books to Borrow</h5>
		<table class="table table-striped table-primary my-3">
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Owner</th>
					<th>Actions</th>
				</tr>
			<tbody>
				<c:forEach items="${unborrowed}" var="book">
					<c:if test="${book.borrower.id == null }">
						<tr class="table-light">
							<td>${book.id}</td>
							<td><a href="books/${book.id}"> <c:out
										value="${book.title}" />
							</a></td>
							<td>${book.author}</td>
							<td>${book.owner.userName}</td>
							<td class="d-flex"><c:choose>
									<c:when
										test="${loggedInUser.id == book.owner.id && book.borrower.id == null}">
										<a href="books/${book.id}/edit" class="btn btn-info mx-1 px-4">Edit</a>
										<form:form action="books/${book.id}/delete" method="delete">
											<input type="submit" value="Delete" class="btn btn-danger">
										</form:form>
									</c:when>
									<c:when
										test="${loggedInUser.id != book.owner.id && borrower.id == null}">
										<a href="books/add/${book.id}" class="btn btn-success mx-1">Borrow</a>
									</c:when>
									<c:otherwise>
										<strong>BORROWED</strong>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<h5 class="my-2">Books I'm Borrowing</h5>
		<table class="table table-striped table-primary my-3">
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Owner</th>
					<th>Actions</th>
				</tr>
			<tbody>
				<c:forEach items="${borrowed}" var="book">
					<c:if test="${book.borrower.id == loggedInUser.id}">
						<tr class="table-light">
							<td>${book.id}</td>
							<td><a href="books/${book.id}"> <c:out value="${book.title}"/></a></td>
							<td>${book.author}</td>
							<td>${book.owner.userName}</td>
							<td class="d-flex">
								<a href="books/remove/${book.id}" class="btn btn-success mx-1">Return</a>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>


</body>

</html>