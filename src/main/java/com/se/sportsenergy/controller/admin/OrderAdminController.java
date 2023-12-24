package com.se.sportsenergy.controller.admin;

import com.se.sportsenergy.model.Order;
import com.se.sportsenergy.model.OrderDetail;
import com.se.sportsenergy.service.OrderDetailService;
import com.se.sportsenergy.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

@Controller
@RequestMapping("/admin/order")
public class OrderAdminController {

    @Autowired
    OrderService orderService;

    @Autowired
    OrderDetailService orderDetailService;

    @GetMapping
    public String order() {
        return "admin/table/order";
    }

    @GetMapping("/detail")
    public String orderDetail(@RequestParam("order-id") long id, Model model) {

        Order order = orderService.findById(id);
        model.addAttribute("order", order);

        List<OrderDetail> orderDetails = orderDetailService.findByOrderId(id);
        model.addAttribute("orderDetails", orderDetails);

        // Tính tổng
        double total = orderDetails.stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();

        // Định dạng số
        NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
        String formattedTotal = numberFormat.format(total);

        model.addAttribute("total", formattedTotal);

        return "admin/table/orderDetail";
    }
}
