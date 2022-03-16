<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1,shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<title>customer Form</title>
</head>


	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<body class="w3-container">
	<div class="w3-display-container w3-sand" style="height: 150px;">
                <h2>
                    <div class="w3-display-middle">Customer Relationship Management</div>
                </h2>
            </div>
    </body>
<body>
	
	
	<div class="container">
		<hr>
		<p class="h4 mb-4">Save customer</p>
		<form action="/CustomerRelationshipManagement/customer/save" method="post">
			<input type="hidden" name="id" value="${customer.id}"  />
			<div class="form-inline">
				<input type="text" name="fName" value="${customer.fName}" placeholder="First Name" />
			</div>
			<div class="form-inline">
				<input type="text" name="lName" value="${customer.lName}" placeholder="Last Name" />
			</div>
			<div class="form-inline">
				<input type="text" name="email" value="${customer.email}"
					placeholder="E-mail" />
			</div>
			<button type="submit" class="btn btn-info col-2">Save</button>
		</form>
		<hr>
		<a href="/CustomerRelationshipManagement/customer/list">Back to Customers List</a>
	</div>
</body>


</html>