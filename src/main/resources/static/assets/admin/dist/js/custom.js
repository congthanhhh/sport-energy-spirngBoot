function showPreview5(input) {
    if (input.files && input.files[0]) {
       var fileName = input.files[0].name;
        // Cập nhật tên tệp đã chọn vào thẻ label
        $('#InputLabel').text(fileName);
        
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#previewImage').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

function showPreview(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#previewImage').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

function showPreview2(input, imgId) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function (e) {
            $('#' + imgId).attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}


// imageIndex = imageIndex % 2 + 1; được sử dụng để thay đổi giá trị của imageIndex giữa 1 và 2. Đây là cách nó hoạt động:
// Khi imageIndex là 1, imageIndex % 2 sẽ trả về 1, và sau đó cộng thêm 1 sẽ làm imageIndex trở thành 2.
// Khi imageIndex là 2, imageIndex % 2 sẽ trả về 0, và sau đó cộng thêm 1 sẽ làm imageIndex trở thành 1.
let imageIndex = 3;

function showPreview3(input) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function (e) {
            $('#previewImage' + imageIndex).attr('src', e.target.result);
            imageIndex = imageIndex % 3 + 1; // Chuyển sang hình ảnh tiếp theo
        };
        reader.readAsDataURL(input.files[0]);
    }
}

// ẩn hiện phần productImage lúc update product trong admin
document.addEventListener("DOMContentLoaded", function () {
    // Mặc định, ẩn "productImageRow" và hiển thị "productImagesRow"
    var productImagesRow = document.getElementById("productImagesRow");
    var productImageRow = document.getElementById("productImageRow");

    productImagesRow.classList.remove("hidden");
    productImageRow.classList.add("hidden");
});

function toggleProductImages() {
    var productImagesRow = document.getElementById("productImagesRow");
    var productImageRow = document.getElementById("productImageRow");

    // Ẩn/hiện "productImagesRow" và "productImageRow"
    productImagesRow.classList.toggle("hidden");
    productImageRow.classList.toggle("hidden");
}




