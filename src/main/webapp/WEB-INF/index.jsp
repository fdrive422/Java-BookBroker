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
<title>Registration and Login</title>
</head>

<body>

	<div class="card container my-5">
	<h1 class="text-center text-primary">Book Broker </h1>
	<h5 class="text-center text-primary"> Manage your book shelf, borrow books from friends</h5>
		<div class="row justify-content-around my-2 gy-3">
			<div class="col-12 col-lg-6">
				<form:form action="/register" method="post" modelAttribute="newUser"
					class="p-4">
					<h2 class=" text-primary">Register</h2>
					<form:label path="userName" class="py-2">User Name:</form:label>
					<form:errors path="userName" class="text-danger" />
					<form:input path="userName" type="text" class="form-control" />
					<form:label path="email" class="py-2">Email:</form:label>
					<form:errors path="email" class="text-danger" />
					<form:input path="email" type="email" class="form-control" />
					<form:label path="password" class="py-2">Password:</form:label>
					<form:errors path="password" class="text-danger" />
					<form:password path="password" class="form-control" />
					<form:label path="confirm" class="py-2">Confirm Password:</form:label>
					<form:errors path="confirm" class="text-danger" />
					<form:password path="confirm" class="form-control" />
					<p class="pt-3">
						<input type="submit" value="Register"
							class="btn btn-primary">
					</p>
				</form:form>
			</div>
			<div class="col-12 col-lg-6">
				<form:form action="/login" method="post" modelAttribute="newLogin"
					class="p-4">
					<h2 class=" text-primary">Login</h2>
					<form:label path="userEmail" class="py-2">Email:</form:label>
					<form:errors path="userEmail" class="text-danger" />
					<form:input path="userEmail" type="email" class="form-control" />
					<form:label path="userPassword" class="py-2">Password:</form:label>
					<form:errors path="userPassword" class="text-danger" />
					<form:password path="userPassword" class="form-control" />
					<p class="pt-3">
						<input type="submit" value="Login" class="btn btn-success">
					</p>
				</form:form>
			</div>
		</div>
	</div>
<!-- 	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script> -->
</body>

</html>