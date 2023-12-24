package com.se.sportsenergy.controller.admin;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.sportsenergy.model.Category;
import com.se.sportsenergy.model.Product;
import com.se.sportsenergy.model.ProductImage;
import com.se.sportsenergy.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


import com.se.sportsenergy.model.Color;
import com.se.sportsenergy.model.ProductAttribute;
import com.se.sportsenergy.model.Size;
import com.se.sportsenergy.service.ColorService;
import com.se.sportsenergy.service.ProductAttributeService;
import com.se.sportsenergy.service.SizeService;

@Controller
@RequestMapping("/admin/product")
public class ProductAdminController {

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    ProductImageService productImageService;

    @Autowired
    ProductAttributeService productAttributeService;

    @Autowired
    UploadImageService uploadImageService;


    @RequestMapping()
    public String admin(Model model) {
        List<Product> items = productService.findAllAvailable();
        model.addAttribute("items", items);
        List<ProductImage> items2 = productImageService.findAll();
        model.addAttribute("itemImage", items2);
        return "admin/table/product";
    }


    @RequestMapping("/create")
    public String create(Model model, Product product, @RequestParam("productThumbnail") MultipartFile productThumbnail,
                         @RequestParam("productImage1") MultipartFile productImage1,
                         @RequestParam("productImage2") MultipartFile productImage2,
                         @RequestParam("productImage3") MultipartFile productImage3) {
        // Set giá trị thumbnail cho Product
        product.setThumbnail(productThumbnail != null ? productThumbnail.getOriginalFilename() : null);
        if (productThumbnail != null) {
            String uploadPath = "src/main/resources/static/img/productThumbnail";
            uploadImageService.saveImage(productThumbnail, uploadPath);
        }

        // Tạo danh sách chứa hình ảnh của ProductImage
        List<MultipartFile> productImages = new ArrayList<>();
        if (productImage1 != null) {
            productImages.add(productImage1);
        }
        if (productImage2 != null) {
            productImages.add(productImage2);
        }
        if (productImage3 != null) {
            productImages.add(productImage3);
        }

        // Gọi phương thức trong ProductService để xử lý tạo Product và ProductImage
        productService.createProductAndImage(product, productImages);

        List<Product> items = productService.findAllAvailable();
        model.addAttribute("items", items);
        return "redirect:/admin/product";
    }

    @PostMapping("/update/{productId}")
    public String updateProduct(Model model, @PathVariable Long productId, Product updatedProduct,
                                @RequestParam("productThumbnail") MultipartFile productThumbnail,
                                @RequestParam("productImage1") MultipartFile productImage1,
                                @RequestParam("productImage2") MultipartFile productImage2,
                                @RequestParam("productImage3") MultipartFile productImage3) {
        // Lấy thông tin sản phẩm cần cập nhật từ cơ sở dữ liệu
        Product existingProduct = productService.findById(productId);

        // Cập nhật thông tin sản phẩm
        existingProduct.setName(updatedProduct.getName());
        existingProduct.setDescription(updatedProduct.getDescription());
        existingProduct.setPrice(updatedProduct.getPrice());
        existingProduct.setCategory(updatedProduct.getCategory());
        existingProduct.setAvailable(updatedProduct.getAvailable());

        // Cập nhật hình ảnh thumbnail nếu có
        if (productThumbnail != null) {
            existingProduct.setThumbnail(productThumbnail.getOriginalFilename());
            String uploadPath = "src/main/resources/static/img/productThumbnail";
            uploadImageService.saveImage(productThumbnail, uploadPath);
        }

        // Cập nhật hình ảnh của ProductImage nếu có
        List<MultipartFile> productImages = Arrays.asList(productImage1, productImage2, productImage3);
        productService.updateProductAndImages(existingProduct, productImages);

        List<Product> items = productService.findAllAvailable();
        model.addAttribute("items", items);

        return "redirect:/admin/product";
    }


    @RequestMapping("/delete/{id}")
    public String delete(Model model, @PathVariable("id") Long id) {

        productService.softDelete(id);
        productAttributeService.softDeleteByProductId(id);

        List<Product> items = productService.findAllAvailable();
        model.addAttribute("items", items);
        return "redirect:/admin/product";
    }

    @RequestMapping("/recover/{id}")
    public String recover(Model model, @PathVariable("id") Long id) {

        productService.recoverSoftDelete(id);
        productAttributeService.recoverSoftDeleteByProductId(id);

        List<Product> items = productService.findAllAvailable();
        model.addAttribute("items", items);
        return "redirect:/admin/product";
    }


    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        Product product = productService.findById(id);
        List<ProductImage> productImages = productImageService.findImageByProductId(id);
        model.addAttribute("productImg", productImages);
        model.addAttribute("product", product);
        return "admin/form/edit_product";
    }

    @RequestMapping("/form")
    public String productForm(Model model) {
        Product product = new Product();
        model.addAttribute("product", product);
        return "/admin/form/add_product";
    }

    @ModelAttribute("categories")
    public List<Category> getCategory() {
        return categoryService.findAll();
    }
    
}
