package com.se.sportsenergy.controller.admin;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.se.sportsenergy.model.Category;
import com.se.sportsenergy.model.ProductAttribute;
import com.se.sportsenergy.service.ProductAttributeService;

@Controller
@RequestMapping("/admin")
public class ProductAttributeController {
    //   Color Size va ProductAttribute cua Thang
    @Autowired
    ProductAttributeService productAttributeSV;
    
    @GetMapping("/product_attribute")
    public String findAll(Model model) {
    	List<ProductAttribute> pAttributes = productAttributeSV.findAll();
    	model.addAttribute("pAttributes",pAttributes);
    	return "admin/table/productattribute";
    }
    
    @GetMapping("/product_attribute/add_productattribute")
    public String showCreateCategoryForm(Model model) {
        ProductAttribute productAttribute = new ProductAttribute();
        model.addAttribute("productAttribute", productAttribute);
        return ("/admin/form/add_productattribute");
    }
    
    @PostMapping("/product_attribute/createproduct_attribute")
    public String createCategory(@ModelAttribute("productAttribute") ProductAttribute productAttribute) {
    	productAttributeSV.create(productAttribute);

        System.out.println("thêm thành công");

        return "redirect:/admin/product_attribute";
    }
    
    @GetMapping("/product_attribute/editForm/{id}")
    public String showEditForm(Model model, @PathVariable("id") Long id) {
    	ProductAttribute productAttribute = productAttributeSV.findById(id);
        model.addAttribute("productAttribute", productAttribute);
        return "admin/form/edit_productattribute";
    }
    @PostMapping("/product_attribute/edit/{id}")
    public String editForm(@ModelAttribute("productAttribute") ProductAttribute productAttribute) {
    	productAttributeSV.update(productAttribute);

        System.out.println("cập nhật thành công");

        return "redirect:/admin/product_attribute";
    }
    
    
    @GetMapping("/product_attribute/delete/{id}")
    public String deleteCategory(@PathVariable Long id) {
    	productAttributeSV.deleteByProductId(id);
        return "redirect:/admin/product_attribute";
    }
}
