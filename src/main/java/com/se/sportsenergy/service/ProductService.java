package com.se.sportsenergy.service;

import com.se.sportsenergy.dto.CategoryAmountProductDTO;
import com.se.sportsenergy.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ProductService {

    Page<Product> findAllPage(Pageable pageable);

    List<Product> findAll();

    List<Product> findAllAvailable();

    Product findById(Long id);

    List<Product> findByCategoryId(String cid);
    Page<Product> findByCategoryIdPage(String cid, Pageable pageable);

    Product create(Product product);

    Product createProductAndImage(Product product, List<MultipartFile> images);


    Product update(Long id, Product product);

    void delete(Long id);


    void softDelete(Long id);

    void recoverSoftDelete(Long id);

    List<CategoryAmountProductDTO> findAmountProductsOfCategory();


    Product updateProductAndImages(Product product, List<MultipartFile> images);



	Page<Product> findProductByNamePage(String keyword, Pageable pageable);

    List<Product> findTop8Products();

    Page<Product> findByHighToLowPrice(Pageable pageable);

    Page<Product> findByHighToLowPriceByCate(String cid, Pageable pageable);

    Page<Product> findByLowToHighPriceByCate(String cid, Pageable pageable);

    Page<Product> findByLowToHighPrice(Pageable pageable);


}

