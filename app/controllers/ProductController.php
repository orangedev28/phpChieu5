<?php
class ProductController {
    private $productModel;
    private $db;

    public function __construct()
    {
        $this->db = (new Database())->getConnection();
        $this->productModel = new ProductModel($this->db);
    }    

    public function getProductById($productId) {
        // Gọi phương thức getProductById từ ProductModel để lấy thông tin sản phẩm từ cơ sở dữ liệu
        $product = $this->productModel->getProductById($productId);
        return $product;
    }

    public function add(){

        if(SessionHelper::isAdmin() == false){
            header ('Location: /chieu5/account/login');
        }

        include_once 'app/views/products/create.php';
    }

    public function save(){
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $name = $_POST['name'] ?? '';
            $description = $_POST['description'] ?? '';
            $price = $_POST['price'] ?? '';

            // Xử lý tải lên hình ảnh đại diện
            if (isset($_FILES["thumbnail"])) {
                $uploadResult = $this->uploadImage($_FILES["thumbnail"]);
                if ($uploadResult) {
                    // Lưu đường dẫn của hình ảnh đại diện vào CSDL
                    $result = $this->productModel->createProduct($name, $description, $price, $uploadResult);

                    if (is_array($result)) {
                        // Có lỗi, hiển thị lại form với thông báo lỗi
                        $errors = $result;
                        include 'app/views/products/create.php'; // Đường dẫn đến file form sản phẩm
                    } else {
                        // Không có lỗi, chuyển hướng ve trang chu hoac trang danh sach
                        header('Location: /chieu5');
                    }
                } else {
                    // Lỗi tải lên
                    echo "Lỗi tải file!";
                }
            }
        }
    }

    public function uploadImage($file) {
        $targetDirectory = "uploads/";
        $targetFile = $targetDirectory . basename($file["name"]);
        $uploadOk = 1;
        $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));
    
        // Kiểm tra xem file có phải là hình ảnh thực sự hay không
        $check = getimagesize($file["tmp_name"]);
        if ($check !== false) {
            $uploadOk = 1;
        } else {
            $uploadOk = 0;
        }
    
        // Kiểm tra kích thước file
        if ($file["size"] > 500000) { // Ví dụ: giới hạn 500KB
            $uploadOk = 0;
        }
    
        // Kiểm tra định dạng file
        if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif") {
            $uploadOk = 0;
        }
    
        // Kiểm tra nếu $uploadOk bằng 0
        if ($uploadOk == 0) {
            return false;
        } else {
            if (move_uploaded_file($file["tmp_name"], $targetFile)) {
                return $targetFile;
            } else {
                return false;
            }
        }
    }

    public function detail($id){

        $product = $this->productModel->getProductById($id);

        // var_dump($product);
        // die();

        if ($product) {
            include_once 'app/views/products/detail.php';
        } else {
            include_once 'app/views/share/not-found.php';
        }
    }

    public function edit($id){

        $product = $this->productModel->getProductById($id);

        // var_dump($product);
        // die();

        if ($product) {
            include_once 'app/views/products/edit.php';
        } else {
            include_once 'app/views/share/not-found.php';
        }
    }

    public function update()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $name = $_POST['name'];
            $id = $_POST['id'];
            $price = $_POST['price'];
            $description = $_POST['description'];

            //kiem tra xem người dùng có update hình ảnh hay không?
            if (isset($_FILES["thumbnail"])){
                //co upload thay doi hinh
                
            }
            else{
                //khong upload thay doi hinh
            }

            // $edit = $this->productModel->updateProduct($id, $name, $description, $price);

            // if ($edit) {
            //     header('Location: /webbanhang/Product/listProducts');
            // } else {
            //     //thuc hien tuong tu nhu ham luu
            //     echo "Đã xảy ra lỗi khi lưu sản phẩm.";
            // }
        }
    }
}