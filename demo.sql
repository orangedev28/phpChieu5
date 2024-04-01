-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 01, 2024 lúc 02:59 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `demo`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(500) NOT NULL,
  `name` varchar(200) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `email`, `password`, `name`, `role`) VALUES
(4, 'khangemail@gmail.com', '$2y$12$LC4zBp5hpJh4WsxhF9Yf1u9ofIxTf9JLAfnw0qYvLOemRNb3YVfLe', 'Bien Huynh Cong Khang', 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `Id` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `AccountId` int(11) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`Id`, `Date`, `AccountId`, `Address`, `Phone`, `Total`) VALUES
(1, '2024-03-28 02:08:57', 4, '', '', 919000999),
(2, '2024-03-28 02:08:59', 4, '', '', 919000999),
(3, '2024-03-28 02:09:52', 4, '', '', 919000999),
(4, '2024-03-28 02:12:05', 4, '', '', 999),
(5, '2024-03-28 02:13:57', 4, '', '', 999),
(6, '2024-03-28 02:27:26', 4, 'Phường Linh Xuân', '0389832123', 999),
(7, '2024-03-28 02:28:01', 4, 'Trường Hutech Q9', '0342886207', 919000999),
(8, '2024-03-28 02:29:53', 4, 'Trường Hutech Q9', '0389832123', 999),
(9, '2024-03-28 02:39:18', 4, 'Phường Linh Xuân, TP. Thủ Đức, TP. HCM', '0389832123', 919000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `Id` int(11) NOT NULL,
  `OrderId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`Id`, `OrderId`, `ProductId`, `Amount`) VALUES
(1, 3, 1, 1),
(2, 3, 3, 1),
(3, 4, 5, 1),
(4, 5, 3, 1),
(5, 6, 3, 1),
(6, 7, 1, 1),
(7, 7, 3, 1),
(8, 8, 3, 1),
(9, 9, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(500) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `thumnail` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `thumnail`) VALUES
(1, 'Xe Kia Soluto 1.4 AT Deluxe 2023', 'Bán Kia Soluto Deluxe 1.4AT 2023, biển 30Kxx, TN 1 chủ sử dụng, đẹp xuất sắc, odo-> 1.1 vạn km, miễn bàn chất lượng', 919000000, NULL, 'uploads/1iphone 16.jpg'),
(2, 'Xe Mitsubishi Triton 4x4 AT Mivec 2017', '✓Hỗ trợ vay ngân hàng lãi suất ưu đãi. ✓Bảo hành 6 tháng hoặc 10.000km động cơ, máy móc. ✓Bảo dưỡng thay nhớt một lần miễn phí trước khi giao xe. ✓Hỗ trợ test hãng có văn bản', 599, NULL, 'uploads/1iphone 16.jpg'),
(3, 'Xe Mazda CX5 Premium 2.0 AT 2022', 'Xe Mazda CX5 Premium 2.0 AT 2022', 999, 'uploads/m_1709473019.509.jpg', 'uploads/1iphone 16.jpg'),
(4, 'Xe BMW 5 Series 528i GT 2014', 'BMW 528i GT sx 2014 Trắng/Kem, tư nhân sd lăn bánh hơn 7v miles rất đẹp. Cam kết xe không đâm đụng , không ngập nước , máy móc nguyên bản Có hỗ trợ thủ tục vay ngân hàng trả góp Có bao test xe check hãng', 999, 'uploads/m_1709175548.745.jpg', 'uploads/1iphone 16.jpg'),
(5, 'Xe Mercedes Benz E class E300 AMG 2019 ', 'Mercedes_E300_AMG xanh cavansite nt nâu - Sản xuất 2019 - Odo: 49.000 km (Full lịch sử hãng) - Option: Loa Bumester, cửa sổ trời, rèm che nắng, LED nội thất, cốp điện, Auto Hold, phanh tay điện tử, lẫy chuyển số vô lăng, ga tự động Cruise Control, giới hạn tốc độ Lim,… - Bank 70% - trả trước từ 500tr', 999, 'uploads/m_1709473019.509.jpg', 'uploads/1iphone 16.jpg'),
(6, 'Xe Honda CRV L 2024', 'Những điểm nổi bật trên Honda CR-V mới: - Công nghệ hỗ trợ lái xe an toàn tiên tiến Honda SENSING - Camera quan sát làn đường - Sạc không dây tiện ích - Cốp điện với tính năng mở cốp rảnh tay - Camera lùi 3 góc quay - Gạt mưa tự động,', 888, 'uploads/m_1709175548.745.jpg', 'uploads/1iphone 16.jpg'),
(7, '111111111 BMW 123', '111Xe BMW Premium 2.0 AT 2022', 111, 'uploads/m_1709473019.509.jpg', 'uploads/1iphone 16.jpg'),
(8, 'Xe Mitsubishi Triton 4x4 AT Mivec 2017', 'Xe Mazda CX5 Premium 2.0 AT 2022', 999, 'uploads/m_1709175548.745.jpg', 'uploads/1iphone 16.jpg'),
(9, '22222222', '1111111', 999, 'uploads/m_1709473019.509.jpg', 'uploads/1iphone 16.jpg'),
(10, 'Xe Mitsubishi Triton 4x4 AT Mivec 2017', 'Xe Mazda CX5 Premium 2.0 AT 2022', 999, 'uploads/m_1709175548.745.jpg', 'uploads/1iphone 16.jpg');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `AccountId` (`AccountId`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `OrderId` (`OrderId`),
  ADD KEY `ProductId` (`ProductId`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`AccountId`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`Id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
