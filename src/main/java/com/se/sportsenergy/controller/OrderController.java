package com.se.sportsenergy.controller;

import com.se.sportsenergy.model.Account;
import com.se.sportsenergy.model.CustomUserDetails;
import com.se.sportsenergy.model.Order;
import com.se.sportsenergy.model.OrderDetail;
import com.se.sportsenergy.service.AccountService;
import com.se.sportsenergy.service.OrderDetailService;
import com.se.sportsenergy.service.OrderService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    OrderDetailService orderDetailService;

    @Autowired
    AccountService accountService;

    @RequestMapping("/")
    public String order() {

        return "home/order/myOrder";
    }

    @RequestMapping("/detail")
    public String orderDetail() {

        return "home/order/orderDetail";
    }

    @RequestMapping("/checkout")
    public String checkout(Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        // Lấy CustomUserDetails từ đối tượng Authentication
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        // Lấy username từ CustomUserDetails
        String username = userDetails.getUsername();

        Account account = accountService.findById(username);

        model.addAttribute("orderInfo", account);

        return "home/order/checkout";
    }

    @GetMapping("/detail/{id}")
    public String orderDetail(@PathVariable("id") Long id, Model model) {
        List<OrderDetail> orderDetails = orderDetailService.findByOrderId(id);

        model.addAttribute("orderDetail", orderDetails);

        // Tính tổng
        double total = orderDetails.stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();

        // Định dạng số
        NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
        String formattedTotal = numberFormat.format(total);

        model.addAttribute("total", formattedTotal);

        return "home/order/orderDetail";
    }

    @RequestMapping("/myOrderDetail")
    public String myOrderDetail(Model model, @RequestParam("id") Long id) {
        List<OrderDetail> orderDetails = orderDetailService.findByOrderId(id);
        model.addAttribute("orderDetail", orderDetails);

        // Tính tổng
        double total = orderDetails.stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();

        // Định dạng số
        NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
        String formattedTotal = numberFormat.format(total);

        model.addAttribute("total", formattedTotal);
        return "home/order/orderDetail";
    }

    @RequestMapping("/cancel")
    public String cancelOrder(@RequestParam("idCC") Long idCC) {
        orderService.softDelete(idCC);
        return "redirect:/order/myOrder";
    }

    @RequestMapping("/myOrder")
    public String myOrder(Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        // Lấy CustomUserDetails từ đối tượng Authentication
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        // Lấy username từ CustomUserDetails
        String username = userDetails.getUsername();
        List<Order> myOrder = orderService.findByUsername(username); //get username

        model.addAttribute("myOrder", myOrder);
        return "home/order/myOrder";
    }
}
