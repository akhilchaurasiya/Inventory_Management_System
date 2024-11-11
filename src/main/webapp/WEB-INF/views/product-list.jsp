<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.project2.model.Product" %>

<html>
<head>
    <title>Product List</title>
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

    <h2>Products</h2>
    
    <!-- Low Stock Alert Section -->
    <c:if test="${not empty lowStockProducts}">
        
            <ul>
                <%
                    List<Product> lowStockProducts = (List<Product>) request.getAttribute("lowStockProducts");
                    for (Product product : lowStockProducts) {
                %>
                <li><%= product.getName() %> - Only <%= product.getQuantity() %> left</li>
                <%
                    }
                %>
            </ul>
     
    </c:if>

    <a href="/products/new" class="btn btn-primary mb-3">Add New Product</a>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Category</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Product> products = (List<Product>) request.getAttribute("products");
                for (Product product : products) {
            %>
            <tr>
                <td><%= product.getName() %></td>
                <td><%= product.getDescription() %></td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getQuantity() %></td>
                <td><%= product.getCategory().getName() %></td>
                <td><img src="<%= product.getImageUrl() %>" alt="Product Image" style="width: 100px;"></td>
                <td>
                    <a href="/products/edit/<%= product.getId() %>" class="btn btn-warning">Edit</a>
                    <a href="/products/delete/<%= product.getId() %>" class="btn btn-danger">Delete</a>
                    
                    <!-- Fix the order form by using the correct JSP expression for product.id -->
                    <form action="/orders/new/<%= product.getId() %>" method="post">
                        <input type="hidden" name="quantity" value="1" /> <!-- You can modify this to allow users to choose quantity -->
                        <button type="submit" class="btn btn-success">Order</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
