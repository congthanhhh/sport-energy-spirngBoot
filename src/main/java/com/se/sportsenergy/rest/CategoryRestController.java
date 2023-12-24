package com.se.sportsenergy.rest;

import com.se.sportsenergy.model.Category;
import com.se.sportsenergy.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/rest/category")
public class CategoryRestController {

    @Autowired
    CategoryService categoryService;

    @GetMapping
    List<Category> getAll() {
        return categoryService.findAll();
    }

    @GetMapping("{id}")
    public Category getOne(@PathVariable("id") String id) {
        return categoryService.findById(id);
    }

    @PostMapping
    public Category create(@RequestBody Category category) {
        return categoryService.create(category);
    }
    @PutMapping("/{id}")
    public Category update(@PathVariable("id") String id, @RequestBody Category category) {
        return categoryService.update(category);
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") String id) {
        categoryService.delete(id);
    }
}
