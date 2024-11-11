<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.project2.model.Product" %>

<html>
<head>
    <title>Low Stock Products</title>
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
    <h2 class="text-center mb-4">Low Stock Products (Quantity 5 or Less)</h2>

    <%
        // Fetch the low-stock products from the request
        List<Product> lowStockProducts = (List<Product>) request.getAttribute("lowStockProducts");
    %>

    <!-- Display message if there are no low stock products -->
    <%
        if (lowStockProducts == null || lowStockProducts.isEmpty()) {
    %>
        <div class="alert alert-info text-center">
            <strong>No products are running low on stock.</strong> 
        </div>
    <%
        } else {
    %>

    <!-- Display the table of low stock products if they exist -->
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Category</th>
                    <th scope="col">Image</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Iterate over the low stock products using Java for-each loop
                    for (Product product : lowStockProducts) {
                %>
                <tr>
                    <td><%= product.getId() %></td>
                    <td><%= product.getName() %></td>
                    <td><%= product.getDescription() %></td>
                    <td><%= product.getPrice() %></td>
                    <td><%= product.getQuantity() %></td>
                    <td><%= product.getCategory().getName() %></td> <!-- Assuming Category has a 'name' field -->
                    <td><img src="<%= product.getImageUrl() %>" alt="Product Image" style="width: 100px; height: 100px;"></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <%
        }
    %>
</div>

<!-- Bootstrap JS and dependencies (optional) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
