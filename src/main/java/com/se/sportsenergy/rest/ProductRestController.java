package com.se.sportsenergy.rest;

import java.util.List;

import com.se.sportsenergy.service.ProductAttributeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.se.sportsenergy.model.Product;
import com.se.sportsenergy.service.ProductService;

@RestController
@CrossOrigin("*")
@RequestMapping("/rest/products")
public class ProductRestController {

	@Autowired
	ProductService productService;

	@Autowired
	ProductAttributeService productAttributeService;

	@GetMapping
	public ResponseEntity<List<Product>> getAll() {
		return ResponseEntity.ok(productService.findAll());
	}

	@GetMapping("/{id}")
	public ResponseEntity<Product> getOne(@PathVariable("id") Long id) {
		Product product = productService.findById(id);
		if (product == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(product, HttpStatus.OK);
	}

	//
	@PostMapping
	public ResponseEntity<Product> create(@RequestBody Product product) {
		Product createdProduct = productService.create(product);
		if (createdProduct == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(createdProduct, HttpStatus.CREATED);
	}

	@PutMapping("/{id}")
	public ResponseEntity<Product> update(@PathVariable("id") Long id, @RequestBody Product product) {
		Product updatedProduct = productService.update(id, product);
		if (updatedProduct == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(updatedProduct, HttpStatus.OK);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> delete(@PathVariable("id") Long id) {
		productService.delete(id);
		return ResponseEntity.ok().build();
	}

	@PutMapping("/delete/{id}")
	public ResponseEntity<Void> softDelete(@PathVariable("id") Long id) {
		productService.softDelete(id);
		productAttributeService.softDeleteByProductId(id);
		return ResponseEntity.ok().build();
	}

	@PutMapping("/recover/{id}")
	public ResponseEntity<Void> recoverProduct(@PathVariable("id") Long id) {
		productService.recoverSoftDelete(id);
		productAttributeService.recoverSoftDeleteByProductId(id);
		return ResponseEntity.ok().build();
	}

}