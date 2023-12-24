package com.se.sportsenergy.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.se.sportsenergy.service.*;
import com.se.sportsenergy.model.Account;
import com.se.sportsenergy.model.Favorite;
import com.se.sportsenergy.model.Product;

@Controller
@RequestMapping("product/favorites")
public class FavoriteController {

    private final FavoriteService favoriteService;
    private final ProductService productService;
    private final AccountService accountService; // Thêm dependency injection cho AccountService

    @Autowired
    public FavoriteController(FavoriteService favoriteService, ProductService productService,
            AccountService accountService) {
        this.favoriteService = favoriteService;
        this.productService = productService;
        this.accountService = accountService;
    }

    @PostMapping("/add")
    public ResponseEntity<String> addToFavorites(@RequestParam("productId") Long productId) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        boolean isProductInFavorites = favoriteService.isProductInFavorites(username, productId);

        if (!isProductInFavorites) {
            Product product = productService.findById(productId);
            Account account = accountService.findById(username);

            if (product != null && account != null) {
                Favorite favorite = new Favorite();
                favorite.setProduct(product);
                favorite.setAccount(account);
                favoriteService.addToFavorites(favorite);
                return ResponseEntity.ok("Sản phẩm đã được thêm vào danh sách yêu thích!");
            } else {
                return ResponseEntity.badRequest().body("Không tìm thấy sản phẩm hoặc người dùng");
            }
        } else {
            return ResponseEntity.badRequest().body("Sản phẩm này đã tồn tại trong danh sách yêu thích");
        }
    }

    @GetMapping("/count")
    @ResponseBody
    public ResponseEntity<Long> countFavorites() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        Long favoriteCount = favoriteService.countFavoritesByUsername(username);
        return ResponseEntity.ok(favoriteCount);
    }

    @GetMapping("/{username}")
    public String viewFavorites(@PathVariable("username") String username, Model model) {
        List<Favorite> favorites = favoriteService.findFavoritesByUsername(username);
        model.addAttribute("favorites", favorites); // Truyền danh sách favorite vào Model
        model.addAttribute("username", username);

        return "home/product/favorite";
    }

    @DeleteMapping("/{favoriteId}/remove")
public ResponseEntity<String> removeFavorite(@PathVariable("favoriteId") Long favoriteId) {
    boolean success = favoriteService.removeFavoriteById(favoriteId);

    if (success) {
        return ResponseEntity.ok("Đã xoá sản phẩm khỏi yêu thích!");
    } else {
        return ResponseEntity.badRequest().body("Không thể xoá sản phẩm khỏi yêu thích!");
    }
}


}
