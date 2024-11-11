<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.project2.model.Product, com.project2.model.Category" %>
<html>
<head>
    <title>Edit Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/home">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="/products">Products</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/categories">Categories</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/orders">Orders</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="products/low-stock">Low Stock</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contact</a>
            </li>
        </ul>
    </div>
</nav>


<div class="container mt-4">
    <h2>Edit Product</h2>

    <!-- Retrieve the product and categories from request attributes -->
    <%
        // Fetch product object from the request attribute
        Product product = (Product) request.getAttribute("product");

        // Fetch the list of categories from the request attribute
        List<Category> categories = (List<Category>) request.getAttribute("categories");

        // Ensure the product exists
        if (product == null) {
            out.println("<div class='alert alert-danger'>Product not found!</div>");
            return;
        }

        // Retrieve the product category ID if it's not null
        Long productCategoryId = (product.getCategory() != null) ? product.getCategory().getId() : null;
    %>

    <!-- Begin form to edit product -->
    <form action="/products/edit/<%= product.getId() %>" method="post">
        <!-- Product Name -->
        <div class="form-group">
            <label for="name">Product Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= product.getName() %>" required>
        </div>

        <!-- Product Description -->
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea class="form-control" id="description" name="description"><%= product.getDescription() %></textarea>
        </div>

        <!-- Product Price -->
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" class="form-control" id="price" name="price" value="<%= product.getPrice() %>" required>
        </div>

        <!-- Product Quantity -->
        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" class="form-control" id="quantity" name="quantity" value="<%= product.getQuantity() %>" required>
        </div>

        <!-- Product Category -->
        <div class="form-group">
            <label for="category">Category:</label>
            <select class="form-control" id="category" name="category.id">
                <%
                    // Iterate over the categories list and populate the dropdown
                    if (categories != null) {
                        for (Category category : categories) {
                            Long categoryId = category.getId();
                            boolean isSelected = (productCategoryId != null && productCategoryId.equals(categoryId));
                %>
                <option value="<%= categoryId %>" <%= isSelected ? "selected" : "" %>>
                    <%= category.getName() %>
                </option>
                <%
                        }
                    }
                %>
            </select>
        </div>

        <!-- Submit and Cancel Buttons -->
        <button type="submit" class="btn btn-primary">Update Product</button>
        <a href="/products" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
