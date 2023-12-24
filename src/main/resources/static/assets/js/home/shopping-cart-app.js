const app = angular.module("shopping-cart-app", []);
app.controller("shopping-cart-ctrl", function ($scope, $http) {

    $scope.paymentMethodRadio = "directcheck"; // dùng để kiểm tra xem chọn phuong thức thanh toán nào
    //Quan ly gio hang
    $scope.cart = {
        items: [],
        selectedColorId: null,
        selectedSizeId: null,
        selectedColorName: null,
        selectedSizeName: null,
        selectedQty: 1,

        selectColor(id) {
            this.selectedColorId = id;
        },
        selectSize(id) {
            this.selectedSizeId = id;
        },
        selectColorName(name) {
            this.selectedColorName = name;
        },
        selectSizeName(name) {
            this.selectedSizeName = name;
        },

        //Them san pham vao gio hang
        add(id) {

            if (this.selectedColorId === null || this.selectedSizeId === null) {
                Swal.fire({
                    title: "Bạn chưa chọn màu và size",
                    icon: "question"
                })
                return false;
            }

            let item = this.items.find((item) => item.product.id === id && item.colorId === this.selectedColorId && item.sizeId === this.selectedSizeId);

            if (item) {
                item.qty += this.selectedQty;
                Swal.fire({
                    position: "center",
                    icon: "success",
                    title: "Đã thêm vào giỏ hàng",
                    showConfirmButton: false,
                    timer: 1200
                });
                this.saveToLocalStorage();
            } else {
                $http.get(`/rest/attribute/${id}/${this.selectedColorId}/${this.selectedSizeId}`).then((resp) => {
                    resp.data.qty = this.selectedQty;
                    resp.data.colorId = this.selectedColorId;
                    resp.data.sizeId = this.selectedSizeId;
                    this.items.push(resp.data);
                    Swal.fire({
                        position: "center",
                        icon: "success",
                        title: "Đã thêm vào giỏ hàng",
                        showConfirmButton: false,
                        timer: 1200
                    });
                    this.saveToLocalStorage();
                });
            }
        },

        showStock(productId) {
            // Kiểm tra nếu giá trị là null thì truyền null, ngược lại truyền giá trị
            const colorId = this.selectedColorId !== null ? this.selectedColorId : null;
            const sizeId = this.selectedSizeId !== null ? this.selectedSizeId : null;

            $http.get(`/rest/attribute/${productId}/${colorId}/${sizeId}`).then((resp) => {
                this.stock = resp.data.stock;
            });
        },

        // //Xoa san pam khoi gio hang
        remove(id) {
            let index = this.items.findIndex((item) => item.id === id);
            this.items.splice(index, 1);
            this.saveToLocalStorage();
        },
        // //Xoa sach cac sản phẩm trong giỏ
        clear() {
            this.items = [];
            this.saveToLocalStorage();
        },

        //Tinh tong so luong cac mat hang trong gio
        get count() {
            return this.items
                .map((item) => item.qty)
                .reduce((total, qty) => (total += qty), 0);
        },
        //Tong thanh tien cac mat hang trong gio
        get amount() {
            return this.items
                .map((item) => item.qty * item.product.price)
                .reduce((total, qty) => (total += qty), 0);
        },

        //Luu gio hang vao local storage
        saveToLocalStorage() {
            let json = JSON.stringify(angular.copy(this.items));
            localStorage.setItem("cart", json);

        },
        //Doc gio hang tu LocalStorage
        loadFromLocalStorage() {
            let json = localStorage.getItem("cart");
            this.items = json ? JSON.parse(json) : [];
        },
    };
    $scope.cart.loadFromLocalStorage();

//Order
    $scope.order = {
        createDate: new Date(),
        phone: "",
        address: "",
        account: {username: $("#orderUsername").text()},
        get orderDetails() {
            return $scope.cart.items.map((item) => {
                return {
                    //cac thuoc tinh nay deu lay ten giong ơ entity
                    product: {id: item.product.id},
                    price: item.product.price,
                    quantity: item.qty,
                    productattribute: {id: item.id}, // Chuyển đổi sang đối tượng có constructor hoặc factory method nhận một số.
                };
            });
        },

        updateStock(productId, colorId, sizeId, qty) {
            $http.put(`/rest/attribute/stock/${qty}/${productId}/${colorId}/${sizeId}`)
                .then((resp) => {
                    console.log("Stock updated successfully");
                })
                .catch((error) => {
                    alert("Error when updating stock!");
                    console.log(error);
                });
        },


// Hàm chuyển hướng đến trang thanh toán VNPAY
        redirectToVNPAY() {
            if (!this.phone || !this.address) {
                Swal.fire({
                    title: "Thanh toán không thành công",
                    text: "Hãy nhập đủ số điện thoại và địa chỉ",
                    icon: "error"
                })
                return;
            }
            // Lưu phone và address vào localStorage
            localStorage.setItem("phone", this.phone);
            localStorage.setItem("address", this.address);

            $http.get(`/submitOrder?amount=${$scope.cart.amount}`)
                .then((resp) => {
                    // Lấy URL từ phản hồi
                    let vnpayUrl = resp.data.vnpayUrl;

                    // Chuyển đến trang thanh toán VNPAY
                    window.location.href = vnpayUrl;
                    // let orderStatus = resp.data.st
                })
                .catch((error) => {
                    alert("Error when redirecting to VNPAY!");
                    console.log(error);
                });
        },
// MOMO
        redirectToMomo() {
			let orderData = {
                createDate: $scope.order.createDate,
                phone: $scope.order.phone,
                address: $scope.order.address,
                paymentStatus: true,
                account: $scope.order.account,
                orderDetails: $scope.order.orderDetails
            }
              if (!this.phone || !this.address) {
                  Swal.fire({
                      title: "Thanh toán không thành công",
                      text: "Hãy nhập đủ số điện thoại và địa chỉ",
                      icon: "error"
                  })
                return;
              }
              localStorage.setItem("phone", this.phone);
            localStorage.setItem("address", this.address);
            // Thực hiện thanh toán
            $http.post("/rest/orders", orderData)
                .then( (resp) => {
                    

                    // Update stock for each item in the order
                    

                    
                    $http.get(`/orders/momo-pay/${resp.data.id}`)
                    .then(resp => {
						location.href = resp.data.vnpayUrl;
					})
					.catch(error => {
						console.log(error);
					})

                })
                .catch((error) => {
                    alert("Error when you checkout!");
                    console.log(error);
                });
		},

// Hàm thực hiện thanh toán
        performPayment() {
            let orderData = {
                createDate: $scope.order.createDate,
                phone: $scope.order.phone,
                address: $scope.order.address,
                paymentStatus: false,
                account: $scope.order.account,
                orderDetails: $scope.order.orderDetails
            }
              if (!this.phone || !this.address) {
                  // Hiển thị thong báo
                  Swal.fire({
                      title: "Thanh toán không thành công",
                      text: "Hãy nhập đủ số điện thoại và địa chỉ",
                      icon: "error"
                  });
                return;
              }
            // Thực hiện thanh toán
            $http.post("/rest/orders", orderData)
                .then(async (resp) => {
                    await Swal.fire({
                        position: "center",
                        icon: "success",
                        title: "Đặt hàng thành công",
                        showConfirmButton: false,
                        timer: 1500
                    });

                    // Update stock for each item in the order
                    for (let item of $scope.cart.items) {
                        let productId = item.product.id;
                        let colorId = item.colorId;
                        let sizeId = item.sizeId;
                        let qty = item.qty;
                        $scope.order.updateStock(productId, colorId, sizeId, qty);
                    }

                    $scope.cart.clear();
                    location.href = "/order/detail/" + resp.data.id;
                })
                .catch((error) => {
                    alert("Error when you checkout!");
                    console.log(error);
                });
        }  ,
        updateAfterPayment() {
            // Lưu phone và address vào localStorage
            // localStorage.setItem("phone", this.phone);
            // localStorage.setItem("address", this.address);
            let storedPhone = localStorage.getItem("phone");
            let storedAddress = localStorage.getItem("address");
            let orderData = {
                createDate: $scope.order.createDate,
                phone: storedPhone,
                address: storedAddress,
                paymentStatus: true,
                account: $scope.order.account,
                orderDetails: $scope.order.orderDetails
            }
            // Thực hiện thanh toán
            $http.post("/rest/orders", orderData)
                .then(async (resp) => {
                    await Swal.fire({
                        position: "center",
                        icon: "success",
                        title: "Đặt hàng thành công",
                        showConfirmButton: false,
                        timer: 1500
                    });

                    // Update stock for each item in the order
                    for (let item of $scope.cart.items) {
                        let productId = item.product.id;
                        let colorId = item.colorId;
                        let sizeId = item.sizeId;
                        let qty = item.qty;
                        $scope.order.updateStock(productId, colorId, sizeId, qty);
                    }

                    $scope.cart.clear();
                    localStorage.removeItem("phone");
                    localStorage.removeItem("address");
                    location.href = "/order/detail/" + resp.data.id;
                })
                .catch((error) => {
                    alert("Error when you checkout!");
                    console.log(error);
                });
        },

    };

});
app.controller("rating-ctrl", function ($scope, $http) {
    // rating
    $scope.rating = [];
    $scope.review = {}; //cho form
    $scope.reviewCount = 0;

    $scope.getAllRatingById = function () {
        let proId = document.querySelector('#rating-pro-id').textContent;
        $http.get(`/rest/rating/product/${proId}`).then(resp => {
            $scope.rating = resp.data;
            $scope.reviewCount = resp.data.length;
        })
    }

    $scope.getAllRatingById();

    $scope.createRating = function () {
        let proId = document.querySelector('#rating-pro-id').textContent;
        let userId = document.querySelector('#rating-user-id').textContent;

        let username = $scope.review.username || 'user';
        $http.get(`/rest/rating/order/${userId}/${proId}`).then(orderResp => {
            let orderIds = orderResp.data;
            let orderId = orderIds.length > 0 ? orderIds[0] : null;
            if (orderId) {
                $http.post(`/rest/rating`, {
                    content: $scope.review.content,
                    rating: $scope.review.rating,
                    username: username,
                    product: {id: proId},
                    order: {id: orderId}
                }).then(resp => {
                    Swal.fire({
                        position: "center",
                        icon: "success",
                        title: "Đánh giá thành công",
                        showConfirmButton: false,
                        timer: 1200
                    });
                    // $scope.items.push(resp.data);
                    $scope.getAllRatingById();
                });
            } else {
                Swal.fire({
                    title: "Bạn chưa mua sản phẩm này",
                    text: "Hãy mua sản phẩm để đánh giá",
                    icon: "error"
                });
            }

        })
    };

    $scope.deleteRating = function(ratingId){
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, delete it!"
          }).then((result) => {
            if (result.isConfirmed) {
                $http.delete(`/rest/rating/delete/${ratingId}`).then(resp => {
                    $scope.getAllRatingById();
                }).catch(error => {
                    console.log("Error", error);
                })
              Swal.fire({
                title: "Deleted!",
                text: "Comment has been deleted.",
                icon: "success"
              });
            }
          });
    }

    $scope.pager = {
        page: 0,
        size: 4,
        get rating() {
            var start = this.page * this.size;
            return $scope.rating.slice(start, start + this.size);
        },
        get count() {
            return Math.ceil(1.0 * $scope.rating.length / this.size)
        },
        first() {
            this.page = 0;
        },
        prev() {
            this.page--;
            if (this.page < 0) {
                this.last();
            }
        },
        next() {
            this.page++;
            if (this.page >= this.count) {
                this.first();
            }
        },
        last() {
            this.page = this.count - 1;
        }
    }

});
