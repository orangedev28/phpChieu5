<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web bán hàng</title>

    <!-- Sử dụng Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Kết nối với thư viện Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
    <header class="bg-success text-white text-center py-4">
        <h1>Trang Web Bán Hàng</h1>
    </header>

    <!-- Menu điều hướng sử dụng Bootstrap Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-info">
        <div class="container">
            <a class="navbar-brand text-danger" href="/chieu5/">Trang Chủ</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="#">Sản Phẩm</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="#">Liên Hệ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-secondary text-danger" href="/chieu5/product/add">Thêm sản phẩm</a>
                    </li>
                    <?php
                    include_once 'app/views/share/authentication.php';
                    ?>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/chieu5/cart">
                            <i class="fas fa-shopping-cart"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row">
            <!-- Danh sách sản phẩm -->
            <div class="col-md-9">