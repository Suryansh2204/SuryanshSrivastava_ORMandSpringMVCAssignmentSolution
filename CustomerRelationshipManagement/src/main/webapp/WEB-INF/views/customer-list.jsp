<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <!-- Required meta tags -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1,shrink-to-fit=no">

            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
                integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
                crossorigin="anonymous">
            <title>Customer Directory</title>
        </head>

        <title>Save Customer</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <body class="w3-container">
            <div class="w3-display-container w3-sand" style="height: 150px;">
                <h2>
                    <div class="w3-display-middle">Customer Relationship Management</div>
                </h2>
            </div>
            
            
        <div class="container">
            <form action="/CustomerRelationshipManagement/customer">
            	<a href="/CustomerRelationshipManagement/customer/showFormForAdd" class="btn btn-primary btn-sm mb-3">Add Customer</a>
			</form>
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>

                </thead>
                <tbody>
                    <c:forEach items="${customer}" var="customer">
                        <tr>
                            <td>
                                <c:out value="${customer.fName}" /> 
                            </td>
                            <td>
                                <c:out value="${customer.lName}" />
                            </td>
                            <td>
                                <c:out value="${customer.email}" />
                            </td>
                            <td>
                                <a href="/CustomerRelationshipManagement/customer/showFormForUpdate?customerId=${customer.id}" class="btn btn-info btn-sm">Update</a>
                                <a href="/CustomerRelationshipManagement/customer/delete?customerId=${customer.id}" class="btn btn-danger btn-sm"
                                    onClick="if(!(confirm('Are you sure you want to delete'))) return false">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </body>