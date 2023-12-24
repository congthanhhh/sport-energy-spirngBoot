package com.se.sportsenergy.DAO;

import com.se.sportsenergy.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import com.se.sportsenergy.model.ProductImage;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ProductImageDAO extends JpaRepository<ProductImage,Long>{

    @Query("SELECT p FROM ProductImage p WHERE p.product.id = ?1")
    List<ProductImage> findImageByProductId(Long id);


    @Modifying
    @Transactional
    @Query("DELETE FROM ProductImage p where p.product.id = :id")
    void deleteImageByProductId(@Param("id") Long id);

    void deleteByProduct(Product product);

}
