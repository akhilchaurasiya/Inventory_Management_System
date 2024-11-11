<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.project2.model.Category" %>

<html>
<head>
    <title>Create Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        // Auto hide the alert after 10 seconds
        $(document).ready(function() {
            setTimeout(function() {
                $('.alert').alert('close');
            }, 10000); // 10000 milliseconds = 10 seconds
        });
    </script>
</head>
<body>
<div class="container mt-4">
    <h2>Add New Product</h2>

    <!-- Success message (if any) -->
    <%
        String successMessage = (String) request.getAttribute("successMessage");
        if (successMessage != null) {
    %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Success!</strong> <%= successMessage %>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    <%
        }
    %>

    <!-- Form for adding a new product -->
    <form action="/products" method="post">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea class="form-control" id="description" name="description"></textarea>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" class="form-control" id="price" name="price" required>
        </div>
        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" class="form-control" id="quantity" name="quantity" required>
        </div>
        <div class="form-group">
            <label for="imageUrl">Image URL:</label>
            <input type="text" class="form-control" id="imageUrl" name="imageUrl">
        </div>
        <div class="form-group">
            <label for="category">Category:</label>
            <select class="form-control" id="category" name="category.id">
                <%
                    List<Category> categories = (List<Category>) request.getAttribute("categories");
                    for (Category category : categories) {
                %>
                <option value="<%= category.getId() %>"><%= category.getName() %></option>
                <%
                    }
                %>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Save Product</button>
    </form>
</div>
</body>
</html>
