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

import com.se.sportsenergy.model.Color;
import com.se.sportsenergy.service.ColorService;

@Controller
@RequestMapping("/admin")
public class ColorAdminController {
	@Autowired
    ColorService colorService;
	
    @RequestMapping("/color")
    public String findAllColor(Model model) {
    	List<Color> colors = colorService.findAll();
    	model.addAttribute("colors",colors);
    	return "admin/table/color";
    }
    
    @GetMapping("/color/add_color")
    public String showCreateCategoryForm(Model model) {
        Color color = new Color();
        model.addAttribute("color", color);
        return ("/admin/form/add_color");
    }
    
    @PostMapping("/color/createform")
    public String createColor(@ModelAttribute("color") Color color) {
    	colorService.create(color);

        System.out.println("thêm thành công");

        return "redirect:/admin/color";
    }
    
    @GetMapping("/color/edit_color/{id}")
    public String showEditForm(Model model, @PathVariable("id") Long id) {
    	Color color = colorService.findById(id);
        model.addAttribute("color", color);
        return "admin/form/edit_color";
    }
    @PostMapping("/color/edit_color/{id}")
    public String editForm(@ModelAttribute("color") Color color) {
    	colorService.create(color);

        System.out.println("thêm thành công");

        return "redirect:/admin/color";
    }
    
    
    @GetMapping("/color/delete/{id}")
    public String deleteCategory(@PathVariable Long id) {
    	colorService.delete(id);
        return "redirect:/admin/color";
    }
}

