package com.se.sportsenergy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {

    @RequestMapping("/cart/view")
    public String shoppingCart() {

        return "home/cart/cart";
    }
}
