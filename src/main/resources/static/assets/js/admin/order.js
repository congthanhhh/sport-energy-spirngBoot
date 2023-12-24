const app = angular.module("order-app", []);
app.controller("order-ctrl", function ($scope, $http) {
    $scope.items = [];

    $scope.getAllOrder = function () {
        //load products
        $http.get("/rest/orders").then(resp => {
            $scope.items = resp.data;
            // Khởi tạo selectedStatus cho mỗi item để hiển thị status dưới database
            angular.forEach($scope.items, function(item) {
                item.selectedStatus = item.orderStatus.toString();
                item.isSelectDisabled = true;
            });
        });
    }

    $scope.toggleSelectState = function(item) {
        item.isSelectDisabled = !item.isSelectDisabled;
    }

    $scope.updateOrderStatus = function (orderId, newStatus) {
        // Gọi service để cập nhật trạng thái
        $http.put(`/rest/orders/${orderId}/${newStatus}`)
            .then(resp => {
                // Nếu cập nhật thành công, cập nhật lại danh sách đơn hàng
                $scope.getAllOrder();
            })
            .catch(error => {
                console.error("Error updating order status:", error);
            });
    }

    $scope.deleteOrder = function(orderId){
        if(confirm("Do you want to delete this product")){
            $http.delete(`/rest/orders/delete/${orderId}`).then(resp => {
                alert("Delete successfully!");
                $scope.getAllOrder();
            }).catch(error => {
                alert("Error!");
                console.log("Error", error);
            })
        }
    }

    $scope.getAllOrder();

    // phan trang cua order
    $scope.pager = {
        page: 0,
        size: 8,
        get items() {
            var start = this.page * this.size;
            return $scope.items.slice(start, start + this.size);
        },
        get count() {
            return Math.ceil(1.0 * $scope.items.length / this.size)
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


    // set available product
    $scope.updateProductStatus = function (id, action) {
        var url = action === 'delete' ? `/rest/products/delete/${id}` : `/rest/products/recover/${id}`;
        $http.put(url)
            .then(function (response) {
                console.log(response.data);
                // Cập nhật lại danh sách sản phẩm sau khi cập nhật
            })
            .catch(function (error) {
                console.error(error);
            });
    };
});