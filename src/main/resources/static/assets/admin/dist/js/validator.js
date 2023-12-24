function Validator(options) {
    function getParent(element, selector) {
        while (element.parentElement) {
            if (element.parentElement.matches(selector)) {
                return element.parentElement;
            }
            element = element.parentElement;
        }
    }

    var selectorRules = {};

    function validate(inputElement, rule) {
        var errorElement = getParent(
            inputElement,
            options.formGroupSelector
        ).querySelector(options.errorSelector);
        var errorMessage;
        // Lay ra cac rules cau selector
        var rules = selectorRules[rule.selector];
        // Lap qua tung rule & kiem tra, neu co loi thi dung kt
        for (var i = 0; i < rules.length; ++i) {
            switch (inputElement.type) {
                case "radio":
                case "checkbox":
                    errorMessage = rules[i](
                        formElement.querySelector(rule.selector + ":checked")
                    );
                    break;
                default:
                    errorMessage = rules[i](inputElement.value);
                    break;
            }
            if (errorMessage) break;
        }
        // Them class invalid
        if (errorMessage) {
            errorElement.innerText = errorMessage;
            getParent(inputElement, options.formGroupSelector).classList.add(
                "invalid"
            );
        } else {
            errorElement.innerText = "";
            getParent(inputElement, options.formGroupSelector).classList.remove(
                "invalid"
            );
        }
        return !errorMessage;
    }

    var formElement = document.querySelector(options.form);
    if (formElement) {
        var isFormValid = true;  // Bước 1: Xác định biến isFormValid

        formElement.onsubmit = function (e) {
            isFormValid = true;  // Bước 2: Đặt isFormValid là true

            // Lap qua tung rule va validate
            options.rules.forEach(function (rule) {
                var inputElement = formElement.querySelector(rule.selector);
                var isValid = validate(inputElement, rule);
                if (!isValid) {
                    isFormValid = false;
                }
            });

            // Kiểm tra isFormValid trước khi submit
            if (isFormValid) {
                // submit voi JavaScript (goi submit ben html)
                if (typeof options.onSubmit === "function") {
                    var enableInputs = formElement.querySelectorAll("[name]");
                    var formValues = Array.from(enableInputs).reduce(function (
                            values,
                            input
                        ) {
                            // ... (code giữ nguyên)
                        },
                        {});
                    options.onSubmit(formValues);
                } else {
                    // submit voi hanh vi mac dinh
                    formElement.submit();
                }
            } else {
                // Bạn có thể thêm xử lý tùy ý ở đây khi form không hợp lệ, ví dụ hiển thị thông báo lỗi
                console.log("Form không hợp lệ");
                // Hoặc có thể sử dụng event.preventDefault() để ngăn chặn chuyển trang
                e.preventDefault();
            }
        };

        //Lap qua moi rule va xu ly
        options.rules.forEach(function (rule) {
            // Luu lai cac rule cho moi input
            if (Array.isArray(selectorRules[rule.selector])) {
                selectorRules[rule.selector].push(rule.test);
            } else {
                selectorRules[rule.selector] = [rule.test];
            }

            var inputElements = formElement.querySelectorAll(rule.selector);
            Array.from(inputElements).forEach(function (inputElement) {
                if (inputElement) {
                    // Xu ly truong blur ra khi input
                    inputElement.onblur = function () {
                        validate(inputElement, rule);
                    };
                    // Xy ly moi khi nguoi dung nhap vao input
                    inputElement.oninput = function () {
                        var errorElement = getParent(
                            inputElement,
                            options.formGroupSelector
                        ).querySelector(options.errorSelector);
                        errorElement.innerText = "";
                        getParent(inputElement, options.formGroupSelector).classList.remove(
                            "invalid"
                        );
                    };
                }
            });
        });
    }
}
//Dinh nghia rules
Validator.isRequire = function (selector, message) {
    return {
        selector: selector,
        test: function (value) {
            return value ? undefined : message || "Vui lòng nhập trường này";
            // return value.trim() ? undefined : message || 'Vui lòng nhập trường này'
        },
    };
};

Validator.isEmail = function (selector, message) {
    return {
        selector: selector,
        test: function (value) {
            var regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return regex.test(value)
                ? undefined
                : message || "Trường này phải là email";
        },
    };
};

Validator.minLength = function (selector, min, message) {
    return {
        selector: selector,
        test: function (value) {
            return value.length >= min
                ? undefined
                : message || `Vui lòng nhập tối thiểu ${min} ký tự`;
        },
    };
};

Validator.isConfirmed = function (selector, getConfirmValue, message) {
    return {
        selector: selector,
        test: function (value) {
            return value === getConfirmValue()
                ? undefined
                : message || "Giá trị không chính xác";
        },
    };
};
