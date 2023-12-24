package com.se.sportsenergy.service.impl;

import com.se.sportsenergy.DAO.AccountDAO;
import com.se.sportsenergy.DAO.FavoriteRepository;
import com.se.sportsenergy.DAO.ProductDAO;
import com.se.sportsenergy.model.Account;
import com.se.sportsenergy.model.Favorite;
import com.se.sportsenergy.model.Product;
import com.se.sportsenergy.service.FavoriteService;
import com.se.sportsenergy.service.ProductService;

import jakarta.transaction.Transactional;

import java.security.PublicKey;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FavoriteServiceImpl implements FavoriteService {

    private final FavoriteRepository favoriteRepository;
    private final ProductService productService; // ProductService để lấy thông tin sản phẩm

    @Autowired
    public FavoriteServiceImpl(FavoriteRepository favoriteRepository, ProductService productService) {
        this.favoriteRepository = favoriteRepository;
        this.productService = productService;
    }

    @Override
    public void addToFavorites(Favorite favorite) {
        favoriteRepository.save(favorite);
    }

    @Override
    public boolean isProductInFavorites(String username, Long productId) {
        return favoriteRepository.existsByAccountUsernameAndProduct_Id(username, productId);
    }

    @Override
    public List<Favorite> findFavoritesByUsername(String username) {
        List<Favorite> favorites = favoriteRepository.findByAccountUsername(username);
        for (Favorite favorite : favorites) {
            Product product = productService.findById(favorite.getProduct().getId());
            favorite.setProduct(product); // Cập nhật thông tin sản phẩm vào mỗi favorite
        }
        return favorites;
    }

    @Override
    public Long countFavoritesByUsername(String username) {
        return favoriteRepository.countByAccountUsername(username);
    }

    
    @Override
    public boolean removeFavoriteById(Long favoriteId) {
        Optional<Favorite> favoriteOptional = favoriteRepository.findById(favoriteId);

        if (favoriteOptional.isPresent()) {
            favoriteRepository.deleteById(favoriteId);
            return true; // Xoá thành công
        } else {
            return false; // Không tìm thấy sản phẩm yêu thích
        }
    }
}