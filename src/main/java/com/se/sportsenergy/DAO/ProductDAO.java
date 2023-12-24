package com.se.sportsenergy.DAO;

import com.se.sportsenergy.dto.CategoryAmountProductDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.se.sportsenergy.model.Product;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface ProductDAO extends JpaRepository<Product, Long> {

    List<Product> findAllByAvailableTrue();

    @Query("SELECT p FROM Product p ORDER BY p.price")
    Page<Product> findByLowToHighPrice(Pageable pageable);

    @Query("SELECT p FROM Product p ORDER BY p.price DESC")
    Page<Product> findByHighToLowPrice(Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.category.id =?1 ORDER BY p.price DESC")
    Page<Product> findByHighToLowPriceByCate(String cid ,Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.category.id =?1 ORDER BY p.price")
    Page<Product> findByLowToHighPriceByCate(String cid ,Pageable pageable);

    Page<Product> findAllByAvailableTrue(Pageable pageable);
    @Query("SELECT p FROM Product p WHERE p.category.id = ?1")
    List<Product> findByCategoryId(String cid);

    @Query("SELECT p FROM Product p WHERE p.category.id = ?1 AND p.available = true")
    Page<Product> findByCategoryIdPage(String cid, Pageable pageable);

    @Query("SELECT new com.se.sportsenergy.dto.CategoryAmountProductDTO(p.category, COUNT(p.id)) FROM Product p " +
            "WHERE p.available = true AND p.category.available = true GROUP BY p.category")
    List<CategoryAmountProductDTO> findAmountProductsOfCategory();

    @Query("SELECT p FROM Product p ORDER BY p.id DESC LIMIT 8")
    List<Product> findTop8Products();

	Page<Product> findByNameContainingAndAvailableTrue(String keyword, Pageable pageable);
}
