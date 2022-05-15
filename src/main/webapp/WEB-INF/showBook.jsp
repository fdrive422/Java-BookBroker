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
<title>Show Book</title>
</head>
<body>

	<div class="container border rounded mt-4 p-4">
		<div class="d-flex  mx-auto justify-content-between mb-3">
	    	<h1 class="text-primary">${book.title}</h1>
	        <p>
	        	<a href="/books" class="btn btn-primary">Book Shelf</a>
	        	<a href="/bookmarket" class="btn btn-primary">Book Market</a>
	        </p>
	   	</div>
	   	<div class="mx-auto mb-4">
	   	
	   	<c:choose>
	   		<c:when test="${loggedInUser.id != book.owner.id}">	
	   			<p><c:out value="${book.owner.userName}"/> read '<strong><c:out value="${book.title}"/></strong>' by <c:out value="${book.author}"/></p>
				<h4>Here are their thoughts: </h4>
				<hr/>
				<p class="fst-italic"><c:out value="${book.thoughts}"/></p>
				<hr/>
			</c:when>
			<c:otherwise>
				<p>You read '<strong><c:out value="${book.title}"/></strong>' by <c:out value="${book.author}"/></p>
				<h4>Here are your thoughts: </h4>
				<hr/>
				<p class="fst-italic"><c:out value="${book.thoughts}"/></p>
				<hr/>
				<p>
					<a href="/books/${book.id}/edit" class="btn btn-info">Edit Book</a>
				</p>
			</c:otherwise>
		</c:choose>
	   	</div>
	</div>

</body>
</html>