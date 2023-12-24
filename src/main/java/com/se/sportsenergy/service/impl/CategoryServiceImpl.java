package com.se.sportsenergy.service.impl;

import com.se.sportsenergy.DAO.CategoryDAO;
import com.se.sportsenergy.DAO.ProductDAO;
import com.se.sportsenergy.model.Category;
import com.se.sportsenergy.model.Product;
import com.se.sportsenergy.service.CategoryService;
import com.se.sportsenergy.service.ProductService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryDAO categoryDAO;
    @Autowired
    ProductService productService;

    @Override
    public List<Category> findAll() {
        return categoryDAO.findAll();
    }
    @Override
    public List<Category> findAllAvailable() {
        return categoryDAO.findAll();
    }
    @Override
    public List<Category> findAllTrue() {return categoryDAO.findAllTrue(); }

    @Override
    public Category findById(String id) {
        return categoryDAO.findById(id).get();
    }

    @Override
    public Category create(Category category) {
        return categoryDAO.save(category);
    }

    @Override
    public Category update(Category category) {
        return categoryDAO.save(category);
    }

    @Override
    public void delete(String id) {
        Optional<Category> categoryOptional = categoryDAO.findById(id);
        List<Product> listProduct =productService.findByCategoryId(id);
        for (Product p: listProduct) {
            p.setAvailable(false);
        }
        if (categoryOptional.isPresent()) {
            Category category = categoryOptional.get();
            category.setAvailable(false);
            categoryDAO.save(category);
        } else {
            throw new EntityNotFoundException("Category not found with id: " + id);
        }
    }

    @Override
    public void recoverDelete(String id) {
        Optional<Category> categoryOptional = categoryDAO.findById(id);
        List<Product> listProduct =productService.findByCategoryId(id);
        for (Product p: listProduct) {
            p.setAvailable(true);
        }
        if (categoryOptional.isPresent()) {
            Category category = categoryOptional.get();
            category.setAvailable(true);
            categoryDAO.save(category);
        } else {
            throw new EntityNotFoundException("Category not found with id: " + id);
        }
    }
}
