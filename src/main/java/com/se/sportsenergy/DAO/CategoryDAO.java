package com.se.sportsenergy.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.se.sportsenergy.model.Category;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CategoryDAO extends JpaRepository<Category,String>{
    @Query("SELECT o FROM Category o WHERE o.available = true")
    List<Category> findAllTrue();

}
