package com.se.sportsenergy.vnpay;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

//@RestController
@Controller
public class VNPayController {

    @Autowired
    private VNPayService vnPayService;

    @GetMapping("/submitOrder")
    public ResponseEntity<OrderResponse> submitOrder(@RequestParam("amount") int orderTotal, HttpServletRequest request) {

        String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        String vnpayUrl = vnPayService.createOrder(orderTotal, "Energy Sprot shop payment", baseUrl);

        OrderResponse response = new OrderResponse(vnpayUrl);
        return ResponseEntity.ok().body(response);
    }

    @GetMapping("/vnpay-payment")
    public String GetMapping(HttpServletRequest request, Model model){
        int paymentStatus =vnPayService.orderReturn(request);

        String orderInfo = request.getParameter("vnp_OrderInfo");
        String paymentTime = request.getParameter("vnp_PayDate");
        String transactionId = request.getParameter("vnp_TransactionNo");
        String totalPrice = request.getParameter("vnp_Amount");

        Double total = Double.parseDouble(totalPrice) / 100;

        model.addAttribute("orderId", orderInfo);
        model.addAttribute("totalPrice", total);
        model.addAttribute("paymentTime", paymentTime);
        model.addAttribute("transactionId", transactionId);

        return paymentStatus == 1 ? "home/vnpay/ordersuccess" : "home/vnpay/orderfail";
    }
}
