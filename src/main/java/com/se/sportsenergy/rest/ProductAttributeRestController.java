package com.se.sportsenergy.rest;

import com.se.sportsenergy.DAO.ProductAttributeDAO;
import com.se.sportsenergy.model.ProductAttribute;
import com.se.sportsenergy.service.ProductAttributeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("rest/attribute")
public class ProductAttributeRestController {

    @Autowired
    ProductAttributeService productAttributeService;

    @GetMapping
    public ResponseEntity<List<ProductAttribute>> getAll() {
        List<ProductAttribute> productAttributes = productAttributeService.findAll();
        return new ResponseEntity<>(productAttributes, HttpStatus.OK);
    }

    @GetMapping("/{productId}/{colorId}/{sizeId}")
    public ResponseEntity<ProductAttribute> getOneProAtt(@PathVariable Long productId, @PathVariable Long colorId, @PathVariable Long sizeId) {
        ProductAttribute productAttribute = productAttributeService.findProductSizeAndColorById(productId, colorId, sizeId);
        if (productAttribute == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(productAttribute, HttpStatus.OK);
    }

//    @GetMapping("/{id}")
//    public ResponseEntity<ProductAttribute> findById(@PathVariable Long id) {
//        Optional<ProductAttribute> productAttribute = productAttributeService.findById(id);
//        if (productAttribute.isPresent()) {
//            return ResponseEntity.ok(productAttribute.get());
//        } else {
//            return ResponseEntity.notFound().build();
//        }
//    }


    @GetMapping("/product/{productId}")
    public ResponseEntity<List<ProductAttribute>> findByProductId(@PathVariable Long productId) {
        List<ProductAttribute> productAttribute = productAttributeService.findProductAttributeByProductId(productId);
        if (!productAttribute.isEmpty()) {
            return ResponseEntity.ok(productAttribute);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PutMapping("/stock/{quantity}/{productId}/{colorId}/{sizeId}")
    public ResponseEntity<Void> updateStock(@PathVariable Long quantity, @PathVariable Long productId,
                                            @PathVariable Long colorId, @PathVariable Long sizeId) {
        productAttributeService.updateStockById(quantity, productId, colorId, sizeId);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}