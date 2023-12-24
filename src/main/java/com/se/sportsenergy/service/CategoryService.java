package com.se.sportsenergy.service;

import com.se.sportsenergy.model.Category;

import java.util.List;

public interface CategoryService {

    List<Category> findAll();
    List<Category> findAllAvailable();

    List<Category> findAllTrue();

    Category findById(String id);

    Category create(Category category);

    Category update(Category category);

    void delete(String id);
    void recoverDelete(String id);
}
