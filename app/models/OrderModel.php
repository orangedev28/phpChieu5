<?php
class OrderModel {
    private $conn;
    private $table_name = "orders";
    
    public function __construct($db) {
        $this->conn = $db;
    }

    public function createOrder($orderDate, $address, $phone, $totalPrice, $accountId) {
        // Tạo câu lệnh SQL để chèn dữ liệu vào bảng `orders`
        $query = "INSERT INTO " . $this->table_name . " (`Date`, `Address`, `Phone`, `Total`, `AccountId`) VALUES (:orderDate, :address, :phone, :totalPrice, :accountId)";
        
        // Chuẩn bị câu lệnh SQL
        $stmt = $this->conn->prepare($query);

        // Làm sạch và gán dữ liệu vào câu lệnh
        $stmt->bindParam(':orderDate', $orderDate);
        $stmt->bindParam(':address', $address);
        $stmt->bindParam(':phone', $phone);
        $stmt->bindParam(':totalPrice', $totalPrice);
        $stmt->bindParam(':accountId', $accountId);

        // Thực thi câu lệnh và kiểm tra kết quả
        if ($stmt->execute()) {
            // Trả về id của đơn hàng mới được tạo
            return $this->conn->lastInsertId();
        }

        // Trả về false nếu không thể tạo đơn hàng
        return false;
    }

    public function createOrderDetail($orderId, $productId, $quantity) {
        // Tạo câu lệnh SQL để chèn dữ liệu vào bảng `order_details`
        $query = "INSERT INTO order_details (`OrderId`, `ProductId`, `Amount`) VALUES (:orderId, :productId, :quantity)";
        
        // Chuẩn bị câu lệnh SQL
        $stmt = $this->conn->prepare($query);

        // Làm sạch và gán dữ liệu vào câu lệnh
        $stmt->bindParam(':orderId', $orderId);
        $stmt->bindParam(':productId', $productId);
        $stmt->bindParam(':quantity', $quantity);

        // Thực thi câu lệnh và kiểm tra kết quả
        return $stmt->execute();
    }
}
?>
