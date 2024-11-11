<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.project2.model.Order" %>

<html>
<head>
    <title>Order Summary</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        /* Additional custom styling for a responsive table */
        @media (max-width: 768px) {
            .table thead {
                display: none;  /* Hide table headers on small screens */
            }
            .table tr {
                display: block;
                margin-bottom: 15px;
            }
            .table td {
                display: block;
                text-align: right;
                font-size: 14px;
                border-bottom: 1px solid #ddd;
            }
            .table td:before {
                content: attr(data-label);
                float: left;
                text-transform: uppercase;
                font-weight: bold;
            }
        }
    </style>
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
    <h2 class="text-center mb-4">Order Summary</h2>

    <!-- Fetch the orders list from request attributes -->
    <%
        List<Order> orders = (List<Order>) request.getAttribute("orders");
    %>

    <!-- No orders message -->
    <%
        if (orders == null || orders.isEmpty()) {
    %>
        <div class="alert alert-info text-center">
            <strong>No orders placed yet.</strong> 
        </div>
    <%
        } else {
    %>
    
    <!-- Orders Table -->
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Order Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Order order : orders) {
                %>
                <tr>
                    <td data-label="Order ID"><%= order.getId() %></td>
                    <td data-label="Product Name"><%= order.getProduct().getName() %></td>
                    <td data-label="Quantity"><%= order.getQuantity() %></td>
                    <td data-label="Order Date"><%= order.getOrderDate() %></td>
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
