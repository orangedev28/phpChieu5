<?php
include_once 'app/views/share/header.php'
?>

<div class="row row-cols-1 row-cols-md-3 g-4">

    <?php while ($row = $products->fetch(PDO::FETCH_ASSOC)) : ?>
        <!-- Trong vòng lặp hiển thị sản phẩm -->
        <div class="col">
            <div class="card">
                <a href="/chieu5/product/detail/<?= $row['id'] ?>">
                    <img src="<?= $row['thumnail']; ?>" class="card-img-top" alt="...">
                </a>
                <div class="card-body">
                    <h5 class="card-title"><?= $row['name'] ?></h5>
                    <p class="card-text"><?= $row['description'] ?></p>
                    <p class="card-text">Giá: <?= $row['price'] ?></p>
                    <button class="btn btn-primary add-to-cart" onclick="addToCart(<?= $row['id']; ?>)">Thêm vào giỏ hàng</button>
                </div>
            </div>
        </div>
    <?php endwhile; ?>
</div>

<?php
include_once 'app/views/share/footer.php'
?>

<!-- Script JavaScript -->
<script>
    function addToCart(productId) {
        // Gửi yêu cầu AJAX để thêm sản phẩm vào giỏ hàng
        const xhr = new XMLHttpRequest();
        xhr.open('POST', '/chieu5/cart/addToCart/' + productId, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function() {
            if (xhr.status === 200) {
                // Đã thêm sản phẩm vào giỏ hàng thành công
                alert('Sản phẩm đã được thêm vào giỏ hàng!');
            } else {
                // Xử lý lỗi
                alert('Đã xảy ra lỗi khi thêm sản phẩm vào giỏ hàng.');
            }
        };
        xhr.send();
    }
</script>

