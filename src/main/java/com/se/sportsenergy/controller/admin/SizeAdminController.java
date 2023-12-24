package com.se.sportsenergy.controller.admin;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.sportsenergy.model.Size;
import com.se.sportsenergy.service.SizeService;

@Controller
@RequestMapping("/admin")
public class SizeAdminController {
	@Autowired
    SizeService sizeService;
    
    @GetMapping("/size")
    public String findAllSize(Model model) {
    	List<Size> sizes = sizeService.findAll();
    	model.addAttribute("sizes",sizes);
    	return "admin/table/size";
    }
    
    @GetMapping("/size/add_size")
    public String showCreateCategoryForm(Model model) {
        Size size = new Size();
        model.addAttribute("size", size);
        return ("admin/form/add_size");
    }
    
    @PostMapping("/size/createsize")
    public String createCategory(@ModelAttribute("size") Size size) {
    	sizeService.create(size);

        System.out.println("thêm thành công");

        return "redirect:/admin/size";
    }
    
    @GetMapping("/size/edit_size/{id}")
    public String showEditForm(Model model, @PathVariable("id") Long id) {
    	Size size = sizeService.findById(id);
        model.addAttribute("size", size);
        return "admin/form/edit_size";
    }
    @PostMapping("/size/edit_size/{id}")
    public String editForm(@ModelAttribute("size") Size size) {
    	sizeService.create(size);

        System.out.println("thêm thành công");

        return "redirect:/admin/size";
    }
    
    
    @GetMapping("/size/delete/{id}")
    public String deleteCategory(@PathVariable Long id) {
    	sizeService.delete(id);
        return "redirect:/admin/size";
    }
}
