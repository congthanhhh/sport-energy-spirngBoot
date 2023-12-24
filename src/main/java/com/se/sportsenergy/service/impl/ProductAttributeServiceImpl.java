package com.se.sportsenergy.service.impl;

import com.se.sportsenergy.DAO.ProductAttributeDAO;
import com.se.sportsenergy.model.ProductAttribute;
import com.se.sportsenergy.service.ProductAttributeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductAttributeServiceImpl implements ProductAttributeService {

    @Autowired
    ProductAttributeDAO productAttributeRepository;

    @Override
    public List<ProductAttribute> findProductAttributeByProductId(Long id) {
        return productAttributeRepository.findProductAttributeByProductId(id);
    }
    @Override
    public ProductAttribute findById(Long id) {
    	Optional<ProductAttribute> productOptional = productAttributeRepository.findById(id);
        return productOptional.orElse(null);
    }
    @Override
    public ProductAttribute findProductSizeAndColorById(Long productId, Long colorId, Long sizeId) {
        Optional<ProductAttribute> productOptional = productAttributeRepository.findProductSizeAndColorById(productId, colorId, sizeId);
        return productOptional.orElse(null);
    }

    @Override
    public void updateStockById(Long quantity,Long productId, Long colorId, Long sizeId) {
        productAttributeRepository.updateStockById(quantity, productId, colorId, sizeId);
    }

    @Override
    public List<ProductAttribute> findAll() {
        return productAttributeRepository.findAll();
    }

    @Override
    public List<ProductAttribute> findAllAvailableTrue() {
        return productAttributeRepository.findAllTrue();
    }

    @Override
    public void deleteByProductId(Long id) {
        productAttributeRepository.deleteAttributeByProductId(id);
    }

    @Override
    public void softDeleteByProductId(Long id) {
        List<ProductAttribute> productAttributes = productAttributeRepository.findProductAttributeByProductId(id);
        for (ProductAttribute pa : productAttributes) {
            pa.setAvailable(false);
            productAttributeRepository.save(pa);
        }
    }

    @Override
    public void recoverSoftDeleteByProductId(Long id) {
        List<ProductAttribute> productAttributes = productAttributeRepository.findProductAttributeByProductId(id);
        for (ProductAttribute pa : productAttributes) {
            pa.setAvailable(true);
            productAttributeRepository.save(pa);
        }
    }
	@Override
	public ProductAttribute create(ProductAttribute productAttribute) {
		return  productAttributeRepository.save(productAttribute);
	}
	@Override
	public ProductAttribute update(ProductAttribute productAttribute) {
		ProductAttribute pa = productAttributeRepository.findById(productAttribute.getId()).get();
		pa.setStock(productAttribute.getStock());
		return productAttributeRepository.save(pa);
	}
	
}
