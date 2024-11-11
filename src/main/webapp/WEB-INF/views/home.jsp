<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>Inventory Management</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        .header {
            background: #333;
            color: #fff;
            padding: 10px 0;
        }
        .header h1 {
            text-align: center;
            font-size: 48px;
        }
        .quote {
            font-size: 24px;
            text-align: center;
            margin: 30px 0;
            font-style: italic;
        }
        .section {
            margin: 20px 0;
        }
        .footer {
            background: #333;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            position: relative;
            bottom: 0;
            width: 100%;
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

<!-- Header -->
<div class="header">
    <h1>Welcome to Inventory Management System</h1>
</div>

<div class="container">
    <!-- Quote Section -->
    <div class="quote">
        "The key to successful inventory management is simplicity and accuracy."
    </div>

    <!-- Cards Section -->
    <div class="row section">
        <!-- Manage Products Card -->
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Manage Products</h5>
                    <p class="card-text">Add, edit, or delete products from the inventory.</p>
                    <a href="/products" class="btn btn-primary">Go to Products</a>
                </div>
            </div>
        </div>

        <!-- Manage Categories Card -->
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Manage Categories</h5>
                    <p class="card-text">Organize your products into categories.</p>
                    <a href="/categories" class="btn btn-primary">Go to Categories</a>
                </div>
            </div>
        </div>

        <!-- Manage Orders Card -->
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Manage Orders</h5>
                    <p class="card-text">View all product orders.</p>
                    <a href="/orders" class="btn btn-primary">Go to Orders</a>
                </div>
            </div>
        </div>

        <!-- Low Stock Products Card -->
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Low Stock Products</h5>
                    <p class="card-text">View products running low on stock (5 or less).</p>
                    <a href="products/low-stock" class="btn btn-danger">View Low Stock</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Second Quote -->
    <div class="quote">
        "Great inventory management is not just about managing products; it’s about managing growth."
    </div>
</div>

<!-- Footer -->
<div class="footer">
    <p>&copy; 2024 Inventory Management System. All rights reserved.</p>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
