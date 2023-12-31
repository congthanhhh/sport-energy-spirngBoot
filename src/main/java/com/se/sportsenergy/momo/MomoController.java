package com.se.sportsenergy.momo;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.se.sportsenergy.model.MomoResult;
import com.se.sportsenergy.model.Order;
import com.se.sportsenergy.service.OrderService;
import com.se.sportsenergy.vnpay.OrderResponse;

@Controller
@RequestMapping("/orders")
public class MomoController {
	
	@Autowired
    private MomoService momoService;
	
	@Autowired
	OrderService service;
	
	@GetMapping("/momo-pay/{id}")
	@ResponseBody
    public ResponseEntity<OrderResponse> momoPay(@PathVariable("id") String id) 
    		throws NoSuchAlgorithmException, InvalidKeyException, JsonProcessingException {
        Order sessionOrder = service.findById(Long.valueOf(id));

        MomoResponse response = momoService.createMomoPayment(sessionOrder);
        
        OrderResponse or = new OrderResponse(response.getPayUrl());

        return ResponseEntity.ok(or);
    }
    
    @GetMapping("momo-result")
    public String result(Model model,
                         @RequestParam("partnerCode") String partnerCode,
                         @RequestParam("orderId") String orderId,
                         @RequestParam("requestId") String requestId,
                         @RequestParam("amount") String amount,
                         @RequestParam("orderInfo") String orderInfo,
                         @RequestParam("orderType") String orderType,
                         @RequestParam("transId") String transId,
                         @RequestParam("resultCode") int resultCode,
                         @RequestParam("message") String message,
                         @RequestParam("payType") String payType,
                         @RequestParam("responseTime") String responseTime,
                         @RequestParam("extraData") String extraData,
                         @RequestParam("signature") String signature) {

        MomoResult result = new MomoResult();
        result.setPartnerCode(partnerCode);
        result.setOrderId(orderId);
        result.setRequestId(requestId);
        result.setAmount(amount);
        result.setOrderInfo(orderInfo);
        result.setOrderType(orderType);
        result.setTransId(transId);
        result.setResultCode(resultCode);
        result.setMessage(message);
        result.setPayType(payType);
        result.setResponseTime(responseTime);
        result.setExtraData(extraData);
        result.setSignature(signature);
        
        model.addAttribute("orderId", result.getOrderId());
        model.addAttribute("totalPrice", result.getAmount());
        model.addAttribute("paymentTime", result.getResponseTime());
        model.addAttribute("transactionId", result.getTransId());

//        Order order = orderService.getSessionOrder(session);
//        if (order != null) {
//            order.setPaymentMethod(PaymentMethod.Momo);
//            if (result.getResultCode() == 0)
//            {
//                order.setStatus(OrderStatus.Completed);
//                order.setPaymentStatus(PaymentStatus.Paid);
//            }
//            else {
//                order.setStatus(OrderStatus.Failed);
//                order.setPaymentStatus(PaymentStatus.Unpaid);
//            }
//            orderService.save(order);
//        }
//
//        cartService.removeCart(session);
//        orderService.removeSessionOrder(session);
        return result.getResultCode()  == 0 ? "home/momo/ordersuccess" : "home/momo/orderfail";
    }
}
