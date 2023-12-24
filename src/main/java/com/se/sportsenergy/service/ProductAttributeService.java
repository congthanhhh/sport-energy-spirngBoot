package com.se.sportsenergy.service;


import com.se.sportsenergy.model.ProductAttribute;

import java.util.List;
import java.util.Optional;

public interface ProductAttributeService {

    List<ProductAttribute> findProductAttributeByProductId(Long id);


    ProductAttribute findById(Long id);

    ProductAttribute findProductSizeAndColorById(Long productId, Long colorId, Long sizeId);

    void updateStockById(Long quantity, Long productId, Long colorId, Long sizeId);

    List<ProductAttribute> findAll();

    List<ProductAttribute> findAllAvailableTrue();

    void deleteByProductId(Long id);

    void softDeleteByProductId(Long id);

    void recoverSoftDeleteByProductId(Long id);

    ProductAttribute create(ProductAttribute productAttribute);


	ProductAttribute update(ProductAttribute productAttribute);
}
