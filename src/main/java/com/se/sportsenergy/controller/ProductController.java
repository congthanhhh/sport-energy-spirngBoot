package com.se.sportsenergy.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.se.sportsenergy.dto.CategoryAmountProductDTO;
import com.se.sportsenergy.model.*;
import com.se.sportsenergy.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private ProductImageService productImageService;

	@Autowired
	private ColorService colorService;

	@Autowired
	private SizeService sizeService;

	@Autowired
	private ProductAttributeService productAttributeService;

	@Autowired
	private RatingService ratingService;

	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable("id") Long id, Model model) {
		Product items = productService.findById(id);
		List<ProductImage> productImage = productImageService.findImageByProductId(id);
		List<ProductAttribute> productAttributes = productAttributeService.findProductAttributeByProductId(id);
		List<Product> relatedProducts = items.getCategory().getProduct();

		Map<String, ProductAttribute> uniqueSizes = new LinkedHashMap<>();
		Map<String, ProductAttribute> uniqueColors = new LinkedHashMap<>();

		for (ProductAttribute attribute : productAttributes) {
			uniqueSizes.putIfAbsent(attribute.getSizes().getName(), attribute);
			uniqueColors.putIfAbsent(attribute.getColors().getName(), attribute);
		}

		int countReview = ratingService.findByProductId(id).size();
		model.addAttribute("countReview", countReview);

		model.addAttribute("detailPr", items);
		model.addAttribute("imgPr", productImage);
		model.addAttribute("uniqueSizes", uniqueSizes);
		model.addAttribute("uniqueColors", uniqueColors);
		model.addAttribute("relatedProducts", relatedProducts);

		return "home/product/detail";
	}

	@RequestMapping("/shop")
	public String shop(Model model, @RequestParam("cid") Optional<String> cid,
			@RequestParam("page") Optional<Integer> page, @RequestParam("sort") Optional<String> sort) {
		Pageable pageable = PageRequest.of(page.orElse(0), 12);
		Page<Product> items;
		/* Show product neu chon category */
		if (cid.isPresent()) {
			items = productService.findByCategoryIdPage(cid.get(), pageable);

		} else {
			// Check sort parameter and call the corresponding method
			if (sort.isPresent() && sort.get().equals("lowToHigh")) {
				items = productService.findByLowToHighPrice(pageable);
			} else if (sort.isPresent() && sort.get().equals("highToLow")) {
				items = productService.findByHighToLowPrice(pageable);
			} else {
				items = productService.findAllPage(pageable);
			}
		}
		model.addAttribute("items", items);
		model.addAttribute("cid", cid.orElse(null));
		return "home/product/shop";
	}

	@ModelAttribute("productAttr")
	public List<ProductAttribute> getProductAttribute(Long id) {
		return productAttributeService.findProductAttributeByProductId(id);
	}

	@RequestMapping("/search")
	public String searchProducts(@RequestParam(value = "page", defaultValue = "0") int page,
	                             @RequestParam(value = "keyword", required = false) String keyword,
	                             Model model) {
	    Pageable pageable = PageRequest.of(page, 8);
	    Page<Product> productsPage;

	    if (keyword != null && !keyword.isEmpty()) {
	        productsPage = productService.findProductByNamePage(keyword, pageable);
	    } else {
	        // Nếu không có từ khóa, trả về một trang không có sản phẩm nào
	        productsPage = Page.empty();
	    }

	    model.addAttribute("products", productsPage);
	    model.addAttribute("keyword", keyword);

	    return "home/product/search_results";
	}




	@ModelAttribute("productImage")
	public List<ProductImage> getProductImage() {
		return productImageService.findAll();
	}

	@ModelAttribute("productSize")
	public List<Size> getProductSize() {
		return sizeService.findAll();
	}

	@ModelAttribute("productColor")
	public List<Color> getProductColor() {
		return colorService.findAll();
	}

}
