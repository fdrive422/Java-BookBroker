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
<title>Add Book</title>
</head>
<body>

	<div class="card container  mt-4 mb-4 p-4">
		<div class="d-flex col-12 mx-auto justify-content-between">
			<div class="my-3">
			<h1 class="text-primary">Add a Book to Your Shelf!</h1>
			</div>
			<div class="my-2 row align-items-center">
				<p>
					<a href="/books" class="btn btn-primary">Book Shelf</a>
	        		<a href="/bookmarket" class="btn btn-primary">Book Market</a>
				</p>
			</div>
		</div>
		<div class="col-12 mx-auto">
        	<form:form action="/books/create" method="post" modelAttribute="newBook" class="p-4 ">
                <div class="form-group">
                		<form:label path="title" class="text-primary py-2">Title: </form:label>
                    	<form:errors path="title" class="text-danger"/>
                		<form:input path="title" class="form-control"/>
                </div>
                <div class="form-group">
                		<form:label path="author" class="text-primary py-2">Author: </form:label>
                    	<form:errors path="author" class="text-danger"/>
                		<form:input path="author" class="form-control"/>
                </div>
                <div class="form-group">
                		<form:label path="thoughts" class="text-primary py-2">Thoughts: </form:label>
                    	<form:errors path="thoughts" class="text-danger"/>
                		<form:textarea path="thoughts" class="form-control" rows="3"/>
                	<div>
                		<form:errors path="owner" class="error"/>
                		<form:input type="hidden" path="owner" value="${loggedInUser.id}" class="form-control"/>
                	</div>
                </div>
                <p class="my-3">
                	<input type="submit" value="Add Book" class="btn btn-success">
              	</p>
          	</form:form>
     	</div>
	</div>

</body>
</html>