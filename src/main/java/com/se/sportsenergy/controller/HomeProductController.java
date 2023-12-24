package com.se.sportsenergy.controller;

import com.se.sportsenergy.dto.CategoryAmountProductDTO;
import com.se.sportsenergy.model.Product;
import com.se.sportsenergy.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;



import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping({"/home", "/" ,"/home/index"})
public class HomeProductController {
    @Autowired
    ProductService productService;

    @GetMapping
    public String homeproduct(Model model) {
        // Lấy 8 sản phẩm lên featured product từ 0, 8
//        List<Product> fproduct = productService.findAll();
//        List<Product> randomProducts = fproduct.subList(0, 8);
//        model.addAttribute("fproduct", randomProducts);

        // Lấy 8 sản phẩm lên featured product ngẫu nhiên
    	
    	
    	List<Product> items = productService.findAll();
		model.addAttribute("items", items);

		/*Số lượng products của từng category*/
		List<CategoryAmountProductDTO> itemsCate = productService.findAmountProductsOfCategory();
		model.addAttribute("itemsCate", itemsCate);
    	
    	
        List<Product> fproduct = productService.findAll();
        int randomNumber1 = new Random().nextInt(fproduct.size() -8);
        List<Product> randomProduct = fproduct.subList(randomNumber1, randomNumber1 + 8);
        model.addAttribute("fproduct", randomProduct);


        // Lấy 8 sản phẩm lên recent product từ 0, 8
        List<Product> rproduct = productService.findTop8Products();

        model.addAttribute("rproduct", rproduct);

        // Lấy 8 sản phẩm lên recent product ngẫu nhiên
//        List<Product> rproduct = productService.findAll();
//        int randomNumber2 = new Random().nextInt(rproduct.size() -8);
//        List<Product> randomProduct2 = rproduct.subList(randomNumber2, randomNumber2 + 8);
//        model.addAttribute("rproduct", randomProduct2);


        // Lấy ngẫu nhiên 2 sản phẩm lên Special offer
        List<Product> specialoffer = productService.findAll();
        int randomNumber3 = new Random().nextInt(specialoffer.size() - 2);
        List<Product> randomProduct3 = specialoffer.subList(randomNumber3, randomNumber3 + 2);
        model.addAttribute("specialoffer", randomProduct3);

        // Lấy ngẫu nhiên 10 sản phẩm lên Vendor
        List<Product> vendor = productService.findAll();
        int randomNumber4 = new Random().nextInt(vendor.size() - 10);
        List<Product> randomProduct4 = vendor.subList(randomNumber4, randomNumber4 + 10);
        model.addAttribute("vendor", randomProduct4);

        return "home/product/home";
    }
    
    @RequestMapping("/contact")
	public String Contact() {
		
		return "home/cart/contact";
	}
    
   

}
