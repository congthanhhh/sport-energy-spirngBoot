package com.se.sportsenergy.service;


import com.se.sportsenergy.model.ProductImage;

import java.util.List;
import java.util.Optional;

public interface ProductImageService {
    List<ProductImage> findAll();

    Optional<ProductImage> findById(Long id);

    List<ProductImage> findImageByProductId(Long id);


    List<ProductImage> create(List<ProductImage> productImage);

    ProductImage create2(ProductImage productImage);

    ProductImage update(Long id, ProductImage productImage);

    void delete(Long id);

    void deleteByProductId(Long id);
}
