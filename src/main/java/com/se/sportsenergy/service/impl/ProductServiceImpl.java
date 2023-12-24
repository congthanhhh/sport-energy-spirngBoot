package com.se.sportsenergy.service.impl;

import com.se.sportsenergy.DAO.ProductDAO;
import com.se.sportsenergy.DAO.ProductImageDAO;
import com.se.sportsenergy.dto.CategoryAmountProductDTO;
import com.se.sportsenergy.model.Product;
import com.se.sportsenergy.model.ProductImage;
import com.se.sportsenergy.service.ProductService;
import com.se.sportsenergy.service.UploadImageService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductDAO productRepository;

    @Autowired
    ProductImageDAO productImageDAO;

    @Autowired
    UploadImageService uploadImageService;

    @Override
    public Page<Product> findAllPage(Pageable pageable) {
        return productRepository.findAllByAvailableTrue(pageable);
    }

    @Override
    public Page<Product> findByHighToLowPrice(Pageable pageable) {
        return productRepository.findByHighToLowPrice(pageable);
    }

    @Override
    public Page<Product> findByHighToLowPriceByCate(String cid, Pageable pageable) {
        return productRepository.findByHighToLowPriceByCate(cid, pageable);
    }

    @Override
    public Page<Product> findByLowToHighPriceByCate(String cid, Pageable pageable) {
        return productRepository.findByLowToHighPriceByCate(cid, pageable);
    }

    @Override
    public Page<Product> findByLowToHighPrice(Pageable pageable) {
        return productRepository.findByLowToHighPrice(pageable);
    }

    @Override
    public Page<Product> findProductByNamePage(String keyword, Pageable pageable) {
        return productRepository.findByNameContainingAndAvailableTrue(keyword, pageable);
    }

    @Override
    public List<Product> findAll() {
        return productRepository.findAllByAvailableTrue();
    }

    @Override
    public List<Product> findAllAvailable() {
        return productRepository.findAll();
    }

    @Override
    public Product findById(Long id) {
        Optional<Product> productOptional = productRepository.findById(id);
        return productOptional.orElse(null);
    }

    @Override
    public List<Product> findByCategoryId(String cid) {
        return productRepository.findByCategoryId(cid);
    }

    @Override
    public Page<Product> findByCategoryIdPage(String cid, Pageable pageable) {
        return productRepository.findByCategoryIdPage(cid, pageable);
    }

    @Override
    public Product create(Product product) {
        return productRepository.save(product);
    }

    @Override
    public Product createProductAndImage(Product product, List<MultipartFile> images) {
        // Lưu thông tin sản phẩm
        Product savedProduct = productRepository.save(product);

        // Lưu các hình ảnh liên quan đến sản phẩm (ProductImage)
        if (images != null && images.size() > 1) {
            List<ProductImage> productImages = new ArrayList<>();
            String productImageUploadPath = "src/main/resources/static/img/productImage";

            for (MultipartFile image : images) {
                ProductImage productImage = new ProductImage();
                productImage.setProduct(savedProduct);
                productImage.setImage(image.getOriginalFilename());
                productImage.setAvailable(productImage.getAvailable());
                productImages.add(productImage);

                // Lưu hình ảnh của ProductImage
                uploadImageService.saveImage(image, productImageUploadPath);
            }
            productImageDAO.saveAll(productImages);
            savedProduct.setProductImages(productImages);
            productRepository.save(savedProduct);
        }

        return savedProduct;
    }


    @Override
    public Product update(Long id, Product product) {

        return productRepository.findById(id)
                .map(updateProduct -> {
                    updateProduct.setName(product.getName());
                    updateProduct.setThumbnail(product.getThumbnail());
                    updateProduct.setPrice(product.getPrice());
                    updateProduct.setCreateDate(product.getCreateDate());
                    updateProduct.setAvailable(product.getAvailable());
                    updateProduct.setCategory(product.getCategory());
                    return productRepository.save(updateProduct);
                })
                .orElse(null);
    }

    @Override
    public void delete(Long id) {
        Optional<Product> productOptional = productRepository.findById(id);
        if (productOptional.isPresent()) {
            productRepository.deleteById(id);
        } else {
            throw new EntityNotFoundException("Product not found with id: " + id);
        }
    }

    @Override
    public void softDelete(Long id) {
        Optional<Product> productOptional = productRepository.findById(id);
        if (productOptional.isPresent()) {
            Product product = productOptional.get();
            product.setAvailable(false);
            productRepository.save(product);
        } else {
            throw new EntityNotFoundException("Product not found with id: " + id);
        }
    }

    @Override
    public void recoverSoftDelete(Long id) {
        Optional<Product> productOptional = productRepository.findById(id);
        if (productOptional.isPresent()) {
            Product product = productOptional.get();
            product.setAvailable(true);
            productRepository.save(product);
        } else {
            throw new EntityNotFoundException("Product not found with id: " + id);
        }
    }

    @Override
    public List<CategoryAmountProductDTO> findAmountProductsOfCategory() {
        return productRepository.findAmountProductsOfCategory();
    }


    @Override
    public Product updateProductAndImages(Product product, List<MultipartFile> images) {
        // Lưu thông tin sản phẩm
        Product updatedProduct = productRepository.save(product);

        // Xóa các hình ảnh cũ của ProductImage
        productImageDAO.deleteImageByProductId(product.getId());

        // Lưu các hình ảnh mới của ProductImage
        if (images != null && images.size() > 0) {
            List<ProductImage> productImages = new ArrayList<>();
            String productImageUploadPath = "src/main/resources/static/img/productImage";

            for (MultipartFile image : images) {
                ProductImage productImage = new ProductImage();
                productImage.setProduct(updatedProduct);
                productImage.setImage(image.getOriginalFilename());
                productImages.add(productImage);

                // Lưu hình ảnh của ProductImage
                uploadImageService.saveImage(image, productImageUploadPath);
            }
            productImageDAO.saveAll(productImages);
            updatedProduct.setProductImages(productImages);
            productRepository.save(updatedProduct);
        }

        return updatedProduct;
    }
    @Override
    public List<Product> findTop8Products() {
        return productRepository.findTop8Products();
    }

}
