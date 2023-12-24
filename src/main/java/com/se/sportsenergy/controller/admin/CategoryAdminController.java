package com.se.sportsenergy.controller.admin;

import com.se.sportsenergy.dto.CategoryAmountProductDTO;
import com.se.sportsenergy.model.Category;
import com.se.sportsenergy.service.CategoryService;
import com.se.sportsenergy.service.ProductService;
import com.se.sportsenergy.service.UploadImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class CategoryAdminController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    private UploadImageService uploadImageService;

    @Autowired
    private ProductService productService;

    @RequestMapping("/categories")
    public String showCategory(Model model){
        List<Category> categories = categoryService.findAllAvailable();
        model.addAttribute("categories", categories);

        List<CategoryAmountProductDTO> amountProductDTOS = productService.findAmountProductsOfCategory();
        model.addAttribute("amountProduct", amountProductDTOS);
        return ("/admin/table/categories");
    }

    @GetMapping("/categories/createform")
    public String showCreateCategoryForm(Model model) {
        Category category = new Category();
        model.addAttribute("category", category);
        return ("/admin/form/add_categories");
    }

    @PostMapping("/categories/createCategories")
    public String createCategory(@ModelAttribute("category") Category category,
                                @RequestParam("img") MultipartFile img) {
        category.setImage(img != null ? img.getOriginalFilename() : null);
        categoryService.create(category);

        if (img != null) {
            String uploadPath = "src/main/resources/static/img/category";
            uploadImageService.saveImage(img, uploadPath);
        }
        System.out.println("thêm thành công");

        return "redirect:/admin/categories";
    }

    @GetMapping("/categories/editForm/{id}")
    public String showEditForm(Model model, @PathVariable("id") String id) {
        Category category = categoryService.findById(id);
        model.addAttribute("category", category);
        return "admin/form/edit_categories";
    }
    @PostMapping("/categories/edit/{id}")
    public String editForm(@ModelAttribute("category") Category category,
                         @RequestParam("img") MultipartFile img) {
        category.setImage(img != null ? img.getOriginalFilename() : null);
        categoryService.create(category);

        if (img != null) {
            String uploadPath = "src/main/resources/static/img/category";
            uploadImageService.saveImage(img, uploadPath);
        }
        System.out.println("thêm thành công");

        return "redirect:/admin/categories";
    }
    @GetMapping("/categories/delete/{id}")
    public String deleteCategory(Model model, @PathVariable String id) {
        categoryService.delete(id);
        List<Category> categories = categoryService.findAllAvailable();
        model.addAttribute("categories", categories);
        return "redirect:/admin/categories";

    }

    @GetMapping("/categories/recover/{id}")
    public String recoverCategory(Model model, @PathVariable String id) {
        categoryService.recoverDelete(id);
        List<Category> categories = categoryService.findAllAvailable();
        model.addAttribute("categories", categories);
        return "redirect:/admin/categories";

    }
}
